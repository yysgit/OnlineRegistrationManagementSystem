package com.service;

import com.mapper.SchoolMapper;
import com.model.School;
import com.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 学校Service实现类
 */
@Service
public class SchoolServiceImpl implements SchoolService {
	/**
	 * 注入mapper
	 */
	@Autowired
	private SchoolMapper schoolMapper;

	/**
	 * 查询学校记录数
	 * 
	 * @param school
	 * @return
	 */
	public int getCount(School school) {
		Map<String, Object> map = getQueryMap(school, null);
		return schoolMapper.getCount(map);
	}

	/**
	 * 查询所有学校
	 * 
	 * @return
	 */
	public List<Map> querySchoolList(School school, PageBean page) throws Exception {
		Map<String, Object> map = getQueryMap(school, page);
		List<Map> list = schoolMapper.query(map);
		return list;
	}

	/**
	 * 封装查询条件
	 * 
	 * @param school
	 * @param page
	 * @return
	 */
	private Map<String, Object> getQueryMap(School school, PageBean page) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (page != null) {
			PageBean.setPageMap(map, page);
		}
		return map;
	}

	/**
	 * 保存学校
	 * 
	 * @param school
	 * @return
	 */
	public int insertSchool(School school) throws Exception {
		return schoolMapper.insertSchool(school);
	}

	/**
	 * 删除学校
	 * 
	 * @param id
	 * @return
	 */
	public int deleteSchool(int id) throws Exception {
		return schoolMapper.deleteSchool(id);
	}

	/**
	 * 更新学校
	 * 
	 * @param school
	 * @return
	 */
	public int updateSchool(School school) throws Exception {
		return schoolMapper.updateSchool(school);
	}

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public School querySchoolById(int id) throws Exception {
		return schoolMapper.querySchoolById(id);
	}
}
