package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Me;

@SuppressWarnings("all")
public class ModelMe {
	PreparedStatement pst;
	ResultSet rs;
	Connection conn;
	ModelConnectDb mConnect;
	String tableName = "aboutme";
	String idName = "id_aboutme";
	
	public ModelMe(){
		mConnect = new ModelConnectDb();
	}
	public Me getItem() {
		Me item = null;
		conn = mConnect.getConnectMySQL();
		String sql = "SELECT * FROM "+tableName+" WHERE 1 LIMIT 1";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			if(rs.next()){
				item = new Me(rs.getInt("id_aboutme"), rs.getString("name"), rs.getString("detail_text"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally{
			try {
				rs.close();
				pst.close();
				conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}			
		}
		return item;
	}
	public int editItem(Me item) {
		int result = 0;	
		conn = mConnect.getConnectMySQL();
		String sql = "UPDATE "+tableName+" SET name = ?,detail_text = ? WHERE 1";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, item.getName());
			pst.setString(2, item.getDetail_text());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally{
			try {
				pst.close();
				conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
}
