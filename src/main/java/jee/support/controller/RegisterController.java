package jee.support.controller;

import jee.support.entity.Admin;
import jee.support.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class RegisterController {
    @Autowired
    AdminService adminService;
    //判断是否存在相同的用户名
    @RequestMapping("/checkAdminname")
    @ResponseBody
    public String exitUsername(@RequestBody Admin admin){
        System.out.println("###"+admin.getAdminname());
        if(adminService.findByAdminname(admin.getAdminname())==null)
            return "OK";
        return "FALL";
    }
}
