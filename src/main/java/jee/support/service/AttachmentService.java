package jee.support.service;


import jee.support.dao.AttachmentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AttachmentService {
    @Autowired
    AttachmentDao attachmentDao;

    public void deleteById(long id){
        attachmentDao.delete(id);
    }
}
