package com.service;

import com.mapper.SignupMapper;
import com.model.Signup;
import com.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 大赛Service实现类
 */
@Service
public class SignupServiceImpl implements SignupService {
	/**
	 * 注入mapper
	 */
	@Autowired
	private SignupMapper competitionMapper;

	/**
	 * 查询大赛记录数
	 * 
	 * @param competition
	 * @return
	 */
	public int getCount(Signup competition) {
		Map<String, Object> map = getQueryMap(competition, null);
		return competitionMapper.getCount(map);
	}

	/**
	 * 查询所有大赛
	 * 
	 * @return
	 */
	public List<Map> querySignupList(Signup competition, PageBean page) throws Exception {
		Map<String, Object> map = getQueryMap(competition, page);
		List<Map> list = competitionMapper.query(map);
		return list;
	}

	/**
	 * 封装查询条件
	 * 
	 * @param competition
	 * @param page
	 * @return
	 */
	private Map<String, Object> getQueryMap(Signup competition, PageBean page) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (page != null) {
			PageBean.setPageMap(map, page);
		}
		return map;
	}

	/**
	 * 保存大赛
	 * 
	 * @param competition
	 * @return
	 */
	public int insertSignup(Signup competition) throws Exception {
		return competitionMapper.insertSignup(competition);
	}

	/**
	 * 删除大赛
	 * 
	 * @param id
	 * @return
	 */
	public int deleteSignup(int id) throws Exception {
		return competitionMapper.deleteSignup(id);
	}

	/**
	 * 更新大赛
	 * 
	 * @param competition
	 * @return
	 */
	public int updateSignup(Signup competition) throws Exception {
		return competitionMapper.updateSignup(competition);
	}

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Signup querySignupById(int id) throws Exception {
		return competitionMapper.querySignupById(id);
	}
}
