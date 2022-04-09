package com.controller;

import com.model.Project;
import com.service.ProjectService;
import com.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 项目Controller业务控制类
 */
@Controller
public class ProjectController {
	/**
	 * 注入Service
	 */
	@Autowired
	private ProjectService projectService;

	/**
	 * 项目列表
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/project_list")
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
		Project project = new Project();
		// 查询记录总数
		counts = projectService.getCount(project);
		// 获取当前页记录
		List projectList = projectService.queryProjectList(project, page);
		request.setAttribute("list", projectList);
		// 将分页相关参数放到request中
		request.setAttribute("itemSize", counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts
				/ PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		request.setAttribute("pageItem", PageBean.PAGE_IETM);
		request.setAttribute("pageTotal", page_count);
		return "/admin/project/project_list.jsp";
	}

	/**
	 * 跳转到新增项目界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/project_toAdd")
	public String toAdd(HttpServletRequest request) throws Exception {
		return "/admin/project/project_add.jsp";
	}

	/**
	 * 保存新增项目
	 * 
	 * @param project
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/project_add")
	public String add(Project project, HttpServletRequest request) throws Exception {
		// 保存到数据库
		projectService.insertProject(project);
		return "redirect:project_list.action";
	}

	/**
	 * 跳转到更新项目界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/project_toUpdate")
	public String toUpdate(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出需要更新的记录
		List<Map> project = projectService.queryProjectById(id);
		request.setAttribute("project", project);
		return "/admin/project/project_update.jsp";
	}

	/**
	 * 更新项目
	 * 
	 * @param project
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/project_update")
	public String update(Project project, HttpServletRequest request)
			throws Exception {
		// 更新数据库
		projectService.updateProject(project);
		return "redirect:project_list.action";
	}

	/**
	 * 删除项目
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/project_delete")
	public String delete(HttpServletRequest request) throws Exception {
		// 根据id删除数据库记录
		int id = Integer.parseInt(request.getParameter("id"));
		projectService.deleteProject(id);
		return "redirect:project_list.action";
	}

	/**
	 * 查看项目详情
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/project_toView")
	public String toView(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出记录放到request中，到前台jsp界面显示
		List<Map> project = projectService.queryProjectById(id);
		request.setAttribute("project", project);
		return "/admin/project/project_view.jsp";
	}


}
