package pojo;
// Generated 03-Sep-2019 12:32:22 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * EnumAccountStatus generated by hbm2java
 */
public class EnumAccountStatus  implements java.io.Serializable {


     private Integer idenumaccountstatus;
     private String status;
     private Set accounts = new HashSet(0);

    public EnumAccountStatus() {
    }

    public EnumAccountStatus(String status, Set accounts) {
       this.status = status;
       this.accounts = accounts;
    }
   
    public Integer getIdenumaccountstatus() {
        return this.idenumaccountstatus;
    }
    
    public void setIdenumaccountstatus(Integer idenumaccountstatus) {
        this.idenumaccountstatus = idenumaccountstatus;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    public Set getAccounts() {
        return this.accounts;
    }
    
    public void setAccounts(Set accounts) {
        this.accounts = accounts;
    }




}


