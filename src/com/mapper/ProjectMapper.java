package com.mapper;

import com.model.Project;

import java.util.List;
import java.util.Map;

public interface ProjectMapper {
	/**
	 * 查询所有项目
	 * 
	 * @return
	 */
	public List<Map> query(Map<String, Object> inputParam);

	/**
	 * 查询大赛下的所有项目
	 */
	public List<Map>   queryByCompetitionId(String competitionId);

	/**
	 * 查询项目记录数
	 * 
	 * @param inputParam
	 * @return
	 */
	public int getCount(Map<String, Object> inputParam);

	/**
	 * 保存项目
	 * 
	 * @param project
	 * @return
	 */
	public int insertProject(Project project);

	/**
	 * 删除项目
	 * 
	 * @param id
	 * @return
	 */
	public int deleteProject(int id);

	/**
	 * 更新项目
	 * 
	 * @param project
	 * @return
	 */
	public int updateProject(Project project);

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Map queryProjectById(int id);
}
