package jee.support.controller;

import com.github.pagehelper.PageInfo;
import jee.support.constants.Constants;
import jee.support.entity.Attachment;
import jee.support.entity.Student;
import jee.support.entity.Admin;
import jee.support.dao.AdminDao;
import jee.support.service.AdminService;
import jee.support.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    StudentService studentService;
    @Autowired
    AdminService adminService;
    @Autowired
    AdminDao adminDao;
//处理点击添加学生信息按钮
    @RequestMapping(value = {"/create"}, method = RequestMethod.GET)
    public String toCreateStudentForm(){
        return "addStudent";
    }
//处理点击查询学生信息按钮
    @RequestMapping(value = {"/query"}, method = RequestMethod.GET)
    public String selectAAA(){
        return "select";
    }

    @RequestMapping(value = {"/adminInfo"}, method = RequestMethod.GET)
    public String lookinformation(){
        return "sessions";
    }

    //处理文件上传
    public List uploadFiles(@RequestParam("file") MultipartFile[] files,
                                    HttpServletRequest request) throws IOException {
        String savePath = request.getServletContext().getRealPath("/upload");
        File dir = new File(savePath);
        //判断上传文件夹是否存在
        if (!dir.exists()) {
            dir.mkdirs();
        }

        HttpSession session = request.getSession();
        //获取当前登录用户
       Admin admin = (Admin) session.getAttribute(Constants.SESSION_USER);
        List attachmentList = new ArrayList<Attachment>();
        for (MultipartFile  file: files) {
            Attachment attachment = new Attachment();
            //文件名为用户名id_文件名
            String filename = admin.getAdminId()+"_"+ file.getOriginalFilename();
            //保存文件
            if(!file.isEmpty()) {
                File newFile = new File(dir, filename);
                file.transferTo(newFile);
                attachment.setFileName(filename);
                attachment.setMimeType(file.getContentType());
                attachment.setFileUrl("/upload/" + filename);
                attachmentList.add(attachment);
            }
        }
        return attachmentList;
    }

    //添加学生信息  POST请求
    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public String createStudent(Student student,
                               @RequestParam("file") MultipartFile[] files,
                               HttpServletRequest request,
                               Model model,
                               HttpSession session) throws IOException {

        if(files==null){
           model.addAttribute("msg","文件为空");
          return "/create";

        }
            //接收客户上传的文件
            List attachmentList= uploadFiles(files, request);
            //将相关记录插入数据库
            System.out.println(student);
            //获取当前用户对象
            Admin admin = (Admin) session.getAttribute(Constants.SESSION_USER);
            student.setAdmin(admin);
            student.setAttachments(attachmentList);
            long studentId = studentService.addStudent(student);
            //跳转到查看详情的界面
            return "redirect:/view/"+studentId;


    }

    //查看学生信息
    @RequestMapping("/view/{studentId}")
    public String viewStudent(@PathVariable("studentId") Long id,
                             Model model){
       Student student = studentService.getStudent(id);
        model.addAttribute("student", student);
        return "viewStudent";
    }
    //查看管理员信息
    @RequestMapping( "/sessions")
    public String ShowInfo(Model model,HttpSession session){
        Admin admin = (Admin) session.getAttribute("adminId");
//        Object id=session.getAttribute("adminId");
//        Admin admin=adminService.getAdminById(id);
        model.addAttribute("admin",admin);
        return "sessions";
    }


    //查询学生信息
    @RequestMapping(value = "/select", method = RequestMethod.GET)
    public String selectStudent(@RequestParam( "name") String name, Model model){
        if (name.isEmpty()){
            model.addAttribute("msg","请输入要查询的名字！");
        }
        //student是一个存储了数据的list集合
        //动态查询
//        List<Student>  resultstudent =studentService.findByNameAndSex(name);
        //模糊查询
        List<Student>  resultstudent =studentService.findByNameLike(name);
//


        if(!resultstudent.isEmpty()){
            System.out.println(name);
            model.addAttribute("resultstudent", resultstudent);
            for(int i=0;i<resultstudent.size()-1;i++){
                System.out.println(resultstudent.get(i));
            }
            System.out.println(resultstudent.size());
            System.out.println("显示成功");
        }else {
            model.addAttribute("msg","查找不到该学生信息！");
        }
        return "select";
    }

    //分页显示
    @GetMapping(value = {"/list","/",""})
    public String pageStudentList(@RequestParam(value = "page", defaultValue = "1") int page,
                                 @RequestParam(value = "size", defaultValue = "10") int size,
                                 Model model){

        //默认每页记录
        PageInfo<Student> pageInfo = studentService.findStudentList(page, size);
        model.addAttribute("pageInfo", pageInfo);
        return  "listStudentPage";
    }

    //跳转到编辑的页面
    @RequestMapping(value = "/edit/{studentId}", method = RequestMethod.GET)
    public String toEdit(@PathVariable("studentId") Integer id, Model model){
        //获取
        Student student = studentService.getStudent(id);
        model.addAttribute("studentId", id);
        model.addAttribute("student", student);
        return "editStudent";
    }

    //更新对象
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(Student student ,
                         @RequestParam("studentId") long studentId,
                         Model model,
                         HttpSession session){

        studentService.updateStudent(studentId, student);
        return "redirect:/student/view/"+studentId;
    }


    //删除对象
    @RequestMapping(value = "/del/{studentId}", method = RequestMethod.GET)
    public String delete(@PathVariable("studentId") long studentId){
        //获取
        studentService.delStudent(studentId);
        return "redirect:/student";
    }



}
