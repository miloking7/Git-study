package com.sjw.mybatisboard.service;

import java.sql.Timestamp;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.sjw.mybatisboard.dao.HDao;
import com.sjw.mybatisboard.dao.MDao;
import com.sjw.mybatisboard.dto.HomeBook;
import com.sjw.mybatisboard.dto.MyMember;


public class HomeBookModifyService implements IBoarderService {
	/* 
	private long serialno;// 일련번호
	private Timestamp day;// 일자
	private String section;// 수지구분
	private String accounttitle; // 계정과목
	private String remark; // 적요
	private int revenue; // 수입
	private int expense; // 지출 
	private String mid; // 회원아이디 
	*/
	private SqlSession sqlSession=Constant.sqlSession;
	
	private long serialNo;
	
	public void setSerialNo(long serialNo) {
		this.serialNo = serialNo;
	}
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		HDao dao = sqlSession.getMapper(HDao.class);
		HomeBook book = dao.bookView(serialNo);
		session.setAttribute("targetBook", book);
		model.addAttribute("request", request);
		model.addAttribute("session", session);
	}
}
