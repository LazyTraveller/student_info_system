package jee.support.controller;
import jee.support.constants.OpCode;
import jee.support.constants.Constants;
import jee.support.entity.Admin;
import jee.support.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//注解使得该类成为控制类
//控制器作用：连接页面请求和服务层，获取页面请求的参数，通过自动装配，
//        映射不同的URL到相应的处理函数，并获取参数，对参数进行处理，之后传给服务层。
@Controller
public class LoginController{
    @Autowired
    AdminService adminService;
    //处理登录验证的
    //support/login  访问路径
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam("adminname") String adminname,
                        @RequestParam("password") String password,
                        HttpServletRequest request
                        ){
//        authenticate验证登录的一个方法，anthenticate调用adminDao里面的接口以及接口实现方法
       Admin admin  = adminService.authenticate(adminname, password);
//       如果用户名和密码为空，则返回login登录页面
        if (admin==null){
//            在独自类Constants，opCode中封装好这些字符串，再调用
//                                             登录状态               400
            request.setAttribute(Constants.LOGIN_STATUS, OpCode.INVALID_USER);

            return "login";
        }else {
            request.changeSessionId();
            request.getSession().setAttribute(Constants.SESSION_USER, admin);

            //重定向到student/list页面，区别转发写法     return "forward:/dengluPost";
//          student是StudentController的父名称  在student下的list方法
            return "redirect:student/list";
        }
    }
     //注销登录
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session){
            session.invalidate();
            return "redirect:login";
        }

}