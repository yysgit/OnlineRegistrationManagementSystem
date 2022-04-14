package com.mapper;

import com.model.School;
import org.apache.ibatis.annotations.MapKey;

import java.util.List;
import java.util.Map;

public interface SchoolMapper {
	/**
	 * 查询所有学校
	 * 
	 * @return
	 */
	@MapKey("id")
	public List<Map> query(Map<String, Object> inputParam);

	/**
	 * 查询学校记录数
	 * 
	 * @param inputParam
	 * @return
	 */
	public int getCount(Map<String, Object> inputParam);

	/**
	 * 保存学校
	 * 
	 * @param school
	 * @return
	 */
	public int insertSchool(School school);

	/**
	 * 删除学校
	 * 
	 * @param id
	 * @return
	 */
	public int deleteSchool(int id);

	/**
	 * 更新学校
	 * 
	 * @param school
	 * @return
	 */
	public int updateSchool(School school);

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public School querySchoolById(int id);
}
