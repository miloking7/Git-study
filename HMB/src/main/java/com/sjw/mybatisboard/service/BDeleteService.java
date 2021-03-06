package com.sjw.mybatisboard.service;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import com.sjw.mybatisboard.dao.BDao;

public class BDeleteService implements IBoarderService {
	private SqlSession sqlSession=Constant.sqlSession;
	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int bid = Integer.parseInt(request.getParameter("bId"));
		BDao dao = sqlSession.getMapper(BDao.class);
		dao.delete(bid);
	}
}
