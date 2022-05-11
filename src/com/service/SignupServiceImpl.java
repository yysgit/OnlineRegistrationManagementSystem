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
	private SignupMapper signupMapper;

	/**
	 * 查询大赛记录数
	 * 
	 * @param signup
	 * @return
	 */
	public int getCount(Signup signup) {
		Map<String, Object> map = getQueryMap(signup, null);
		return signupMapper.getCount(map);
	}

	/**
	 * 查询所有大赛
	 * 
	 * @return
	 */
	public List<Map> querySignupList(Signup signup, PageBean page) throws Exception {
		Map<String, Object> map = getQueryMap(signup, page);
		List<Map> list = signupMapper.query(map);
		return list;
	}

	/**
	 * 封装查询条件
	 * 
	 * @param signup
	 * @param page
	 * @return
	 */
	private Map<String, Object> getQueryMap(Signup signup, PageBean page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schoolId", signup.getSchoolId());
		map.put("createUserId", signup.getCreateUserId());
		if (page != null) {
			PageBean.setPageMap(map, page);
		}
		return map;
	}

	/**
	 * 保存大赛
	 * 
	 * @param signup
	 * @return
	 */
	public int insertSignup(Signup signup) throws Exception {
		return signupMapper.insertSignup(signup);
	}

	/**
	 * 删除大赛
	 * 
	 * @param id
	 * @return
	 */
	public int deleteSignup(int id) throws Exception {
		return signupMapper.deleteSignup(id);
	}



	public int updateSignupByStatus(Signup signup) throws Exception {
		return signupMapper.updateSignupByStatus(signup);
	}
	/**
	 * 更新大赛
	 * 
	 * @param signup
	 * @return
	 */
	public int updateSignup(Signup signup) throws Exception {
		return signupMapper.updateSignup(signup);
	}

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Signup querySignupById(int id) throws Exception {
		return signupMapper.querySignupById(id);
	}

	@Override
	public Map querySignupByProjectId(int id) throws Exception {
		return signupMapper.querySignupByProjectId(id);
	}
}
