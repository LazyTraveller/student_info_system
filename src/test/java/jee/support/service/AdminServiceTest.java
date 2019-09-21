package jee.support.service;

import jee.support.entity.Admin;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;


@RunWith(SpringJUnit4ClassRunner.class) //使用junit4进行测试
//spring的主配置文件
@ContextConfiguration(locations={"classpath:config/applicationContext.xml"})
public class AdminServiceTest {
    @Autowired
    AdminService adminService;

    @org.junit.Before
    public void setUp() throws Exception {

    }

    @Test
    public void getUser() {
       Admin user = adminService.getAdmin(1L);
       System.out.println(user);
       assertEquals(user.getAdminname(), "Nicholas");
    }
//
    @Test
    public void addUser() {
        Admin user = new Admin();
        user.setAdminname("Junit");
        user.setPassword("passw");
        user.setEmail("fadf@c.ocm");
        long userId = adminService.addAdmin(user);
        assertEquals(userId, 7);
    }
//
//
//    @org.junit.Test
//    public void delUser() {
//    }
//
//    @org.junit.Test
//    public void updateUser() {
//    }
//
    @org.junit.Test
    public void getUserList() {
    }

    @Test
    public void authenticate() {
        String username="admin";
        String password = "12345";

        Admin user = adminService.authenticate(username, password);
        assertEquals(user, null);
    }
}