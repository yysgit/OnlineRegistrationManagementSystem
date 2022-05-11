package com.controller;

import com.mapper.SchoolMapper;
import com.model.Boss;
import com.model.Signup;
import com.model.User;
import com.service.SchoolService;
import com.service.SignupService;
import com.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * 报名Controller业务控制类
 */
@Controller
public class SignupController {
    /**
     * 注入Service
     */
    @Autowired
    private SignupService signupService;
    @Autowired
    private SchoolMapper schoolMapper;

    /**
     * 报名列表
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/signup_list")
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


        Signup signup = new Signup();


        Boss boss = (Boss) request.getSession().getAttribute("boss");


        if(boss!=null){
            signup.setSchoolId(boss.getSchoolId());
        }

        User user = (User) request.getSession().getAttribute("user");
        if(user!=null){
            signup.setCreateUserId(user.getId());
        }

        // 查询记录总数
        counts = signupService.getCount(signup);
        // 获取当前页记录
        List signupList = signupService.querySignupList(signup, page);
        request.setAttribute("list", signupList);
        // 将分页相关参数放到request中
        request.setAttribute("itemSize", counts);
        int page_count = counts % PageBean.PAGE_IETM == 0 ? counts
                / PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
        request.setAttribute("pageItem", PageBean.PAGE_IETM);
        request.setAttribute("pageTotal", page_count);
        return "/admin/signup/signup_list.jsp";
    }

    /**
     * 跳转到新增报名界面
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/signup_toAdd")
    public String toAdd(HttpServletRequest request) throws Exception {
        return "/admin/signup/signup_add.jsp";
    }

    /**
     * 学校审核
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/signup_school_audit")
    public String signup_school_audit( Signup signup, HttpServletRequest request) throws Exception {
        signup.setStatus(1);
        signupService.updateSignupByStatus(signup);
        return "redirect:signup_list.action";
    }

    /**
     * 跳转到新增报名界面
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/signup_toPage")
    public String signup_toPage(HttpServletRequest request) throws Exception {
        Integer projectId= Integer.valueOf(request.getParameter("projectId"));

         Map map= signupService.querySignupByProjectId(projectId);

        request.setAttribute("participatingAccount",  map.get("projectCode")+"-"+map.get("competitonCode")+"-"+new Random().nextInt(9999));

        request.setAttribute("schoolList", schoolMapper.query(null));
        request.setAttribute("projectId",projectId);
        return "/web/signup.jsp";
    }

//    /**
//     * 跳转到新增报名界面
//     *
//     * @param request
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping(value = "/signup_toListPage")
//    public String signup_toListPage(HttpServletRequest request) throws Exception {
//        String projectId= request.getParameter("projectId");
//        Boss boss=(Boss) request.getSession().getAttribute("boss");
//        request.setAttribute("schoolList", signupService.querySignupAllList(null));
//        request.setAttribute("projectId",projectId);
//        return "/web/signup.jsp";
//    }




    /**
     * 保存新增报名
     *
     * @param
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/signup_add")
    public String add(HttpServletRequest request) throws Exception {


        Integer projectId = Integer.valueOf(request.getParameter("projectId"));
        Integer schoolId = Integer.valueOf(request.getParameter("schoolId"));
        String ranks = request.getParameter("ranks");
        String captain = request.getParameter("captain");
        String instructor = request.getParameter("instructor");
        String contestants = request.getParameter("contestants");
        Integer peopleNum = Integer.valueOf(request.getParameter("peopleNum"));
        String programName = request.getParameter("programName");
        String programEngName = request.getParameter("programEngName");
        String participatingAccount = request.getParameter("participatingAccount");
        String phoneNum = request.getParameter("phoneNum");
        String company = request.getParameter("company");


        User userMy = (User) request.getSession().getAttribute("user");


        // 更新数据库
        Signup signup = new Signup();
        signup.setProjectId(projectId);
        signup.setSchoolId(schoolId);
        signup.setRanks(ranks);
        signup.setCaptain(captain);
        signup.setInstructor(instructor);
        signup.setContestants(contestants);
        signup.setPeopleNum(peopleNum);
        signup.setProgramName(programName);
        signup.setProgramEngName(programEngName);
        signup.setParticipatingAccount(participatingAccount);
        signup.setPhoneNum(phoneNum);
        signup.setCompany(company);
        signup.setCreateUserId(userMy.getId());


        // 保存到数据库
        signupService.insertSignup(signup);
        return "redirect:signup_list.action";
    }


    /**
     * 保存新增报名
     *
     * @param
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/signup_addPage")
    public String addPage(HttpServletRequest request) throws Exception {


        Integer projectId = Integer.valueOf(request.getParameter("projectId"));
        Integer schoolId = Integer.valueOf(request.getParameter("schoolId"));
        String ranks = request.getParameter("ranks");
        String captain = request.getParameter("captain");
        String instructor = request.getParameter("instructor");
        String contestants = request.getParameter("contestants");
        Integer peopleNum = Integer.valueOf(request.getParameter("peopleNum"));
        String programName = request.getParameter("programName");
        String programEngName = request.getParameter("programEngName");
        String participatingAccount = request.getParameter("participatingAccount");
        String phoneNum = request.getParameter("phoneNum");
        String company = request.getParameter("company");


        User userMy = (User) request.getSession().getAttribute("user");


        // 更新数据库
        Signup signup = new Signup();
        signup.setProjectId(projectId);
        signup.setSchoolId(schoolId);
        signup.setRanks(ranks);
        signup.setCaptain(captain);
        signup.setInstructor(instructor);
        signup.setContestants(contestants);
        signup.setPeopleNum(peopleNum);
        signup.setProgramName(programName);
        signup.setProgramEngName(programEngName);
        signup.setParticipatingAccount(participatingAccount);
        signup.setPhoneNum(phoneNum);
        signup.setCompany(company);
        signup.setCreateUserId(userMy.getId());


        // 保存到数据库
        signupService.insertSignup(signup);
        return "web/user/user_info.jsp";
    }

    /**
     * 跳转到更新报名界面
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/signup_toUpdate")
    public String toUpdate(HttpServletRequest request) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        // 根据ID查询出需要更新的记录
        Signup signup = signupService.querySignupById(id);
        request.setAttribute("signup", signup);
         return "/admin/signup/signup_update.jsp";
    }

    /**
     * 更新报名
     *
     * @param
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/signup_update")
    public String update(HttpServletRequest request)
            throws Exception {

        Integer id = Integer.valueOf(request.getParameter("id"));
        Integer projectId = Integer.valueOf(request.getParameter("projectId"));
        Integer schoolId = Integer.valueOf(request.getParameter("schoolId"));
        String ranks = request.getParameter("ranks");
        String captain = request.getParameter("captain");
        String instructor = request.getParameter("instructor");
        String contestants = request.getParameter("contestants");
        Integer peopleNum = Integer.valueOf(request.getParameter("peopleNum"));
        String programName = request.getParameter("programName");
        String programEngName = request.getParameter("programEngName");
        String participatingAccount = request.getParameter("participatingAccount");
        String phoneNum = request.getParameter("phoneNum");
        String company = request.getParameter("company");


        User userMy = (User) request.getSession().getAttribute("user");


        // 更新数据库
        Signup signup = new Signup();
        signup.setId(id);
        signup.setProjectId(projectId);
        signup.setSchoolId(schoolId);
        signup.setRanks(ranks);
        signup.setCaptain(captain);
        signup.setInstructor(instructor);
        signup.setContestants(contestants);
        signup.setPeopleNum(peopleNum);
        signup.setProgramName(programName);
        signup.setProgramEngName(programEngName);
        signup.setParticipatingAccount(participatingAccount);
        signup.setPhoneNum(phoneNum);
        signup.setCompany(company);
        signup.setCreateUserId(userMy.getId());


        signupService.updateSignup(signup);
        return "redirect:signup_list.action";
    }

    /**
     * 删除报名
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/signup_delete")
    public String delete(HttpServletRequest request) throws Exception {
        // 根据id删除数据库记录
        int id = Integer.parseInt(request.getParameter("id"));
        signupService.deleteSignup(id);
        return "redirect:signup_list.action";
    }

    /**
     * 查看报名详情
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/signup_toView")
    public String toView(HttpServletRequest request) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        // 根据ID查询出记录放到request中，到前台jsp界面显示
        Signup signup = signupService.querySignupById(id);
        request.setAttribute("signup", signup);
        return "/admin/signup/signup_view.jsp";
    }

}
