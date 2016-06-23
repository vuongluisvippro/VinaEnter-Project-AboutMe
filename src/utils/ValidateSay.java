package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.ModelConnectDb;

@SuppressWarnings("all")
public class ValidateSay {
	private String tbName = "saying";
	public boolean checkName(String content){
		boolean checkx = false;
		int check = 0;
		Connection conn = new ModelConnectDb().getConnectMySQL();
		try {
			PreparedStatement pst = conn.prepareStatement(new String("SELECT COUNT(*) AS CheckNameSay FROM "+tbName+" WHERE content = ?"));
			pst.setString(1, content);
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				check = rs.getInt("CheckNameSay");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		if(check > 0){
			checkx = true;
		}
		return checkx;
	}
	public boolean checkNameVer(String content,int id){
		boolean checkx = false;
		int check = 0;
		Connection conn = new ModelConnectDb().getConnectMySQL();
		try {
			PreparedStatement pst = conn.prepareStatement(new String("SELECT COUNT(*) AS CheckNameSay FROM "+tbName+" WHERE content = ? AND id_saying NOT IN(?)"));
			pst.setString(1, content);
			pst.setInt(2,id);
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				check = rs.getInt("CheckNameSay");
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
