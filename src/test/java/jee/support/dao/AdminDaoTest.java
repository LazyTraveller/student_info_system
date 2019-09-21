package jee.support.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class) //使用junit4进行测试
@ContextConfiguration(locations={"classpath:config/applicationContext.xml"})

public class AdminDaoTest {

    @Autowired
    AdminDao adminDao;
    @Test
    public void getUserById() {
    }

    @Test
    public void addUser() {
    }

    @Test
    public void findByNameAndPwd() {
    }

    @Test
    public void deleteUser() {

        adminDao.deleteAdmin(7L);
    }
}