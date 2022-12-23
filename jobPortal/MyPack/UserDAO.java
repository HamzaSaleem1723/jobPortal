package MyPack;

import java.sql.*;
import java.util.ArrayList;

public class UserDAO {

    private Connection con;

    public UserDAO() throws ClassNotFoundException,SQLException{
        establishConnection(); }

    private void establishConnection() throws ClassNotFoundException,SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://127.0.0.1/project";
        con = DriverManager.getConnection(url,"root","root");
    }

    public int addUser(User user) throws SQLException{

        String sql = " INSERT INTO users VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement pStmt = con.prepareStatement(sql);

        String username = user.getUsername();
        String password = user.getPassword();
        String email = user.getEmail();
        String phone = user.getPhone();
        String address = user.getAddress();

        pStmt.setString( 1 , username );
        pStmt.setString( 2 , password );
        pStmt.setString( 3 , email );
        pStmt.setString( 4 , phone );
        pStmt.setString( 5 , address );
        pStmt.setString( 6 , "0" );

        int rv = pStmt.executeUpdate();
        return rv;

    }

    public int login(String email,String password){

        int user_type = -1;
        try{
            Statement st = con.createStatement();
            String query = "Select * from users where email = '"+email+"' && password = '"+password+"'";
            System.out.println(query);
            ResultSet rs = st.executeQuery(query);

            if(rs.next()) {
                user_type = rs.getInt("user_type");
                return user_type;
            }

        }
        catch (Exception e){
            System.out.println(e);
        }
        return user_type;

    }

    //Jobs Related Code

    public int addJob(JobInfo jobinfo) throws SQLException{

        String sql = " INSERT INTO jobs VALUES (?, ?, ?, ?)";
        PreparedStatement pStmt = con.prepareStatement(sql);

        String jobID = jobinfo.getJobID();
        String title = jobinfo.getTitle();
        String description = jobinfo.getDescription();
        String email = jobinfo.getEmail();

        pStmt.setString( 1 , jobID );
        pStmt.setString( 2 , title );
        pStmt.setString( 3 , description );
        pStmt.setString( 4 , email );

        int rv = pStmt.executeUpdate();
        return rv;

    }

    public int updateJobRecord(JobInfo jobinfo) throws SQLException{

        String sql = "UPDATE jobs SET JobID = ?, Title= ?, Description= ?, Email= ? WHERE JobID = ?;";
        PreparedStatement pStmt = con.prepareStatement(sql);

        String jobID = jobinfo.getJobID();
        String title = jobinfo.getTitle();
        String description = jobinfo.getDescription();
        String email = jobinfo.getEmail();

        pStmt.setString( 1 , jobID );
        pStmt.setString( 2 , title );
        pStmt.setString( 3 , description );
        pStmt.setString( 4 , email );
        int intJobID = Integer.parseInt(jobID);
        pStmt.setString( 5 , jobID);

        int rv = pStmt.executeUpdate();
        return rv;

    }

    public int deleteJobRecord(String jobID) throws SQLException{

        String sql = "DELETE FROM jobs WHERE JobID= ? ;";
        PreparedStatement pStmt = con.prepareStatement(sql);

        pStmt.setString( 1 , jobID );

        int rv = pStmt.executeUpdate();
        return rv;

    }

    public ArrayList<JobInfo> searchJobRecords(String recordToSearch){

        ArrayList<JobInfo> jobsArrayList = new ArrayList<JobInfo>();

        try{
            Statement st = con.createStatement();
            String query = "Select * from jobs WHERE JobID LIKE '%"+recordToSearch+"%' OR Title LIKE '%"+recordToSearch+"%' OR Description LIKE '%"+recordToSearch+"%' OR Email LIKE '%"+recordToSearch+"%';";
            System.out.println(query);
            ResultSet rs = st.executeQuery(query);

            while(rs.next()) {
                String jobID = rs.getString("JobID");
                String title = rs.getString("Title");
                String description = rs.getString("Description");
                String email = rs.getString("Email");
                JobInfo jobInfo = new JobInfo(jobID,title,description,email);
                jobsArrayList.add(jobInfo);
            }

        }
        catch (Exception e){
            System.out.println(e);
        }
        return jobsArrayList;


    }


    public ArrayList<JobInfo> fetchJobRecords(){

        ArrayList<JobInfo> jobsArrayList = new ArrayList<JobInfo>();

        try{
            Statement st = con.createStatement();
            String query = "Select * from jobs";
            System.out.println(query);
            ResultSet rs = st.executeQuery(query);

            while(rs.next()) {
                String jobID = rs.getString("JobID");
                String title = rs.getString("Title");
                String description = rs.getString("Description");
                String email = rs.getString("Email");
                JobInfo jobInfo = new JobInfo(jobID,title,description,email);
                jobsArrayList.add(jobInfo);
            }

        }
        catch (Exception e){
            System.out.println(e);
        }
        return jobsArrayList;


    }




}
