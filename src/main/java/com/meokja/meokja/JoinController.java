	
package com.meokja.meokja;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.meokja.api.NaverSMTP;
import com.meokja.dao.JoinDAO;
import com.meokja.dao.PartyDAO;
import com.meokja.vo.JoinList;
import com.meokja.vo.JoinVO;
import com.meokja.vo.MemberVO;
import com.meokja.vo.PartyList;
import com.meokja.vo.PartyVO;


@Controller
public class JoinController {
	
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	JoinVO joinVO;
	@Autowired
	MemberVO user;
	
	@Autowired
	@Qualifier("partyVO")
	PartyVO vo;
	
	@Autowired
	JoinList joinList;
	@Autowired
	PartyList partyList;
	

	@RequestMapping(value = "/joinInsert", method = RequestMethod.POST)
	public String joinInsert(HttpServletRequest request, HttpSession session, Model model, JoinVO joinVO) {
		logger.info("JoinController의 joinInsert()");
		
		JoinDAO mapper = sqlSession.getMapper(JoinDAO.class);
		
		// 세션에 저장된 회원정보
		user = (MemberVO) session.getAttribute("user");
		
		joinVO.setMember_id(user.getMember_id());
		logger.info("{} line59", joinVO);
		
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		logger.info("{} line35", currentPage);
		mapper.joinInsert(joinVO);
		
		return "redirect:selectByIdx?party_id=" +joinVO.getParty_id()+ "&currentPage=" + currentPage+ "&job=article";
	}
	
	@RequestMapping(value = "/joinServlet", method = RequestMethod.POST)
	@ResponseBody
	public String repleServlet(HttpServletRequest request, Model model, PartyVO partyVO) {
		logger.info("JoinController의 joinServlet()");
		JoinDAO mapper = sqlSession.getMapper(JoinDAO.class);
		logger.info("{} line134", partyVO);
		
		// 세션에 저장된 회원정보
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		
// 수정할 코드
		int result = 0;
//		int result = mapper.selectById_Idx(reportVO);
		// 1있다. 0 없다.
		logger.info("{} line140", result);
		
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "/joinOK", method = RequestMethod.GET)
	public void joinOK(HttpServletRequest request, HttpServletResponse response, Model model, JoinVO joinVO) throws IOException {
		logger.info("JoinController의 joinOK()");
		logger.info("line104 {}", joinVO);
		
		JoinDAO joinMapper = sqlSession.getMapper(JoinDAO.class);
		PartyDAO partyMapper = sqlSession.getMapper(PartyDAO.class);
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int limitNum = joinVO.getLimitNum();
		int count = joinVO.getCount();
		
		// 해당 join
		joinVO = joinMapper.selectByJoin_id(joinVO);
		vo = partyMapper.selectByParty_id(joinVO.getParty_id());
		
		// 메일 보내기
		String from = "ajrwkd1@naver.com";
		String to = joinVO.getEmail(); 
		String subject = "신청하신 모임의 참여가 승인되었습니다.";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		String mealed_at = sdf.format(vo.getMealed_at());
		String content = joinVO.getMember_id() + "님 신청하신 " + mealed_at + " 모임 참여가 승인되었습니다.";
		
		// 폼값(이메일 내용) 저장
		Map<String, String> emailInfo = new HashMap<String, String>();
		emailInfo.put("from", from);		// 보내는 사람
		emailInfo.put("to", to);			// 받는 사람
		emailInfo.put("subject", subject);	// 제목
		emailInfo.put("content", content);
		emailInfo.put("format", "text/plain;charset=UTF-8");
		logger.info("line137 {}", emailInfo);
		try {
			NaverSMTP smtpServer = new NaverSMTP();	// 메일 전송 클래스 생성
			smtpServer.emailSending(emailInfo);		// 전송
			System.out.print("이메일 전송 성공");
		} catch (Exception e) {
			System.out.print("이메일 전송 실패");
		}

		PrintWriter out = getPrintWriter(response);
		// 참여 승인
		if(limitNum == count+1) {
			joinMapper.deleteJoin(joinVO);
		}
		joinMapper.joinGrant(joinVO);
		out.println("<script>");
		out.println("alert('승인 완료!!!')");
		out.println("location.href='selectByIdx?party_id=" +joinVO.getParty_id()+ "&currentPage=" +currentPage+ "&job=article'");
		out.println("</script>");
		out.flush();
	}
	
	@RequestMapping(value = "/joinNO", method = RequestMethod.GET)
	public void joinNO(HttpServletRequest request, HttpServletResponse response, Model model, JoinVO joinVO) throws IOException {
		logger.info("JoinController의 joinNO()");
		logger.info("line157 {}", joinVO);
		
		JoinDAO joinMapper = sqlSession.getMapper(JoinDAO.class);
		PartyDAO partyMapper = sqlSession.getMapper(PartyDAO.class);
		
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		logger.info("{} line35", currentPage);
		joinVO = joinMapper.selectByJoin_id(joinVO);
		logger.info("line116 {}", joinVO);
		vo = partyMapper.selectByParty_id(joinVO.getParty_id());
		logger.info("line118 {}", vo);
		
		// 메일 보내기
		String from = "ajrwkd1@naver.com";
		String to = joinVO.getEmail(); 
		String subject = "신청하신 모임의 참여가 거절되었습니다.";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		String mealed_at = sdf.format(vo.getMealed_at());
		String content = joinVO.getMember_id() + "님 신청하신 " + mealed_at + " 모임 참여가 거절되었습니다.";
		
		// 폼값(이메일 내용) 저장
		Map<String, String> emailInfo = new HashMap<String, String>();
		emailInfo.put("from", from); // 보내는 사람
		emailInfo.put("to", to); // 받는 사람
		emailInfo.put("subject", subject); // 제목
		emailInfo.put("content", content);
		emailInfo.put("format", "text/plain;charset=UTF-8");
		logger.info("line137 {}", emailInfo);
		try {
			NaverSMTP smtpServer = new NaverSMTP(); // 메일 전송 클래스 생성
			smtpServer.emailSending(emailInfo); // 전송
			System.out.print("이메일 전송 성공");
		} catch (Exception e) {
			System.out.print("이메일 전송 실패");
			e.printStackTrace();
		}
		
		PrintWriter out = getPrintWriter(response);
		joinMapper.joinReject(joinVO);
		out.println("<script>");
		out.println("alert('거절 완료!!!')");
 		out.println("location.href='selectByIdx?party_id=" +joinVO.getParty_id()+ "&currentPage=" +currentPage+ "&job=article'");
		out.println("</script>");
		out.flush();
	}
	
	
	@RequestMapping(value = "/joinCHK", method = RequestMethod.POST)
	@ResponseBody
	public String joinCHK(HttpServletRequest request, HttpServletResponse response, Model model, JoinVO joinVO, HttpSession session) {
		logger.info("line205 {}", joinVO);
		
		JoinDAO mapper = sqlSession.getMapper(JoinDAO.class);
		user = (MemberVO) session.getAttribute("user");
		joinVO.setMember_id(user.getMember_id());
		int result = mapper.joinCHK(joinVO);
		
		return String.valueOf(result);
	}
	
	private PrintWriter getPrintWriter(HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
	    return out;
	}
}
