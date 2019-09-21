package jee.support;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Main {
//
//    public static void main(String[] args) {
//
//        Ticket ticket =  new Ticket();
//        ticket.setMoney("1533").setDateCreated(new Date())
//                .setBody("test").setStatus(1);
//        System.out.println(ticket);

//        Ticket ticket = new Ticket();
//        ticket.setMoney(99.9f);
//        ticket.setDateCreated(new Date());
//
//        System.out.println(ticket);


//        EntityManagerFactory emf = Persistence.createEntityManagerFactory(
//                "EntityMappings");
//
//        EntityManager manager = emf.createEntityManager();
//
//        Main mainer = new Main();
////        mainer.insertTickets(manager, 20);
////         mainer.insertUsers(manager);
//        System.out.println(manager.find(User.class, 1L).getEmail());
//        System.out.println("总记录数:" + mainer.findAll(manager).size());
//        System.out.println("Hello World!" + emf.toString());
//    }
//
//
//    public void insertTickets(EntityManager manager, int n) {
//        EntityTransaction transaction =
//                manager.getTransaction();
//        transaction.begin();
//
//        //插入10条记录
//        for (int i = 0; i < 10; ++i) {
//            Date date = new Date();
//            Ticket ticket = new Ticket("办公用品主题" + i, "2018购入商品一批",
//                    new Timestamp(date.getTime()), 50000.0f,
//                    "商业汇票");
//            ticket.setUserId(10L);
//            manager.persist(ticket);
//        }
//        transaction.commit();
//        System.out.println("数据插入数据库");
    }

//    public void insertUsers(EntityManager manager) {
//        EntityTransaction transaction =
//                manager.getTransaction();
//        transaction.begin();
//        User user1 = new User("Nicholas", "password", (byte)1, "test1@123" +
//                ".com");
//        User user2 = new User("Sarah", "drowssap", (byte)1, "test2@123.com");
//        User user3 = new User("Mike", "wordpass", (byte)1, "test3@123.com");
//        User user4 = new User("admin", "123456", (byte)1, "test4@123.com");
//        User user5 = new User("John", "green", (byte)1, "test5@123.com");
//        User user6 = new User("guest", "guest", (byte)1, "test6@123.com");
//        manager.persist(user1);
//        manager.persist(user2);
//        manager.persist(user3);
//        manager.persist(user4);
//        manager.persist(user5);
//        manager.persist(user6);
//        transaction.commit();
//        System.out.println("用户数据插入数据库");
//    }
//
//
//    //获取所有记录
//    List<Ticket> findAll(EntityManager manager) {
//        List<Ticket> list = new ArrayList<Ticket>();
////
////        list =
////                (List<Ticket>) manager.createQuery("select t from Ticket t").getResultList();
////        return list;
//    }
//}
