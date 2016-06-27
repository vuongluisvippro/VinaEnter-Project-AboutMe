package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Category;
import bean.New;

@SuppressWarnings("all")
public class ModelCategory {

	private PreparedStatement pst;
	private Statement st;
	private ResultSet rs;
	private ModelConnectDb mConnect;
	
	private String tbName = "category";
	private String idName = "id_cat";
	
	public ModelCategory(){
		mConnect = new ModelConnectDb();
	}
	public ArrayList<Category> getList() {
		ArrayList<Category> alCat = new ArrayList<Category>();
		Connection conn = mConnect.getConnectMySQL();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(new String("SELECT * FROM "+tbName));
			while(rs.next()){
				alCat.add(new Category(rs.getInt("id_cat"), rs.getString("name")));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return alCat;
	}
	public int addItem(Category item) {
		int result = 0;
		Connection conn = mConnect.getConnectMySQL();
		String sql = "INSERT INTO "+tbName+"(name) VALUES (?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, item.getName());
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
	public Category getItem(int id) {
		Category item = null;
		Connection conn = mConnect.getConnectMySQL();
		String sql = "SELECT * FROM "+tbName+" WHERE "+idName+" = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()){
				item = new Category(rs.getInt("id_cat"), rs.getString("name"));
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
	public int editItem(Category item) {
		int result = 0;
		Connection conn = mConnect.getConnectMySQL();
		if(item.getName().isEmpty()){
			result = 1;
		}else{
			String sql = "UPDATE "+tbName+" SET name = ? WHERE id_cat = ? LIMIT 1";
			try {
				pst = conn.prepareStatement(sql);
				pst.setString(1, item.getName());
				pst.setInt(2, item.getId_cat());
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
			System.out.println("Error "+e.getMessage());
		} finally{
			try {
				pst.close();
				conn.close();
			} catch (SQLException e) {
				System.out.println("Error "+e.getMessage());
			}
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
	public ArrayList<Category> getListForPagination(int offset, int rowCount) {
		ArrayList<Category> alItem = new ArrayList<Category>();
		Connection conn = mConnect.getConnectMySQL();
		String sql = "SELECT * FROM "+tbName+" LIMIT ?, ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, rowCount);			
			rs = pst.executeQuery();
			while(rs.next()){
				alItem.add(new Category(rs.getInt("id_cat"), rs.getString("name")));
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
