package jee.support.dao;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jee.support.entity.Student;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import sun.security.krb5.internal.Ticket;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class) //使用junit4进行测试
@ContextConfiguration(locations={"classpath:config/applicationContext.xml"})

public class PageHelperTest {

    @Autowired
    StudentDao studentDao;

    @Test
    public void testPageHelper() {
    PageHelper.startPage(1, 5);
    List<Student> list = studentDao.findByNameLike("6");
    PageInfo<Student> pageInfo = new PageInfo<>(list);

    System.out.println("一共"+pageInfo.getPages()+"页");

    }
}

