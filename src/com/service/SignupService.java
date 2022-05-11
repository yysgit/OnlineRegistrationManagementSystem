package com.service;

import com.model.Signup;
import com.util.PageBean;

import java.util.List;
import java.util.Map;

/**
 * 报名Service接口
 */
public interface SignupService {
	/**
	 * 查询报名记录数
	 * 
	 * @param signup
	 * @return
	 */
	public int getCount(Signup signup);

	/**
	 * 查询所有报名
	 * 
	 * @return
	 */
	public List<Map> querySignupList(Signup signup, PageBean page) throws Exception;

	/**
	 * 保存报名
	 * 
	 * @param signup
	 * @return
	 */
	public int insertSignup(Signup signup) throws Exception;

	/**
	 * 删除报名
	 * 
	 * @param id
	 * @return
	 */
	public int deleteSignup(int id) throws Exception;

	/**
	 * 更新报名
	 * 
	 * @param signup
	 * @return
	 */
	public int updateSignup(Signup signup) throws Exception;

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Signup querySignupById(int id) throws Exception;
	public Map querySignupByProjectId(int id) throws Exception;
}
