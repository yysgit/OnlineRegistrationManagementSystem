package com.controller;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.mapper.CompetitionMapper;
import com.model.*;
import com.service.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.util.PageBean;

/**
 * 记录榜Controller业务控制类
 */
@Controller
public class IndexController {
	/**
	 * 注入Service
	 */

	@Autowired
	private CompetitionMapper competitionMapper;
	@Autowired
	private ProjectService projectService;


	@RequestMapping("/def")
	public String def( HttpServletRequest request) throws Exception {

		return "redirect:index.action";
	}
	
	
	/**
	 * 首页
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request) throws Exception {
		// 纪录榜信息查询最新的
		Map<String, Object> inputParam=new HashMap<>();
		List<Map> competitionList = competitionMapper.query(inputParam);
		request.getSession().setAttribute("competitionList", competitionList);
		return "/web/index.jsp";
	}

	
	
	/**
	 * 报名列表
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/job_list_web")
	public String job_list_web(HttpServletRequest request) throws Exception {
		String id = request.getParameter("id");

		List<Map> projectList=	projectService.queryProjectListByCompetitionId(id);
		request.getSession().setAttribute("projectList", projectList);
		
		request.getSession().setAttribute("top_index", 2);
		return "/web/job/job_list.jsp";
	}
	
	/**
	 * 查看报名详情
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/job_toView_web")
	public String job_toView_web(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		Map project=projectService.queryProjectById(id);
		request.getSession().setAttribute("project", project);
		return "/web/job/job_view.jsp";
	}
	

}
