package com.mapper;

import com.model.Signup;
import org.apache.ibatis.annotations.MapKey;

import java.util.List;
import java.util.Map;

public interface SignupMapper {
	/**
	 * 查询所有报名
	 * 
	 * @return
	 */
	@MapKey("id")
	public List<Map> query(Map<String, Object> inputParam);

	/**
	 * 查询报名记录数
	 * 
	 * @param inputParam
	 * @return
	 */
	public int getCount(Map<String, Object> inputParam);

	/**
	 * 保存报名
	 * 
	 * @param signup
	 * @return
	 */
	public int insertSignup(Signup signup);

	/**
	 * 删除报名
	 * 
	 * @param id
	 * @return
	 */
	public int deleteSignup(int id);

	/**
	 * 更新报名
	 * 
	 * @param signup
	 * @return
	 */
	public int updateSignup(Signup signup);

	public int updateSignupByStatus(Signup signup);

	public int updateSignupByPay(Signup signup);

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Signup querySignupById(int id);


	@MapKey("id")
	public List<Map> querySignupByProjectId(int id);
}
