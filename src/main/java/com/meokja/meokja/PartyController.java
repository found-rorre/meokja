package com.meokja.meokja;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.meokja.dao.JoinDAO;
import com.meokja.dao.MemberDAO;
import com.meokja.vo.JoinList;
import com.meokja.vo.JoinVO;
import com.meokja.vo.MemberVO;
import com.meokja.vo.Param;
import com.meokja.vo.PartyList;
import com.meokja.vo.PartyVO;
import com.meokja.vo.ReportVO;
import com.meokja.dao.PartyDAO;
import com.meokja.dao.ReportDAO;


@Controller
public class PartyController {
	
	private static final Logger logger = LoggerFactory.getLogger(PartyController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	MemberVO user;
	@Autowired
	JoinVO joinVO;
	@Autowired
	PartyVO partyVO;
	@Autowired
	MemberVO memberVO;
	@Autowired
	ReportVO reportVO;
	@Autowired
	JoinList joinList;
	@Autowired
	PartyList partyList;
	
//	검색어 없는 요청
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listGET(Model model, Param param) {
		
		logger.info("line60 {}", param);
//		페이지 변경 요청
		if(param.getLocal_category() != null && param.getLocal_category() != "") {
			listPOST(model, param);
			return"list";
		}
		
		logger.info("PartyController의 listGET()");
		PartyDAO mapper = sqlSession.getMapper(PartyDAO.class);
		logger.info("line46 {}", param);

		// 검색어 없이 처음 list를 요청한 경우
		int currentPage = param.getCurrentPage();
		int totalCount = mapper.selectCount();

		partyList.initPartyList(totalCount, currentPage);
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", partyList.getStartNo());
		hmap.put("endNo", partyList.getEndNo());
		partyList.setList(mapper.selectList(hmap));

		logger.info("line67 {}", partyList);
		
		model.addAttribute("partyList", partyList);
		model.addAttribute("sliderList", sliderList(mapper));
		model.addAttribute("currentPage", currentPage);
		System.out.println(new ReportVO());
		return"list";
	}

//	검색버튼 누른 검색어 요청
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public String listPOST(Model model, Param param) {
		
		logger.info("PartyController의 listPOST()");
		PartyDAO mapper = sqlSession.getMapper(PartyDAO.class);
		logger.info("line80 {}", param);
		
		int currentPage = param.getCurrentPage();
		int totalCount = mapper.selectCountMulti(param);
//		logger.info("line86 {}", totalCount);

		partyList.initPartyList(totalCount, currentPage);
		param.setStartNo(partyList.getStartNo());
		param.setEndNo(partyList.getEndNo());
		partyList.setList(mapper.selectListMulti(param));
		logger.info("totalCount : {}", partyList);
		
		model.addAttribute("partyList", partyList);
		model.addAttribute("sliderList", sliderList(mapper));
		model.addAttribute("location", param.getLocal_category());
		model.addAttribute("condition", param.getCondition());
		model.addAttribute("category", param.getFood_category());
		model.addAttribute("item", param.getItem());
		
		
		return"list";
	}
	
	@RequestMapping("/selectByIdx")
	public String selectByIdx(HttpServletResponse response, HttpServletRequest request, Model model, HttpSession session) throws IOException {
		logger.info("PartyController의 selectByIdx()");
		PrintWriter out = getPrintWriter(response);
		
		user = (MemberVO) session.getAttribute("user");
//		로그인이 되어있지 않을 경우
		if (user == null) {
			out.print("<script>");
			out.print("alert('로그인이 필요한 서비스 입니다.');");
			out.print("location.href = 'loginPage';");
			out.print("</script>");
			out.flush();
		}else {
			
			PartyDAO partyMapper = sqlSession.getMapper(PartyDAO.class);
			MemberDAO memberMapper = sqlSession.getMapper(MemberDAO.class);
			ReportDAO ReportMapper = sqlSession.getMapper(ReportDAO.class);
			JoinDAO joinMapper = sqlSession.getMapper(JoinDAO.class);
			
			
//		넘어오는 데이터 2가지 받기		
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			int	party_id = Integer.parseInt(request.getParameter("party_id"));
			System.out.println(party_id);
//		메인글 1건을 얻어오는 메소드를 호출한다.	
			partyVO = partyMapper.selectByParty_id(party_id);
			
//		메인글 1건의 종속한 Join List를 얻어온다.
			joinList.setList(joinMapper.selectJoinList(party_id));
			logger.info("line162 {}", joinList);
			logger.info("line162 {}", joinMapper.selectJoinList(party_id));
			
//		메인글의 모임장 정보를 가져온다.
			System.out.println(partyVO);
			memberVO = memberMapper.selectById(partyVO.getMember_id());
			logger.info("line162 {}", memberVO);
			
//		메인글의 내가 신고한 내역이 있는지 확인한다.
			reportVO.setMember_id(user.getMember_id());
			reportVO.setParty_id(party_id);
			logger.info("line167 {}", reportVO);
//		메인글 1건의 종속한 report DB 중 회원정보한 일치한 report 조회
			int reportCount = ReportMapper.reportCount(reportVO);
			
			String isReport = reportCount == 0 ? "N" : "Y";
			logger.info("{} line254", isReport);
			
			model.addAttribute("master", memberVO);
			model.addAttribute("isReport", isReport);
			model.addAttribute("joinList", joinList);
			model.addAttribute("vo", partyVO);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("enter", "\r\n");
		}

		String job = request.getParameter("job");
		
		return job;
		
	}
	
	@RequestMapping("/partyInsert")
	public String partyInsert(MultipartHttpServletRequest request, Model model, HttpSession session, PartyVO partyVO) {
		logger.info("PartyController의 partyInsert()");
		PartyDAO partyMapper = sqlSession.getMapper(PartyDAO.class);
		logger.info("{}", partyVO);
		
		String rootUplordDir = "C:" + File.separator + "upload" + File.separator + "thumbnail"; // C:\Upload\thumbnail
	    
		Iterator<String> iterator = request.getFileNames();
	    MultipartFile multipartFile = null;
	    String uploadFilename = iterator.next();
	    multipartFile = request.getFile(uploadFilename);
//	    logger.info("uploadFilename: {}", uploadFilename);
	    String originalName = multipartFile.getOriginalFilename();
//	    logger.info("originalName: {}", originalName);
	    String photo = uploadFile(originalName);
	    logger.info("photo: {}", photo);
	    
	    if(originalName != null && originalName.length() != 0) {
	    	try {
	    		multipartFile.transferTo(new File(rootUplordDir + File.separator + photo));
	        } catch (Exception e) {}
	    }
	      
	    logger.info("{}", partyVO);
	    String dateObject1 = request.getParameter("dateObject1");
	    String dateObject2 = request.getParameter("dateObject2"); 
	    String combinedDateTimeString1 = dateObject1 + " " + dateObject2;
	    SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	    Date mealDate = null;
	    try {
	        mealDate = dateTimeFormat.parse(combinedDateTimeString1);
	        System.out.println(mealDate);
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }
	    partyVO.setMealed_at(mealDate);
	    partyVO.setThumbnail(photo);
	      
//	    logger.info("{}", party VO);
	    
	    partyMapper.insert(partyVO);
	    
	    user = (MemberVO) session.getAttribute("user");
	    
	    return "redirect:list";
	}
	   
	@RequestMapping("/mylist")
	public String mylist(HttpServletRequest request, Model model, HttpSession session) {
		logger.info("PartyController의 mylist()");
		PartyDAO partyMapper = sqlSession.getMapper(PartyDAO.class);
		
		user = (MemberVO) session.getAttribute("user");
		
		logger.info("line251 {}", user);
//		생성한 모임 리스트
		PartyList list_create = new PartyList();
		list_create.setList(partyMapper.create_myList(user));
		logger.info("line255 {}", list_create);
		
//		참여한 모임 리스트
		PartyList list_join = new PartyList();
		list_join.setList(partyMapper.join_myList(user));
		logger.info("line260 {}", list_join);
		
		
//		평가할 모임 리스트
		PartyList list_score = new PartyList();
		list_score.setList(partyMapper.score_myList(user));
		
		logger.info("line260 {}", list_score);
		
//		생성한 모임 리스트
		model.addAttribute("list_create", list_create);
//		참여한 모임 리스트
		model.addAttribute("list_join", list_join);
//		평가할 모임 리스트
		model.addAttribute("list_score", list_score);
		
		return "mylist";
	}
	
	
	@RequestMapping("/partyUpdate")
	public void partyUpdate(HttpServletResponse response, HttpServletRequest request, PartyVO partyVO) throws IOException {
		logger.info("PartyController의 partyUpdate()");
		logger.info("line272 {}", partyVO);
		
		PartyDAO mapper = sqlSession.getMapper(PartyDAO.class);
		PrintWriter out = getPrintWriter(response);
		
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		mapper.partyUpdate(partyVO);
		
		out.println("<script>");
		out.println("alert('수정완료!!!')");
		out.println("location.href='selectByIdx?party_id="+partyVO.getParty_id()+"&currentPage="+currentPage+"&job=article'");
		out.println("</script>");
		out.flush();
		
	}
	
	@RequestMapping("/partyDelete")
	public void partyDelete(HttpServletResponse response, HttpServletRequest request, PartyVO partyVO) throws IOException {
		logger.info("PartyController의 partyDelete()");
		
		PartyDAO mapper = sqlSession.getMapper(PartyDAO.class);
		PrintWriter out = getPrintWriter(response);
		
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		mapper.partyDelete(partyVO);
		
		out.println("<script>");
		out.println("alert('삭제완료!!!')");
		out.println("location.href='list'");
		out.println("</script>");
		out.flush();
		
	}
	
//	파일명 랜덤생성 메소드
	private String uploadFile(String originalName) {
		UUID uuid = UUID.randomUUID();
		String savedName =  uuid.toString()+"_"+originalName;
	    return savedName;
	}
//	list 상단의 슬라이더 생성 메소드
	private PartyList sliderList(PartyDAO mapper) {
		PartyList list = new PartyList();
		list.setList(mapper.selectSlider());
	    return list;
	}
//	PrintWriter
	private PrintWriter getPrintWriter(HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
	    return out;
	}
}
