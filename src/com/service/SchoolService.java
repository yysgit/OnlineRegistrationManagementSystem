package com.service;

import com.model.School;
import com.util.PageBean;

import java.util.List;
import java.util.Map;

/**
 * 大赛Service接口
 */
public interface SchoolService {
	/**
	 * 查询大赛记录数
	 * 
	 * @param school
	 * @return
	 */
	public int getCount(School school);

	/**
	 * 查询所有大赛
	 * 
	 * @return
	 */
	public List<Map> querySchoolList(School school, PageBean page) throws Exception;

	/**
	 * 保存大赛
	 * 
	 * @param school
	 * @return
	 */
	public int insertSchool(School school) throws Exception;

	/**
	 * 删除大赛
	 * 
	 * @param id
	 * @return
	 */
	public int deleteSchool(int id) throws Exception;

	/**
	 * 更新大赛
	 * 
	 * @param school
	 * @return
	 */
	public int updateSchool(School school) throws Exception;

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public School querySchoolById(int id) throws Exception;
}
