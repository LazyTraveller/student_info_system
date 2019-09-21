package jee.support.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Objects;

@Data
public class Admin {
    private long adminId;  //用户id
    private String adminname; //管理员姓名
    private String password; //密码
    private int accountNonExpired; //是否过期
    private int accountNonLocked; //是否被锁住
    private int enabled;    //是否激活
    private String email;   //email地址

    public long getAdminId() {
        return adminId;
    }

    public void setAdminId(long adminId) {
        this.adminId = adminId;
    }

    public String getAdminname() {
        return adminname;
    }

    public void setAdminname(String adminname) {
        this.adminname = adminname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAccountNonExpired() {
        return accountNonExpired;
    }

    public void setAccountNonExpired(int accountNonExpired) {
        this.accountNonExpired = accountNonExpired;
    }

    public int getAccountNonLocked() {
        return accountNonLocked;
    }

    public void setAccountNonLocked(int accountNonLocked) {
        this.accountNonLocked = accountNonLocked;
    }

    public int getEnabled() {
        return enabled;
    }

    public void setEnabled(int enabled) {
        this.enabled = enabled;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public Admin(){

    }


    public Admin(String adminname, String password, int enabled, String email) {
        this.adminname = adminname;
        this.password = password;
        this.enabled = enabled;
        this.email = email;
    }
}
