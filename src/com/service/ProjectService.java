package com.service;

import com.model.Project;
import com.util.PageBean;

import java.util.List;
import java.util.Map;

/**
 * 项目Service接口
 */
public interface ProjectService {
	/**
	 * 查询项目记录数
	 * 
	 * @param project
	 * @return
	 */
	public int getCount(Project project);

	/**
	 * 查询所有项目
	 * 
	 * @return
	 */
	public List<Map> queryProjectList(Project project, PageBean page) throws Exception;

	public List<Map> queryProjectListByCompetitionId(String competitionId) throws Exception;

	/**
	 * 保存项目
	 * 
	 * @param project
	 * @return
	 */
	public int insertProject(Project project) throws Exception;

	/**
	 * 删除项目
	 * 
	 * @param id
	 * @return
	 */
	public int deleteProject(int id) throws Exception;

	/**
	 * 更新项目
	 * 
	 * @param project
	 * @return
	 */
	public int updateProject(Project project) throws Exception;

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public List<Map> queryProjectById(int id) throws Exception;
}
