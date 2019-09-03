package pojo;
// Generated 03-Sep-2019 12:32:22 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * EnumSubject generated by hbm2java
 */
public class EnumSubject  implements java.io.Serializable {


     private Integer idenumsubject;
     private String subject;
     private Set questionSets = new HashSet(0);
     private Set enumSectionses = new HashSet(0);

    public EnumSubject() {
    }

    public EnumSubject(String subject, Set questionSets, Set enumSectionses) {
       this.subject = subject;
       this.questionSets = questionSets;
       this.enumSectionses = enumSectionses;
    }
   
    public Integer getIdenumsubject() {
        return this.idenumsubject;
    }
    
    public void setIdenumsubject(Integer idenumsubject) {
        this.idenumsubject = idenumsubject;
    }
    public String getSubject() {
        return this.subject;
    }
    
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public Set getQuestionSets() {
        return this.questionSets;
    }
    
    public void setQuestionSets(Set questionSets) {
        this.questionSets = questionSets;
    }
    public Set getEnumSectionses() {
        return this.enumSectionses;
    }
    
    public void setEnumSectionses(Set enumSectionses) {
        this.enumSectionses = enumSectionses;
    }




}

