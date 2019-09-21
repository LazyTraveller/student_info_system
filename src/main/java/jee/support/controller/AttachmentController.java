package jee.support.controller;


import jee.support.service.AttachmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AttachmentController {

    @Autowired
    AttachmentService attachmentService;

    @RequestMapping("/del/{id}")
    @ResponseBody
    public  String del(@RequestParam @PathVariable("id") long id){
        attachmentService.deleteById(id);
        return "OK";
    }
}



