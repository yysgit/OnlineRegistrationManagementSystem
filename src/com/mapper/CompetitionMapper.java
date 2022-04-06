package com.mapper;

import com.model.Competition;

import java.util.List;
import java.util.Map;

public interface CompetitionMapper {
	/**
	 * 查询所有大赛
	 * 
	 * @return
	 */
	public List<Map> query(Map<String, Object> inputParam);

	/**
	 * 查询大赛记录数
	 * 
	 * @param inputParam
	 * @return
	 */
	public int getCount(Map<String, Object> inputParam);

	/**
	 * 保存大赛
	 * 
	 * @param competition
	 * @return
	 */
	public int insertCompetition(Competition competition);

	/**
	 * 删除大赛
	 * 
	 * @param id
	 * @return
	 */
	public int deleteCompetition(int id);

	/**
	 * 更新大赛
	 * 
	 * @param competition
	 * @return
	 */
	public int updateCompetition(Competition competition);

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Competition queryCompetitionById(int id);
}
