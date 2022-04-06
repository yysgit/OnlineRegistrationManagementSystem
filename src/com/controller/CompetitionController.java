package com.controller;

import com.model.Competition;
import com.service.CompetitionService;
import com.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 招聘者Controller业务控制类
 */
@Controller
public class CompetitionController {
	/**
	 * 注入Service
	 */
	@Autowired
	private CompetitionService competitionService;

	/**
	 * 招聘者列表
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/competition_list")
	public String list(HttpServletRequest request) throws Exception {
		/**
		 * 获取分页参数
		 */
		int offset = 0; // 记录偏移量
		int counts = 0; // 总记录数
		try {
			offset = Integer.parseInt(request.getParameter("pager.offset"));
		} catch (Exception e) {
		}
		PageBean page = new PageBean(offset);
		Competition competition = new Competition();
		// 查询记录总数
		counts = competitionService.getCount(competition);
		// 获取当前页记录
		List competitionList = competitionService.queryCompetitionList(competition, page);
		request.setAttribute("list", competitionList);
		// 将分页相关参数放到request中
		request.setAttribute("itemSize", counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts
				/ PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		request.setAttribute("pageItem", PageBean.PAGE_IETM);
		request.setAttribute("pageTotal", page_count);
		return "/admin/competition/competition_list.jsp";
	}

	/**
	 * 跳转到新增招聘者界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/competition_toAdd")
	public String toAdd(HttpServletRequest request) throws Exception {
		return "/admin/competition/competition_add.jsp";
	}

	/**
	 * 保存新增招聘者
	 * 
	 * @param competition
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/competition_add")
	public String add(Competition competition, HttpServletRequest request) throws Exception {
		// 保存到数据库
		competitionService.insertCompetition(competition);
		return "redirect:competition_list.action";
	}

	/**
	 * 跳转到更新招聘者界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/competition_toUpdate")
	public String toUpdate(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出需要更新的记录
		Competition competition = competitionService.queryCompetitionById(id);
		request.setAttribute("competition", competition);
		return "/admin/competition/competition_update.jsp";
	}

	/**
	 * 更新招聘者
	 * 
	 * @param competition
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/competition_update")
	public String update(Competition competition, HttpServletRequest request)
			throws Exception {
		// 更新数据库
		competitionService.updateCompetition(competition);
		return "redirect:competition_list.action";
	}

	/**
	 * 删除招聘者
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/competition_delete")
	public String delete(HttpServletRequest request) throws Exception {
		// 根据id删除数据库记录
		int id = Integer.parseInt(request.getParameter("id"));
		competitionService.deleteCompetition(id);
		return "redirect:competition_list.action";
	}

	/**
	 * 查看招聘者详情
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/competition_toView")
	public String toView(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出记录放到request中，到前台jsp界面显示
		Competition competition = competitionService.queryCompetitionById(id);
		request.setAttribute("competition", competition);
		return "/admin/competition/competition_view.jsp";
	}


}
