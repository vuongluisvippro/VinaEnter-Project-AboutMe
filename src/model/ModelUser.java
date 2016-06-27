package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Category;
import bean.New;
import bean.User;
import library.LibraryString;

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
	public int addItem(User item) {
		int result = 0;
		Connection conn = mConnect.getConnectMySQL();
		String sql = "INSERT INTO "+tbName+"(username,password,fullname) VALUES (?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, item.getUsername());
			pst.setString(2, new LibraryString().md5(item.getPassword()));
			pst.setString(3, item.getFullname());
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
	public User getItem(int id) {
		User item = null;
		Connection conn = mConnect.getConnectMySQL();
		String sql = "SELECT * FROM "+tbName+" WHERE "+idName+" = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()){
				item = new User(rs.getInt("id_user"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"));
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
	public int editItem(User item) {
		int result = 0;	
		Connection conn = mConnect.getConnectMySQL();	
		if(item.getPassword().isEmpty()){
			String sql = "UPDATE "+tbName+" SET fullname = ? WHERE "+idName+" = ? LIMIT 1";
			try {
				pst = conn.prepareStatement(sql);
				pst.setString(1, item.getFullname());
				pst.setInt(2, item.getId_user());
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
		}else{
			String sql = "UPDATE "+tbName+" SET password = ?,fullname = ? WHERE "+idName+" = ? LIMIT 1";
			try {
				pst = conn.prepareStatement(sql);
				pst.setString(1, new LibraryString().md5(item.getPassword()));
				pst.setString(2, item.getFullname());
				pst.setInt(3, item.getId_user());
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
		}
		return result;
	}
	public int delItem(int id) {
		int result = 0;
		Connection conn = mConnect.getConnectMySQL();
		String sql = "DELETE FROM "+tbName+" WHERE "+idName+" = ? LIMIT 1";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
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
	public User getUser(String username, String password) {
		User user = null;
		Connection conn = mConnect.getConnectMySQL();
		String sql = "SELECT * FROM "+tbName+" WHERE username = ? && password = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1,username);
			pst.setString(2, new LibraryString().md5(password));
			rs = pst.executeQuery();
			if(rs.next()){
				user = new User(rs.getInt("id_user"),rs.getString("username"),rs.getString("password"),rs.getString("fullname"));
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
		return user;
	}
	public int getSum() {
		int sodong = 0;
		Connection conn = mConnect.getConnectMySQL();
		String sql = "SELECT COUNT("+idName+") AS sodong FROM "+tbName;
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			if(rs.next()){
				sodong = rs.getInt("sodong");
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
		return sodong;
	}
	public ArrayList<User> getListForPagination(int offset, int rowCount) {
		ArrayList<User> alItem = new ArrayList<User>();
		Connection conn = mConnect.getConnectMySQL();
		String sql = "SELECT * FROM "+tbName+" LIMIT ?, ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, rowCount);			
			rs = pst.executeQuery();
			while(rs.next()){
				alItem.add(new User(rs.getInt("id_user"), rs.getString("username"), rs.getString("password"), rs.getString("fullname")));
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
		return alItem;
	}
}
