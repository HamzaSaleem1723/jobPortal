package MyPack;

import java.io.*;

public class JobInfo implements Serializable{

    private String jobID;
    private String title;
    private String description;
    private String email;

    public JobInfo(String jobID, String title, String description, String email) {
        this.jobID = jobID;
        this.title = title;
        this.description = description;
        this.email = email;
    }

    public JobInfo() {
    }

    public String getJobID() {
        return jobID;
    }

    public void setJobID(String jobID) {
        this.jobID = jobID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}