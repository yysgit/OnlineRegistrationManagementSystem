package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.model.User;

import com.service.UserService;
import com.util.PageBean;

/**
 * 学生员Controller业务控制类
 */
@Controller
public class UserController {
	/**
	 * 注入Service
	 */
	@Autowired
	private UserService userService;
	
	/**
	 * 学生员列表
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user_list")
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
		User user = new User();
		String uname = request.getParameter("uname");
		user.setUname(uname);
		request.setAttribute("uname", uname);
		String upwd = request.getParameter("upwd");
		user.setUpwd(upwd);
		request.setAttribute("upwd", upwd);
		String name = request.getParameter("name");
		user.setName(name);
		request.setAttribute("name", name);

		// 查询记录总数
		counts = userService.getCount(user);
		// 获取当前页记录
		List userList = userService.queryUserList(user, page);
		request.setAttribute("list", userList);
		
		// 将分页相关参数放到request中
		request.setAttribute("itemSize", counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts
				/ PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		request.setAttribute("pageItem", PageBean.PAGE_IETM);
		request.setAttribute("pageTotal", page_count);
		return "/admin/user/user_list.jsp";
	}

	/**
	 * 跳转到新增学生员界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user_toAdd")
	public String toAdd(HttpServletRequest request) throws Exception {
		
		return "/admin/user/user_add.jsp";
	}

	/**
	 * 保存新增学生员
	 * 
	 * @param user
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user_add")
	public String add(User user, HttpServletRequest request) throws Exception {
		// 保存到数据库
		userService.insertUser(user);
		return "redirect:user_list.action";
	}
	/**
	 * 跳转到更新学生员界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user_toUpdate")
	public String toUpdate(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出需要更新的记录
		User user = userService.queryUserById(id);
		request.setAttribute("user", user);
		return "/web/user/user_update.jsp";
	}
	/**
	 * 更新学生员
	 * 
	 * @param user
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user_update")
	public String update(User user, HttpServletRequest request)
			throws Exception {
		// 更新数据库
		userService.updateUser(user);
		return "redirect:user_list.action";
	}

	/**
	 * 删除学生员
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user_delete")
	public String delete(HttpServletRequest request) throws Exception {
		// 根据id删除数据库记录
		int id = Integer.parseInt(request.getParameter("id"));
		userService.deleteUser(id);
		return "redirect:user_list.action";
	}

	/**
	 * 查看学生员详情
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user_toView")
	public String toView(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出记录放到request中，到前台jsp界面显示
		User user = new User();
		user.setId(id);
		List<User> list = userService.queryUserList(user, null);
		user = list.get(0);
		request.setAttribute("user", user);
		return "/admin/user/user_view.jsp";
	}
	
	/************************************web 前端*********************************************/

	/**
	 * 判断用户名是否存在
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/user_unameExist")
	public String unameExist(HttpServletRequest request) throws Exception {
		String exist = "true";
		String uname = request.getParameter("uname");
		User user = new User();
		user.setUname(uname);
		List list = userService.queryUserList(user, null);
		if (list != null && list.size() > 0) {
			exist = "false"; // 验证插件需要返回false 返回false时验证提示已存在
		}
		return exist;
	}
	


	/**
	 * 注册新增学生
	 * 
	 * @param user
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/userReg")
	public String reg(User user, HttpServletRequest request) throws Exception {
		user.setState(0);
		// 保存到数据库
		userService.insertUser(user);
		return "/web/login.jsp";
	}
	
	/**
	 * 更新用户
	 * 
	 * @param user
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user_info")
	public String info(User user, HttpServletRequest request)
			throws Exception {
		user.setState(1);
		// 更新数据库
		userService.updateUser(user);
		request.getSession().setAttribute("user", user);
		request.setAttribute("message", "操作成功");
		request.setAttribute("path", "/web/user/user_info.jsp");
		return "/common/succeed.jsp";
	}
	
	/**
	 * 跳转到更新学生员界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user_toUpdate_web")
	public String user_toUpdate_web(HttpServletRequest request) throws Exception {
		return "/web/user/user_update.jsp";
	}

	
	
	/**
	 * 更新用户密码
	 * @param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user_upwd")
	public String upwd(HttpServletRequest request) throws Exception {
		String upwd = request.getParameter("upwd");
		User user = (User) request.getSession().getAttribute("user");
		user.setUpwd(upwd);
		userService.updateUser(user);
		request.getSession().setAttribute("user", user);
		
		request.setAttribute("message", "操作成功");
		request.setAttribute("path", "/web/user/user_upwd.jsp");
		return "/common/succeed.jsp";
	}
	
	
	@RequestMapping(value = "/jianli_toView")
	public String jianli_toView(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出记录放到request中，到前台jsp界面显示
		User user = new User();
		user.setId(id);
		List<User> list = userService.queryUserList(user, null);
		user = list.get(0);
		request.setAttribute("user", user);
		return "/web/user/jianli.jsp";
	}
}
