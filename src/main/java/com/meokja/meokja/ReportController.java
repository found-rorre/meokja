package com.meokja.meokja;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.meokja.dao.PartyDAO;
import com.meokja.dao.ReportDAO;
import com.meokja.vo.MemberVO;
import com.meokja.vo.ReportVO;


@Controller
public class ReportController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	
	
	@Autowired
	private SqlSession sqlSession; 
	
	@RequestMapping("/reportInsert")
	public void reportInsert(HttpServletRequest request, HttpServletResponse response, HttpSession session, ReportVO reportVO) throws IOException {
		logger.info("ReportController의 reportInsert()");
		logger.info("46line {}",reportVO);
		
		ReportDAO mapper = sqlSession.getMapper(ReportDAO.class);
		
		// 회원정보
		MemberVO user = (MemberVO) session.getAttribute("user");
		reportVO.setMember_id(user.getMember_id());

		mapper.reportInsert(reportVO);
		// 신고수 증가
		
		
		int currentPage = Integer.parseInt( request.getParameter("currentPage"));

		PrintWriter out = getPrintWriter(response);
		out.println("<script>");
		out.println("alert('신고 완료!!!')");
		out.println("location.href='selectByIdx?party_id="+reportVO.getParty_id()+"&currentPage="+currentPage+"&job=article'");
		out.println("</script>");
		out.flush();
	}
	
//	PrintWriter
	private PrintWriter getPrintWriter(HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
	    return out;
	}
}
