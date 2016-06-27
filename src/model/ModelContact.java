package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Category;
import bean.Contact;
import bean.New;
import library.LibraryString;

@SuppressWarnings("all")
public class ModelContact {
	
	private PreparedStatement pst;
	private Statement st;
	private ResultSet rs;
	private ModelConnectDb mConnect;
	
	private String tbName = "contact";
	private String idName = "id_contact";
	
	public ModelContact(){
		mConnect = new ModelConnectDb();
	}

	public ArrayList<Contact> getList() {
		ArrayList<Contact> alItem = new ArrayList<Contact>();
		Connection conn = mConnect.getConnectMySQL();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(new String("SELECT * FROM "+tbName));
			while(rs.next()){
				alItem.add(new Contact(rs.getInt("id_contact"), rs.getString("fullname"), rs.getString("email"), rs.getString("address"), rs.getInt("phone"), rs.getString("content")));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return alItem;
	}

	public int delItem(int id) {
		int result = 0;
		Connection conn = mConnect.getConnectMySQL();
		try {
			pst = conn.prepareStatement(new String("DELETE FROM "+tbName+" WHERE "+idName+" = ?"));
			pst.setInt(1, id);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result;
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

	public ArrayList<Contact> getListForPagination(int offset, int rowCount) {
		ArrayList<Contact> alItem = new ArrayList<Contact>();
		Connection conn = mConnect.getConnectMySQL();
		String sql = "SELECT * FROM "+tbName+" LIMIT ?, ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, rowCount);			
			rs = pst.executeQuery();
			while(rs.next()){
				alItem.add(new Contact(rs.getInt("id_contact"), rs.getString("fullname"), rs.getString("email"), rs.getString("address"), rs.getInt("phone"), rs.getString("content")));
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

	public int addContact(Contact item) {
		int result = 0;
		Connection conn = mConnect.getConnectMySQL();
		String sql = "INSERT INTO "+tbName+"(fullname,email,address,phone,content) VALUES (?,?,?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, item.getFullname());
			pst.setString(2, item.getEmail());
			pst.setString(3, item.getAddress());
			pst.setInt(4, item.getPhone());
			pst.setString(5, item.getContent());
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
