package pojo;
// Generated 03-Sep-2019 12:32:22 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Account generated by hbm2java
 */
public class Account  implements java.io.Serializable {


     private Integer idaccount;
     private EnumAccountStatus enumAccountStatus;
     private String name;
     private Set users = new HashSet(0);

    public Account() {
    }

	
    public Account(EnumAccountStatus enumAccountStatus) {
        this.enumAccountStatus = enumAccountStatus;
    }
    public Account(EnumAccountStatus enumAccountStatus, String name, Set users) {
       this.enumAccountStatus = enumAccountStatus;
       this.name = name;
       this.users = users;
    }
   
    public Integer getIdaccount() {
        return this.idaccount;
    }
    
    public void setIdaccount(Integer idaccount) {
        this.idaccount = idaccount;
    }
    public EnumAccountStatus getEnumAccountStatus() {
        return this.enumAccountStatus;
    }
    
    public void setEnumAccountStatus(EnumAccountStatus enumAccountStatus) {
        this.enumAccountStatus = enumAccountStatus;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public Set getUsers() {
        return this.users;
    }
    
    public void setUsers(Set users) {
        this.users = users;
    }




}


