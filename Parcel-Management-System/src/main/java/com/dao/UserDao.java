package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.dao.bean.User;

public class UserDao {


	public static Connection getConnection() {
		
		Connection con = null;
	
		try {
		
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_db", "root", "swag");
		
		}catch(Exception ex) {
		
			System.out.println(ex);
		
		}
		return con;
	}
	
	///////////////////CUSTOMER PAGES
	//get data from registration form, return status if successful
	public static int signup (User u) {
		
		int status = 0;
		
		try {
			//sub interface of statement used to execute parameterized query 
			Connection con = getConnection();
			//sets the string value to the given parameter index
			//string 1 = u.getfName;
			PreparedStatement pst = con.prepareStatement("INSERT INTO customer (fName, lName, email, password, phoneNo, country) VALUES (?,?,?,?,?,?)");
			pst.setString(1, u.getfName());
			pst.setString(2, u.getlName());
			pst.setString(3, u.getEmail());
			pst.setString(4, u.getPassword());
			pst.setString(5, u.getPhoneNo());
			pst.setString(6, u.getCountry());
			status = pst.executeUpdate();
			
		}catch(Exception ex) {
			
			System.out.println(ex);
			
		}
		return status;
	}

	//get data from login form, return status if user exist 
	public static int loginCustomer(User u) {
		
		int status = 0; 
		
		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select * from customer where email=? and password =?");
			pst.setString(1, u.getEmail());
			pst.setString(2, u.getPassword());
			//execute the select query 
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				status=1;
				con.close();
			}
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return status;
	}
	
	public static User trackParcel (String pID) {
		
		User u = null;
		
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("SELECT * FROM parcel WHERE pID=?");
			pst.setString(1, pID);
			ResultSet rs = pst.executeQuery();
			u = new User();
			while(rs.next()) {
				u.setpID(rs.getString("pID"));
				u.setcID(rs.getInt("cID"));
				u.setpDateReceived(rs.getString("pDateReceived"));
				u.setpStatus(rs.getString("pStatus"));
				u.setpCollectedDate(rs.getString("pCollectedDate"));
			}
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return u;
	}
	
	//get username and return user un-collected parcels
	public static List<User>trackParcelCustomer(String email) {
		
		//hold lists of parcels 
		List<User>list = new ArrayList<User>();
		
		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"select * from parcel right join customer\r\n"
					+ "on parcel.cID = customer.cID \r\n"
					+ "where customer.email=? \r\n"
					+ "and parcel.pStatus='Not Collected'");
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				User u = new User();
				//set user variable from the value we get from the query 
				//user.pID = getString named pID
				u.setpID(rs.getString("pID"));
				u.setcID(rs.getInt("cID"));
				u.setpDateReceived(rs.getString("pDateReceived"));
				u.setpStatus(rs.getString("pStatus"));
				u.setpCollectedDate(rs.getString("pCollectedDate"));
				list.add(u);//setup the list 
			}
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return list;
	}
	
	//get user email and return user profile data 
	public static User viewProfile(String email){
		
		User u = null;
	
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select * from customer where email=?");
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			u = new User();
			while(rs.next()) {
				u.setcID(rs.getInt("cID"));
				u.setfName(rs.getString("fName"));
				u.setlName(rs.getString("lName"));
				u.setEmail(rs.getString("email"));
				u.setPassword(rs.getString("password"));
				u.setPhoneNo(rs.getString("phoneNo"));
				u.setCountry(rs.getString("country"));
			}
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return u;
	}
	
	//get data from schedule form, pass status if successful 
	public static int addSchedule (User u) {
		
		int status = 0;
		
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(""
					+ "insert into schedule (cID, pScheduleDate, pScheduleTime)\r\n"
					+ "VALUES (?,?,?);");
			pst.setInt(1, u.getcID());
			pst.setString(2, u.getpScheduleDate());
			pst.setString(3, u.getpScheduleTime());
			
			status = pst.executeUpdate();
			
		}catch(Exception ex) {
			
			System.out.println(ex);
			
		}
		return status;
	}
	
	//get user email, return user schedules
	public static List<User>viewScheduleCustomer(String email){
		
		List<User>list = new ArrayList<User>();
	
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(""
					+ "select distinct scID, pScheduleDate, pScheduleTime from schedule \r\n"
					+ "right join parcel on schedule.cID = parcel.cID \r\n"
					+ "right join customer on schedule.cID = customer.cID\r\n"
					+ "where customer.email=? and pStatus='Not Collected'");
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				User u = new User();
				u.setscID(rs.getInt("scID"));
				u.setpScheduleDate(rs.getString("schedule.pScheduleDate"));
				u.setpScheduleTime(rs.getString("schedule.pScheduleTime"));
				list.add(u);
			}
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return list;
	}
	
	//get scheduleID and return the schedule data  
	public static User viewScheduleCustomerEdit(int scID) {

		User u = null;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select * from schedule where scID=?");
			pst.setInt(1, scID);
			ResultSet rs = pst.executeQuery();
			u = new User();
			while(rs.next()) {
				u.setscID(rs.getInt("scID"));
				u.setcID(rs.getInt("cID"));
				u.setpScheduleDate(rs.getString("pScheduleDate"));
				u.setpScheduleTime(rs.getString("pScheduleTime"));
			}

		}catch(Exception ex) {
			System.out.println(ex);
		}
		return u;
	}
	
	//get scheduleID and return status if successful 
	public static int deleteSchedule (int scID) {
		
		int status=0;
		
		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("delete from schedule where scID=?");
			pst.setInt(1, scID);
		
			status = pst.executeUpdate();
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return status;
	}
	
	//get user data from profile form, return status if updated successfully
	public static int updateProfile (User u) {
		
		int status=0;
		
		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(""
					+ "update customer set fName=?, lName=?, email=?, "
					+ "password=?, phoneNo=?, country=? WHERE email=?");
			pst.setString(1, u.getfName());
			pst.setString(2, u.getlName());
			pst.setString(3, u.getEmail());
			pst.setString(4, u.getPassword());
			pst.setString(5, u.getPhoneNo());
			pst.setString(6, u.getCountry());
			pst.setString(7, u.getEmail());
			
			status = pst.executeUpdate();
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return status;
	}
	
	//get user email and return data for view collection history
	public static List<User>viewCollectionHistory(String email){
		
		List<User>list = new ArrayList<User>();
	
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select * from parcel right join customer on parcel.cID = customer.cID\r\n"
					+ "WHERE pStatus = 'Collected' and email = ?");
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				
				User u = new User();
				u.setcID(rs.getInt("cID"));
				u.setpID(rs.getString("parcel.pID"));
				u.setpStatus(rs.getString("parcel.pStatus"));
				u.setpDateReceived(rs.getString("pDateReceived"));
				u.setpCollectedDate(rs.getString("pCollectedDate"));
				list.add(u);
			}
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return list;
	}

	//get form information, and return status if update successful
	public static int updateSchedule (User u) {
		
		int status=0;
		
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("update schedule set pScheduleDate=?, pScheduleTime=? where scID=?;");
			pst.setString(1, u.getpScheduleDate());
			pst.setString(2, u.getpScheduleTime());
			pst.setInt(3, u.getscID());

			
			status = pst.executeUpdate();
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return status;
	}
	
	
	//////////////////ADMIN PAGES
	
	//get form data and return status
	public static int loginAdmin(User u) {
		
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select * from admin where email=? and password =? and role='Admin'");
			pst.setString(1, u.getEmail());
			pst.setString(2, u.getPassword());
			//execute the select query 
			ResultSet rs = pst.executeQuery();
			if(rs.next()) 
				status=1;
			con.close();
		}catch(Exception ex) {
			
			System.out.println(ex);
			
		}
		return status;
	}
	
	//get form data to store staff data and return status
	public static int addStaff (User u) {
		
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(""
					+ "INSERT INTO admin (fName, lName, email, phoneNo, country, password, role) "
					+ "VALUES (?,?,?,?,?,?,?)");
			pst.setString(1, u.getfName());
			pst.setString(2, u.getlName());
			pst.setString(3, u.getEmail());
			pst.setString(4, u.getPhoneNo());
			pst.setString(5, u.getCountry());
			pst.setString(6, u.getPassword());
			pst.setString(7, u.getRole());
			
			status = pst.executeUpdate();
			
		}catch(Exception ex) {
			
			System.out.println(ex);
			
		}
		return status;
	}
	
	//return list of staffs
	public static List<User>viewStaffList(){
		
		List<User>list = new ArrayList<User>();
	
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("SELECT * FROM admin");
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				
				User u = new User();
				u.setsID(rs.getInt("sID"));
				u.setfName(rs.getString("fName"));
				u.setlName(rs.getString("lName"));
				u.setEmail(rs.getString("email"));
				u.setPhoneNo(rs.getString("phoneNo"));
				u.setCountry(rs.getString("country"));
				u.setRole(rs.getString("role"));
				list.add(u);
			}
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return list;
	}
	
	//get form data and return status if delete successful
	public static int deleteStaff (User u) {
		
		int status=0;
		
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("DELETE FROM admin WHERE sID=?");
			pst.setInt(1, u.getsID());
		
			status = pst.executeUpdate();
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return status;
	}
	
	//get form data and return status if update successful 
	public static int updateStaff (User u) {
		
		int status=0;
		
		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(""
					+ "update admin set fName=?, lName=?, email=?, "
					+ "password=?, phoneNo=?, country=? WHERE sID=?");
			pst.setString(1, u.getfName());
			pst.setString(2, u.getlName());
			pst.setString(3, u.getEmail());
			pst.setString(4, u.getPassword());
			pst.setString(5, u.getPhoneNo());
			pst.setString(6, u.getCountry());
			pst.setInt(7, u.getsID());
			
			status = pst.executeUpdate();
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return status;
	}
	
	//return number of collected and uncollected parcels
	public static User viewParcelSummary() { 
		
		User u = null;
		
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select distinct (select count(pStatus) from parcel where pStatus='Collected') as pStatusCol, \r\n"
					+ "(select count(pStatus) from parcel where pStatus='Not Collected') as pStatusNotCol, \r\n"
					+ "count(pStatus) as pStatusAdd\r\n"
					+ "from parcel");
			ResultSet rs = pst.executeQuery();
			u = new User();
			while(rs.next()) {
				u.setpStatus(rs.getString("pStatusCol"));
				u.setpStatusNot(rs.getString("pStatusNotCol"));
				u.setAddPstatus(rs.getString("pStatusAdd"));
			}
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return u;
	}

	//get email return staff data 
	public static User staffListEdit(int sID){  
		
		User u = null;
	
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("SELECT * FROM admin WHERE sID=?");
			pst.setInt(1, sID);
			ResultSet rs = pst.executeQuery();
			u = new User();
			while(rs.next()) {
				u.setsID(rs.getInt("sID"));
				u.setfName(rs.getString("fName"));
				u.setlName(rs.getString("lName"));
				u.setEmail(rs.getString("email"));
				u.setPassword(rs.getString("password"));
				u.setPhoneNo(rs.getString("phoneNo"));
				u.setCountry(rs.getString("country"));
				u.setRole(rs.getString("role"));
			}
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return u;
	}

	//get form data and verify if staff exist
	public static int isStaffExist(User u) {
		
		int status = 0;
		
		try {
			
			Connection con = getConnection();
			Statement stmt=con.createStatement();
			PreparedStatement ps=con.prepareStatement("SELECT * FROM admin WHERE sID=?");
			ps.setInt(1, u.getsID());
			ResultSet rs = ps.executeQuery();
			if(rs.next())
				status=1;
			con.close();
				
			
		}catch(Exception ex) {
			
			System.out.println(ex);
			
		}
		return status;
	}

	//return list of all parcels 
	public static List<User>adminParcelSummary(){
		
		List<User>list = new ArrayList<User>();
	
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("SELECT * FROM parcel");
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				
				User u = new User();
				u.setpID(rs.getString("pID"));
				u.setcID(rs.getInt("cID"));
				u.setpStatus(rs.getString("pStatus"));
				u.setpDateReceived(rs.getString("pDateReceived"));
				u.setpCollectedDate(rs.getString("pCollectedDate"));
				list.add(u);
			}
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return list;
	}

	
	///////////////////STAFF PAGES
	//get user login form and return status if successful 
	public static int loginStaff(User u) {
		
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select * from admin where email=? and password =? and role='Staff'");
			pst.setString(1, u.getEmail());
			pst.setString(2, u.getPassword());
			//execute the select query 
			ResultSet rs = pst.executeQuery();
			if(rs.next()) 
				status=1;
			con.close();
		}catch(Exception ex) {
			
			System.out.println(ex);
			
		}
		return status;
	}
	
	//get user form data and return status if update successful
	public static int updateParcel (User u) {
		
		int status=0;
		
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("UPDATE parcel SET pID=?, cID=?, pDateReceived=?, pStatus=?, pCollectedDate=? WHERE pID=?");
			pst.setString(1, u.getpID());
			pst.setInt(2, u.getcID());
			pst.setString(3, u.getpDateReceived());
			pst.setString(4, u.getpStatus());
			pst.setString(5, u.getpCollectedDate());
			pst.setString(6, u.getpID());
			
			status = pst.executeUpdate();
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return status;
	}
	
	//get user form and return status if update successful
	public static int deleteParcel (User u) {
		
		int status=0;
		
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("DELETE FROM parcel WHERE pID=?");
			pst.setString(1, u.getpID());
		
			status = pst.executeUpdate();
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return status;
	}
	
	//get user form and return if add successful
	public static int addParcel (User u) {
		
		int status = 0;
		
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("INSERT INTO parcel (pID, cID, pDateReceived, pStatus) VALUES (?,?,?,?)");
			pst.setString(1, u.getpID());
			pst.setInt(2, u.getcID());
			pst.setString(3, u.getpDateReceived());
			pst.setString(4, u.getpStatus());
			
			status = pst.executeUpdate();
			
		}catch(Exception ex) {
			
			System.out.println(ex);
			
		}
		return status;
	}
	

	//get input pID and return list of parcels data
	public static List<User>searchParcel (String pID) {
		
		List<User>list = new ArrayList<User>();
		
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select * from parcel where pID=?");
			pst.setString(1, pID);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				User u = new User();
				u.setpID(rs.getString("pID"));
				u.setcID(rs.getInt("cID"));
				u.setpDateReceived(rs.getString("pDateReceived"));
				u.setpStatus(rs.getString("pStatus"));
				u.setpCollectedDate(rs.getString("pCollectedDate"));
				list.add(u);
			}
				
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return list;
	}
	
	//return list of schedule created by the users
	public static List<User>viewSchedule(){
		
		List<User>list = new ArrayList<User>();
	
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("SELECT schedule.*, parcel.* FROM schedule RIGHT JOIN parcel ON schedule.cID = parcel.cID \r\n"
					+ "WHERE pStatus='Not Collected'");
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				
				User u = new User();
				u.setpID(rs.getString("pID"));
				u.setpScheduleDate(rs.getString("pScheduleDate"));
				u.setpScheduleTime(rs.getString("pScheduleTime"));
				u.setcID(rs.getInt("parcel.cID"));
				u.setpStatus(rs.getString("pStatus"));
				list.add(u);
			}
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return list;
	}

	//get email and return staff data
	public static User viewStaff(String i){  
		
		User u = null;
	
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("SELECT * FROM admin WHERE email=?");
			pst.setString(1, i);
			ResultSet rs = pst.executeQuery();
			u = new User();
			while(rs.next()) {
				u.setsID(rs.getInt("sID"));
				u.setfName(rs.getString("fName"));
				u.setlName(rs.getString("lName"));
				u.setEmail(rs.getString("email"));
				u.setPassword(rs.getString("password"));
				u.setPhoneNo(rs.getString("phoneNo"));
				u.setCountry(rs.getString("country"));
				u.setPassword(rs.getString("password"));
				u.setRole(rs.getString("role"));
			}
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return u;
	}

	//get form data and return if update successful
	public static int updateStaffProfile(User u) {
		
		int status=0;
		
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("UPDATE admin SET fName=?, lName=?, email=?, phoneNo=?, country=?, password=? WHERE email=?");
			pst.setString(1, u.getfName());
			pst.setString(2, u.getlName());
			pst.setString(3, u.getEmail());
			pst.setString(4, u.getPhoneNo());
			pst.setString(5, u.getCountry());
			pst.setString(6, u.getPassword());
			pst.setString(7, u.getEmail());
			
			status = pst.executeUpdate();
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return status;
	}


}
