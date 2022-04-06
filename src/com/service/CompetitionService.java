package com.service;

import com.model.Competition;
import com.util.PageBean;

import java.util.List;
import java.util.Map;

/**
 * 大赛Service接口
 */
public interface CompetitionService {
	/**
	 * 查询大赛记录数
	 * 
	 * @param competition
	 * @return
	 */
	public int getCount(Competition competition);

	/**
	 * 查询所有大赛
	 * 
	 * @return
	 */
	public List<Map> queryCompetitionList(Competition competition, PageBean page) throws Exception;

	/**
	 * 保存大赛
	 * 
	 * @param competition
	 * @return
	 */
	public int insertCompetition(Competition competition) throws Exception;

	/**
	 * 删除大赛
	 * 
	 * @param id
	 * @return
	 */
	public int deleteCompetition(int id) throws Exception;

	/**
	 * 更新大赛
	 * 
	 * @param competition
	 * @return
	 */
	public int updateCompetition(Competition competition) throws Exception;

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Competition queryCompetitionById(int id) throws Exception;
}
