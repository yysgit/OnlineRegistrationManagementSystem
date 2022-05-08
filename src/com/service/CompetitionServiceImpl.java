package com.service;

import com.mapper.CompetitionMapper;
import com.model.Competition;
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
public class CompetitionServiceImpl implements CompetitionService {
	/**
	 * 注入mapper
	 */
	@Autowired
	private CompetitionMapper competitionMapper;

	/**
	 * 查询大赛记录数
	 * 
	 * @param competition
	 * @return
	 */
	public int getCount(Competition competition) {
		Map<String, Object> map = getQueryMap(competition, null);
		return competitionMapper.getCount(map);
	}

	/**
	 * 查询所有大赛
	 * 
	 * @return
	 */
	public List<Map> queryCompetitionList(Competition competition, PageBean page) throws Exception {
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
	private Map<String, Object> getQueryMap(Competition competition, PageBean page) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (page != null) {
			PageBean.setPageMap(map, page);
		}
		map.put("name",competition.getName());
		return map;
	}

	/**
	 * 保存大赛
	 * 
	 * @param competition
	 * @return
	 */
	public int insertCompetition(Competition competition) throws Exception {
		return competitionMapper.insertCompetition(competition);
	}

	/**
	 * 删除大赛
	 * 
	 * @param id
	 * @return
	 */
	public int deleteCompetition(int id) throws Exception {
		return competitionMapper.deleteCompetition(id);
	}

	/**
	 * 更新大赛
	 * 
	 * @param competition
	 * @return
	 */
	public int updateCompetition(Competition competition) throws Exception {
		return competitionMapper.updateCompetition(competition);
	}

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Competition queryCompetitionById(int id) throws Exception {
		return competitionMapper.queryCompetitionById(id);
	}
}
