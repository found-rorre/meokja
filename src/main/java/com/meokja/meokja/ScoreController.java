	
package com.meokja.meokja;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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

import com.meokja.dao.MemberDAO;
import com.meokja.dao.ScoreDAO;
import com.meokja.vo.JoinVO;
import com.meokja.vo.MemberList;
import com.meokja.vo.MemberVO;
import com.meokja.vo.Param;
import com.meokja.vo.ParamScore;
import com.meokja.vo.PartyVO;
import com.meokja.vo.ScoreVO;


@Controller
public class ScoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(ScoreController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	JoinVO joinVO;
	
	@Autowired
	MemberVO user;
	
	@Autowired
	MemberVO memberVO;
	
	@Autowired
	MemberList memberList;
	
	@RequestMapping(value = "/scorePage", method = RequestMethod.POST)
	public String scorePage(Model model, PartyVO partyVO, HttpSession session) {
		logger.info("ScoreController의 scorePage()");
		ScoreDAO mapper = sqlSession.getMapper(ScoreDAO.class);
		MemberDAO MemberMapper = sqlSession.getMapper(MemberDAO.class);
		
	// 가져온 party_id값으로 모임정보 가져오기.		
		partyVO = mapper.score_selectByparty_id(partyVO.getParty_id());
		
		
		user = (MemberVO) session.getAttribute("user");
		
		joinVO.setParty_id(partyVO.getParty_id());
		joinVO.setMember_id(user.getMember_id());
//		모임원 정보
		ArrayList<MemberVO> joinMember = MemberMapper.joinMemberList(joinVO);

//		모임장 정보
		MemberVO master = MemberMapper.selectById(partyVO.getMember_id());
		
//		모임원 정보와 모임장 정보를 합친 후
//		memberList에 담고 브라우저에 데이터를 넘긴다.		
		joinMember.add(master);
		memberList.setList(joinMember);
		
		
		// 파티정보
		model.addAttribute("vo", partyVO);
		// 평가할 회원정보
		model.addAttribute("scoreList", memberList);
		
		
		return "score";
	}
	
	
	@RequestMapping(value = "/score", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> score(Model model, @RequestBody HashMap<String, Object> data) {
		System.out.println("ScoreController의 score");
		ScoreDAO mapper = sqlSession.getMapper(ScoreDAO.class);
		
		System.out.println(data);
		
		List<String> member_idList = (List<String>) data.get("member_id");
		List<Integer> scoreList = (List<Integer>) data.get("score");
		int party_id = (Integer) data.get("party_id");
		
		System.out.println(party_id);
		System.out.println(member_idList);
		System.out.println(scoreList.get(0));
		for(int i = 0; i < scoreList.size(); i++) {
			ScoreVO scoreVO = new ScoreVO();
			scoreVO.setMember_id(member_idList.get(0));
			scoreVO.setScore(scoreList.get(0));
			scoreVO.setParty_id(party_id);
			mapper.scoreInsert(scoreVO);
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put("message", "평가 완료");
		
		return map;
	}
	
	@RequestMapping(value = "/myScore", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> myScore(Model model, @RequestBody String member_id) {
		System.out.println("ScoreController의 score");
		ScoreDAO mapper = sqlSession.getMapper(ScoreDAO.class);
		
		System.out.println(member_id);
		
		double avg = mapper.avgScore(member_id);
		System.out.println(avg);
		
		double prime = avg - Math.floor(avg);

		System.out.println(prime);
		
		double myScore = Math.floor(avg) + (prime <= 0.5 ?  0 : 0.5);
		
		System.out.println(myScore);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put("myScore", Double.toString(myScore));
		
		return map;
	}
}
