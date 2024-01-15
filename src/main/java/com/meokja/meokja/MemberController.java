package com.meokja.meokja;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.meokja.dao.MemberDAO;
import com.meokja.vo.MemberVO;


@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private MemberVO mo;
	
	@RequestMapping(value = "/memberServlet", method = RequestMethod.POST)
	@ResponseBody
	
	public String memberServlet(HttpServletRequest request, Model model, HttpServletResponse response, MemberVO memberVO, HttpSession session) {
		logger.info("PageController의 memberServlet()");
		MemberDAO mapper = sqlSession.getMapper(MemberDAO.class);
		logger.info("{} line39", memberVO);
		
		int result = mapper.IDCheck(memberVO);
		// 1있다. 0 없다.
		logger.info("{} line129", result);
		
		return String.valueOf(result);
	}
	
	@RequestMapping("/member")
	public String member(MultipartHttpServletRequest request, Model model, MemberVO memberVO, HttpServletResponse response) throws IOException {
		logger.info("MemberController의 member()");
		MemberDAO mapper = sqlSession.getMapper(MemberDAO.class);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		logger.info("{} line49", memberVO);
		
		String rootUplordDir = "C:" + File.separator + "upload" + File.separator + "memberphoto"; // C:\Upload\memberphoto
		logger.info("uploadDirectory: {}", rootUplordDir);
		
		Iterator<String> iterator = request.getFileNames();
	   
		MultipartFile multipartFile = null;
	    String uploadFilename = iterator.next();
	    multipartFile = request.getFile(uploadFilename);
	    logger.info("aaa: {}", multipartFile);
//	    logger.info("uploadFilename: {}", uploadFilename);
	    String originalName = multipartFile.getOriginalFilename();
	    logger.info("originalName: {}", originalName);
	    
	    String photo = uploadFile(originalName);
	    if(originalName != null && originalName.length() != 0) {
	    	try {
	    		multipartFile.transferTo(new File(rootUplordDir + File.separator + photo));
	        } catch (Exception e) {}
	    } else {
	    	photo = "default.jpg";
	    }
	    
	    memberVO.setPhoto(photo);
		mapper.memberInsert(memberVO);
		
		out.println("<script>");
		out.println("alert('회원 가입을 축하드립니다~!')");
		out.println("location.href='loginPage'");
		out.println("</script>");
		out.flush();
		return "login";
	}
	
	
	@RequestMapping("/myProfileOK")
	public void myProfileOK(MultipartHttpServletRequest request, HttpSession session, Model model, MemberVO memberVO, HttpServletResponse response) throws IOException {
		logger.info("MemberController의 myProfileOK()");
		MemberDAO mapper = sqlSession.getMapper(MemberDAO.class);
		
		logger.info("{} line175", memberVO);
		String rootUplordDir = "C:" + File.separator + "upload" + File.separator + "memberphoto"; // C:\Upload\memberphoto
		
		Iterator<String> iterator = request.getFileNames();
		MultipartFile multipartFile = null;
		String uploadFilename = iterator.next();
		multipartFile = request.getFile(uploadFilename);
		String originalName = multipartFile.getOriginalFilename();
		logger.info("originalName: {}", originalName);
		
		// mo에 저장된 랜덤 사진이름 가져오기
//		MemberVO mo = (MemberVO) session.getAttribute("mo");
//		String randomPhotoName = mo.getPhoto().substring(0, 37);
//		String photo = randomPhotoName + originalName;

		String photo = uploadFile(originalName);
		String defaultImgCheck = request.getParameter("defaultImgCheck");
		if(originalName != null && originalName.length() != 0) {
	          try {
	             multipartFile.transferTo(new File(rootUplordDir + File.separator + photo));
	           } catch (Exception e) {}
	       } else if(defaultImgCheck.equals("N")) {
	          photo = "default.jpg";
	       } else {
	          photo = mo.getPhoto();
	       }
		memberVO.setPhoto(photo);
		logger.info("{}", memberVO);
        mapper.myProfileUpdate(memberVO);
//		
        MemberVO user = mapper.selectById(memberVO.getMember_id());
        
		session.setAttribute("user", user);
		PrintWriter out = getPrintWriter(response);
		out.println("<script>");
		out.println("alert('" + user.getName() + " 님 개인 정보가 수정되었습니다 ~!')");
		out.println("location.href='list'");
		out.println("</script>");
		out.flush();
	}
	
	
//	PrintWriter
	private PrintWriter getPrintWriter(HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
	    return out;
	}
	
	private String uploadFile(String originalName) {
		UUID uuid = UUID.randomUUID();
		String savedName =  uuid.toString()+"_"+originalName;
	    return savedName;
	}
}
