package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.ModelConnectDb;

@SuppressWarnings("all")
public class ValidateAdvs {
	private String tbName = "advs";
	public boolean checkName(String name){
		boolean checkx = false;
		int check = 0;
		Connection conn = new ModelConnectDb().getConnectMySQL();
		try {
			PreparedStatement pst = conn.prepareStatement(new String("SELECT COUNT(*) AS CheckNameAdvs FROM "+tbName+" WHERE name = ?"));
			pst.setString(1, name);
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				check = rs.getInt("CheckNameAdvs");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		if(check > 0){
			checkx = true;
		}
		return checkx;
	}
	public boolean checkNameVer(String name,int id){
		boolean checkx = false;
		int check = 0;
		Connection conn = new ModelConnectDb().getConnectMySQL();
		try {
			PreparedStatement pst = conn.prepareStatement(new String("SELECT COUNT(*) AS CheckNameAdvs FROM "+tbName+" WHERE name = ? AND id_advs NOT IN(?)"));
			pst.setString(1, name);
			pst.setInt(2,id);
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				check = rs.getInt("CheckNameAdvs");
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
