package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.ModelConnectDb;

@SuppressWarnings("all")
public class ValidateUser {
	
	private String tbName = "users";
	
	public boolean validateName(String fullname) {
		boolean result = false;
		if(fullname.matches("(.*)[!,@,#,$,%,^,&,*,(,),-,_,+,=,?,:,;,',\"](.*)")){
			result = true;
		}
		return result;
	}
	public boolean checkName(String username){
		boolean checkx = false;
		int check = 0;
		Connection conn = new ModelConnectDb().getConnectMySQL();
		try {
			PreparedStatement pst = conn.prepareStatement(new String("SELECT COUNT(*) AS CheckNameUser FROM "+tbName+" WHERE username = ?"));
			pst.setString(1, username);
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				check = rs.getInt("CheckNameUser");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		if(check > 0){
			checkx = true;
		}
		return checkx;
	}
	public boolean checkNameVer(String username,int id_user){
		boolean checkx = false;
		int check = 0;
		Connection conn = new ModelConnectDb().getConnectMySQL();
		try {
			PreparedStatement pst = conn.prepareStatement(new String("SELECT COUNT(*) AS CheckNameUser FROM "+tbName+" WHERE username = ? AND id_user NOT IN(?)"));
			pst.setString(1, username);
			pst.setInt(2,id_user);
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				check = rs.getInt("CheckNameCat");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		if(check > 0){
			checkx = true;
		}
		return checkx;
	}
}
