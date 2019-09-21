package jee.support.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class IndexController {
    //设置系统主页
    @RequestMapping(value={"/", "/login"})
    public  String index(){
        return "login";
    }

    @GetMapping(value={"/test"})
    @ResponseBody
    public  String test(){
        return "login";
    }
}
