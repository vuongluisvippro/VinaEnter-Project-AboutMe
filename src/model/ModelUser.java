package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Category;
import bean.User;

@SuppressWarnings("all")
public class ModelUser {

	private PreparedStatement pst;
	private Statement st;
	private ResultSet rs;
	private ModelConnectDb mConnect;
	
	private String tbName = "users";
	private String idName = "id_user";
	
	public ModelUser(){
		mConnect = new ModelConnectDb();
	}
	public ArrayList<User> getList() {
		ArrayList<User> alItem = new ArrayList<User>();
		Connection conn = mConnect.getConnectMySQL();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(new String("SELECT * FROM "+tbName));
			while(rs.next()){
				alItem.add(new User(rs.getInt("id_user"), rs.getString("username"), rs.getString("password"), rs.getString("fullname")));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return alItem;
	}
}
