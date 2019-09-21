package jee.support.dao;

import jee.support.entity.Admin;
import org.apache.ibatis.annotations.Param;

//AdminDao接口类,封装对Admin对象CRUD操作
public interface AdminDao {

    //根据id获取用户对象,如果不存在返回null
    public Admin getAdminById(Object id);

    // 添加新的管理员,返回新添加管理员的id
    public long addAdmin( Admin admin);

    //校验是否存在该用户,不存在则返回null,存在则返回用户
    //使用@Param来传递参数,传入参数为username和password，该注释会以map(key-value)的形式封装起来
    public Admin findByNameAndPwd(@Param("adminname") String adminname,
                             @Param("password") String password);

    //删除管理员
    public void deleteAdmin(long adminId);

    //用户名重复检测
    public  Admin findByAdminname(String adminname);

}

