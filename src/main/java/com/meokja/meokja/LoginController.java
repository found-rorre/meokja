package com.meokja.meokja;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.meokja.dao.MemberDAO;
import com.meokja.dao.ScoreDAO;
import com.meokja.vo.MemberVO;


@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private MemberVO user;
	
//	로그인
	@RequestMapping("/login")
	public void login(HttpSession session, HttpServletResponse response, MemberVO memberVO) throws IOException {
		logger.info("LoginController의 login()");
		PrintWriter out = getPrintWriter(response);
		MemberDAO mapper = sqlSession.getMapper(MemberDAO.class);
//		아이디 조회
		user = mapper.selectById(memberVO.getMember_id());
		logger.info("line40 {} ", user);
		out.println("<script>");
		if (user == null) {
			out.println("alert('정보가 일치하지 않습니다.')");
			out.println("location.href='loginPage'");
			out.println("</script>");
		} else if (memberVO.getPw().equals(user.getPw())) {
			ScoreDAO scoreMapper = sqlSession.getMapper(ScoreDAO.class);
			
			int scoreCount = scoreMapper.scoreCount(user.getMember_id());
			
			if(3 <= scoreCount) {
				System.out.println("들어옴");
				
				int totalScore = scoreMapper.totalScore(user.getMember_id());
				float scoreAvg = totalScore / (float) scoreCount;
				
				user.setScoreAvg(scoreAvg);
			}
			session.setAttribute("user", user);
			out.println("alert('" + user.getMember_id() + "님 반갑습니다.')");
			out.println("location.href='list'");
			out.println("</script>");
		} else {
			out.println("alert('정보가 일치하지 않습니다.')");
			out.println("location.href='loginPage'");
			out.println("</script>");
		}
		out.flush();
	}
	
//	로그아웃	
	@RequestMapping("/logout")
	public void logout(HttpSession session, HttpServletResponse response) throws IOException {
		logger.info("LoginController의 logout()");
		PrintWriter out = getPrintWriter(response);
		session.removeAttribute("user");
		out.println("<script>");
		out.println("alert('로그아웃하셨습니다.')");
		out.println("location.href='list'");
		out.println("</script>");
		out.flush();
	}
	
//	아이디 찾기	
	@RequestMapping("/idSerch")
	public void idSerch(HttpServletResponse response, MemberVO memberVO) throws IOException {
		logger.info("LoginController의 idSerch()");
		logger.info("line77 {}",memberVO);
		MemberDAO mapper = sqlSession.getMapper(MemberDAO.class);
		
		memberVO = mapper.selectByName(memberVO);
		logger.info("line80 {}",memberVO);
		
		PrintWriter out = getPrintWriter(response);
		out.println("<script>");
		if(memberVO ==  null) {
			out.println("alert('일치하는 정보가 없습니다.')");
		} else {
			out.println("alert('" +memberVO.getName()+ "님의 아이디는" +memberVO.getMember_id()+ "입니다.')");
		}
		out.println("location.href='loginPage'");
		out.println("</script>");
		out.flush();
	}
	@RequestMapping("/pwSerch")
	public void pwSerch(HttpServletResponse response, MemberVO memberVO) throws IOException {
		logger.info("LoginController의 idSerch()");
		logger.info("line96 {}",memberVO);
		MemberDAO mapper = sqlSession.getMapper(MemberDAO.class);
		
		memberVO = mapper.pwSerch(memberVO);
		
		PrintWriter out = getPrintWriter(response);
		out.println("<script>");
		if(memberVO ==  null) {
			out.println("alert('일치하는 정보가 없습니다.')");
		} else {
			out.println("alert('" +memberVO.getName()+ "님의 비밀번호는" +memberVO.getPw()+ "입니다.')");
		}
		out.println("location.href='loginPage'");
		out.println("</script>");
		out.flush();
	}
	
	private PrintWriter getPrintWriter(HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
	    return out;
	}
	
}
