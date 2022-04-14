package com.controller;

import com.model.School;
import com.service.SchoolService;
import com.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 学校Controller业务控制类
 */
@Controller
public class SchoolController {
	/**
	 * 注入Service
	 */
	@Autowired
	private SchoolService schoolService;

	/**
	 * 学校列表
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/school_list")
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
		School school = new School();
		// 查询记录总数
		counts = schoolService.getCount(school);
		// 获取当前页记录
		List schoolList = schoolService.querySchoolList(school, page);
		request.setAttribute("list", schoolList);
		// 将分页相关参数放到request中
		request.setAttribute("itemSize", counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts
				/ PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		request.setAttribute("pageItem", PageBean.PAGE_IETM);
		request.setAttribute("pageTotal", page_count);
		return "/admin/school/school_list.jsp";
	}

	/**
	 * 跳转到新增学校界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/school_toAdd")
	public String toAdd(HttpServletRequest request) throws Exception {
		return "/admin/school/school_add.jsp";
	}

	/**
	 * 保存新增学校
	 * 
	 * @param school
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/school_add")
	public String add(School school, HttpServletRequest request) throws Exception {
		// 保存到数据库
		schoolService.insertSchool(school);
		return "redirect:school_list.action";
	}

	/**
	 * 跳转到更新学校界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/school_toUpdate")
	public String toUpdate(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出需要更新的记录
		School school = schoolService.querySchoolById(id);
		request.setAttribute("school", school);
		return "/admin/school/school_update.jsp";
	}

	/**
	 * 更新学校
	 * 
	 * @param school
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/school_update")
	public String update(School school, HttpServletRequest request)
			throws Exception {
		// 更新数据库
		schoolService.updateSchool(school);
		return "redirect:school_list.action";
	}

	/**
	 * 删除学校
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/school_delete")
	public String delete(HttpServletRequest request) throws Exception {
		// 根据id删除数据库记录
		int id = Integer.parseInt(request.getParameter("id"));
		schoolService.deleteSchool(id);
		return "redirect:school_list.action";
	}

	/**
	 * 查看学校详情
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/school_toView")
	public String toView(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出记录放到request中，到前台jsp界面显示
		School school = schoolService.querySchoolById(id);
		request.setAttribute("school", school);
		return "/admin/school/school_view.jsp";
	}


}
