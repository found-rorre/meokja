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
import com.meokja.vo.MemberVO;


@Controller
public class ServletController {
	
	private static final Logger logger = LoggerFactory.getLogger(ServletController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private MemberVO user;
	
//	로그인
	@RequestMapping("/getParty_id")
	public void getParty_id(HttpSession session) {
		
	}
	
	
	
	
	
}
