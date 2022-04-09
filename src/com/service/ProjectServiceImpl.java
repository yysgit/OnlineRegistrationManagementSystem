package com.service;

import com.mapper.ProjectMapper;
import com.model.Project;
import com.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 项目Service实现类
 */
@Service
public class ProjectServiceImpl implements ProjectService {
	/**
	 * 注入mapper
	 */
	@Autowired
	private ProjectMapper projectMapper;

	/**
	 * 查询项目记录数
	 * 
	 * @param project
	 * @return
	 */
	public int getCount(Project project) {
		Map<String, Object> map = getQueryMap(project, null);
		return projectMapper.getCount(map);
	}

	/**
	 * 查询所有项目
	 * 
	 * @return
	 */
	public List<Map> queryProjectList(Project project, PageBean page) throws Exception {
		Map<String, Object> map = getQueryMap(project, page);
		List<Map> list = projectMapper.query(map);
		return list;
	}

	public List<Map> queryProjectListByCompetitionId(String competitionId) throws Exception {

		List<Map> list = projectMapper.queryByCompetitionId(competitionId);
		return list;
	}


	/**
	 * 封装查询条件
	 * 
	 * @param project
	 * @param page
	 * @return
	 */
	private Map<String, Object> getQueryMap(Project project, PageBean page) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (page != null) {
			PageBean.setPageMap(map, page);
		}
		return map;
	}

	/**
	 * 保存项目
	 * 
	 * @param project
	 * @return
	 */
	public int insertProject(Project project) throws Exception {
		return projectMapper.insertProject(project);
	}

	/**
	 * 删除项目
	 * 
	 * @param id
	 * @return
	 */
	public int deleteProject(int id) throws Exception {
		return projectMapper.deleteProject(id);
	}

	/**
	 * 更新项目
	 * 
	 * @param project
	 * @return
	 */
	public int updateProject(Project project) throws Exception {
		return projectMapper.updateProject(project);
	}

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Map queryProjectById(int id) throws Exception {
		return projectMapper.queryProjectById(id);
	}
}
