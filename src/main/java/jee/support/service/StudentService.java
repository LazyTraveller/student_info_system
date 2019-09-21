package jee.support.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jee.support.dao.AttachmentDao;
import jee.support.dao.StudentDao;
import jee.support.entity.Attachment;
import jee.support.entity.Student;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

//TicketDao类,封装对ticket对象CRUD操作
@Service
public class StudentService {
    @Autowired
    StudentDao studentDao;

    @Autowired
    AttachmentDao attachmentDao;
    //根据id获取票据对象,如果不存在返回null
    public Student getStudent(long id) {
        return studentDao.getStudent(id);
    }

    // 添加票据,返回该票据对应的id号
    @Transactional(rollbackFor = Exception.class)  //处理事务回滚
    public long addStudent(Student student) {
        //设置票据默认信息
        student.setDateCreated(new Date());
        student.setStatus(0);
         studentDao.addStudent(student);
        // 插入票据记录,获取票据id
        long studentId = student.getStudentId();
        System.out.println("new id:" + studentId);
        //插入附件记录到数据库
        for (Attachment attachment: student.getAttachments()) {
            attachment.setStudentId(studentId);//设置ticketId
            attachmentDao.addAttachment(attachment);
        }
         return studentId;
    }

    //删除学生信息
    @Transactional
    public int delStudent(long studentId) {
        return studentDao.delStudent(studentId);
    }

    //根据票据主体进行模糊查询
    public List<Student> findByNameLike(String keyword){
        return studentDao.findByNameLike(keyword) ;
    }
//动态查询
  public List<Student> findByNameAndSex(String keyword){
        return studentDao.findByNameAndSex(keyword);
  }



    //更新票据信息
//    返回受影响的行数
    @Transactional
    public int  updateStudent(long id, Student student) {
        student.setStudentId(id); //设置更新的ticket的id
        return studentDao.updateStudent(student);
    }

     //获取票据列表
    //入参: 当期页, 每页的记录数
    public PageInfo<Student> findStudentList(int page, int size){
        PageHelper.startPage(page, size);
        List list = studentDao.findAllStudent();
        PageInfo<Student> pageInfo = new PageInfo<>(list);

        return  pageInfo;  //获取分页对象
    }

    public static void main(String[] args) {
        BeanFactory factory = new ClassPathXmlApplicationContext("config" +
                "/applicationContext.xml");
        System.out.println(factory);
        StudentService studentService = (StudentService) factory.getBean("studentService");
//
       Student student= studentService.getStudent(41);
        System.out.println( student.getName());
        //查询用户名
        System.out.println( student.getAdmin().getAdminname());
    }
}

