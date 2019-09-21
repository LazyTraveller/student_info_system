package jee.support.dao;
import jee.support.entity.Student;
import org.apache.ibatis.annotations.*;
import java.util.List;

//StudentDao类,封装对student对象CRUD操作
@Mapper
public interface StudentDao {
    //根据id获取票据对象,如果不存在返回null
    @Select("select * from student t where t.studentId=#{id}")
    @ResultMap("StudentWithAdminAndAtt") //返回结果使用xml文件定义的resultMap封装
    public Student getStudent(long id);

    //插入票据,返回新票据的id号
    @Insert("insert into student(adminId, name, address,DateCreated,cellphone," +
            "sex,status)" +
            " value(#{admin.adminId},#{name},#{address}, #{dateCreated}, #{cellphone}, " +
            "#{sex},#{status})")
    @Options(useGeneratedKeys = true, keyProperty = "studentId")
    public long addStudent(Student student);

    //删除票据
    @Delete("delete from student  where studentId=#{id}")
    public int delStudent(long studentId);

    //根据票据主体进行模糊查询
   public List<Student> findByNameLike(String keyword);


   public List<Student> findByNameAndSex(String keyword);

    //更新票据信息
    @Update("update student  set name=#{name}, address=#{address}, cellphone=#{cellphone}," +
            "sex=#{sex} where studentId=#{studentId}")
    public int updateStudent(Student student);

    //获取票据列表
    @Select("select * from student")
    @ResultMap("StudentWithAdminAndAtt")
    public List<Student> findAllStudent();

}

