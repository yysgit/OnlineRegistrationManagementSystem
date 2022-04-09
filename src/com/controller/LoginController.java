package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.User;

import com.service.UserService;

/**
 * 登录Controller控制类
 */
@Controller
public class LoginController {
	/**
	 * 注入Service
	 */
	@Autowired
	private UserService userService;


	@ResponseBody
	@RequestMapping(value = "/user_login")
	public String user_login(HttpServletRequest request) throws Exception {
		String flag = "false";
		String uname = request.getParameter("uname");
		String upwd = request.getParameter("upwd");
		String vcode = request.getParameter("vcode");
		HttpSession session = request.getSession();
		String vscode = session.getAttribute("vcode") + "";
		if (vscode.equals(vcode)) {
			User ser = new User();
			ser.setUname(uname);
			ser.setUpwd(upwd);
			List<User> userList = userService.queryUserList(ser, null);
			if (userList != null && userList.size() > 0) {
				User user = userList.get(0);
				request.getSession().setAttribute("user", user);
				flag = "true";
			}
		} else {
			flag = "false1";
		}
		return flag;
	}

	@RequestMapping(value = "/user_loginout")
	public String user_loginout(HttpServletRequest request) throws Exception {
		request.getSession().setAttribute("user", null);
		request.getSession().invalidate();
		return "/web/login.jsp";
	}

}
