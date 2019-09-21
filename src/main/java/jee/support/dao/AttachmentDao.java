package jee.support.dao;

import jee.support.entity.Attachment;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface AttachmentDao {

    @Delete("delete from attachment where attachmentId=#{id}")
    public void delete(@Param("id") long id);

    //根据ticketId查找附件
    @Select("select * from attachment where  studentId=#{ studentId}")
    public List<Attachment> findByStudentId(long ticketId);

    public long addAttachment(Attachment attachment);
}
