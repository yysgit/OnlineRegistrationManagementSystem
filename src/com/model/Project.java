package com.model;

import java.util.Date;

public class Project {
   private Integer id;
   private String name;
   private Date holdTime;
   private String holdAddress;
   private Integer info;
   private String content;
   private String url;
   private Integer competitionId;




    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getHoldTime() {
        return holdTime;
    }

    public void setHoldTime(Date holdTime) {
        this.holdTime = holdTime;
    }

    public String getHoldAddress() {
        return holdAddress;
    }

    public void setHoldAddress(String holdAddress) {
        this.holdAddress = holdAddress;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getInfo() {
        return info;
    }

    public void setInfo(Integer info) {
        this.info = info;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getCompetitionId() {
        return competitionId;
    }

    public void setCompetitionId(Integer competitionId) {
        this.competitionId = competitionId;
    }
}
