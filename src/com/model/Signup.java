package com.model;

import java.util.Date;

public class Signup {
    private Integer id;

    private Integer projectId;
    private Integer schoolId;
    private String ranks;
    private String captain;
    private String instructor;
    private String contestants;
    private Integer createUserId;
    private Integer peopleNum;
    private String programName;
    private String programEngName;
    private String participatingAccount;
    private String phoneNum;
    private String company;
    private Integer status;


    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public Integer getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(Integer schoolId) {
        this.schoolId = schoolId;
    }

    public String getRanks() {
        return ranks;
    }

    public void setRanks(String ranks) {
        this.ranks = ranks;
    }

    public String getCaptain() {
        return captain;
    }

    public void setCaptain(String captain) {
        this.captain = captain;
    }

    public String getInstructor() {
        return instructor;
    }

    public void setInstructor(String instructor) {
        this.instructor = instructor;
    }

    public String getContestants() {
        return contestants;
    }

    public void setContestants(String contestants) {
        this.contestants = contestants;
    }

    public Integer getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Integer createUserId) {
        this.createUserId = createUserId;
    }

    public Integer getPeopleNum() {
        return peopleNum;
    }

    public void setPeopleNum(Integer peopleNum) {
        this.peopleNum = peopleNum;
    }

    public String getProgramName() {
        return programName;
    }

    public void setProgramName(String programName) {
        this.programName = programName;
    }

    public String getProgramEngName() {
        return programEngName;
    }

    public void setProgramEngName(String programEngName) {
        this.programEngName = programEngName;
    }

    public String getParticipatingAccount() {
        return participatingAccount;
    }

    public void setParticipatingAccount(String participatingAccount) {
        this.participatingAccount = participatingAccount;
    }


    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }
}
