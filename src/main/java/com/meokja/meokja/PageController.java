package com.meokja.meokja;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class PageController {
	
	private static final Logger logger = LoggerFactory.getLogger(PageController.class);
	

	@RequestMapping("/")
	public String home() {
		logger.info("PageController의 loginPage()");
		return "redirect:list";
	}
	
	@RequestMapping("/loginPage")
	public String loginPage() {
		logger.info("PageController의 loginPage()");
		return "login";
	}
	
	@RequestMapping("/memberPage")
	public String memberPage() {
		logger.info("PageController의 memberPage()");
		return "member";
	}
	
	@RequestMapping("/test")
	public String test() {
		logger.info("PageController의 test()");
		return "test";
	}
	
	@RequestMapping("/idSerchPage")
	public String idSerchPage() {
		logger.info("PageController의 loginPage()");
		return "idSerch";
	}
	
	@RequestMapping("/pwSerchPage")
	public String pwSerchPage() {
		logger.info("PageController의 passwordSerchPage()");
		return "pwSerch";
	}
	
	@RequestMapping("/myProfileChk")
	public String myProfileChk() {
		logger.info("PageController의 myProfile()");
		return "myProfileChk";
	}
	
	@RequestMapping("/myProfilePage")
	public String myProfile() {
		logger.info("PageController의 myProfile()");
		return "myProfile";
	}
	
	@RequestMapping("/pwdChangePage")
	public String passwordChange() {
		logger.info("PageController의 passwordChange()");
		return "pwChange";
	}
	
	@RequestMapping("/partyInsertPage")
	public String partyInsertPage() {
		logger.info("PageController의 partyInsertPage()");
		return "partyInsert";
	}
}
