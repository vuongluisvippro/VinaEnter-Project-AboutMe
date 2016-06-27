package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Category;
import bean.New;
import bean.Say;

@SuppressWarnings("all")
public class ModelSay {

	private PreparedStatement pst;
	private Statement st;
	private ResultSet rs;
	private ModelConnectDb mConnect;
	
	private String tbName = "saying";
	private String idName = "id_saying";
	
	public ModelSay(){
		mConnect = new ModelConnectDb();
	}

	public ArrayList<Say> getList() {
		ArrayList<Say> alItem = new ArrayList<Say>();
		Connection conn = mConnect.getConnectMySQL();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(new String("SELECT * FROM "+tbName));
			while(rs.next()){
				alItem.add(new Say(rs.getInt("id_saying"), rs.getString("content"), rs.getString("author")));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return alItem;
	}

	public int addItem(Say item) {
		int result = 0;
		Connection conn = mConnect.getConnectMySQL();
		String sql = "INSERT INTO "+tbName+"(content,author) VALUES (?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, item.getContent());
			pst.setString(2, item.getAuthor());
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

	public Say getItem(int id) {
		Say item = null;
		Connection conn = mConnect.getConnectMySQL();
		String sql = "SELECT * FROM "+tbName+" WHERE "+idName+" = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()){
				item = new Say(rs.getInt("id_saying"), rs.getString("content"), rs.getString("author"));
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

	public int editItem(Say item) {
		int result = 0;
		Connection conn = mConnect.getConnectMySQL();
		String sql = "UPDATE "+tbName+" SET content = ?,author = ? WHERE "+idName+" = ? LIMIT 1";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, item.getContent());
			pst.setString(2, item.getAuthor());
			pst.setInt(3, item.getId_saying());
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

	public ArrayList<Say> getListForPagination(int offset, int rowCount) {
		ArrayList<Say> alItem = new ArrayList<Say>();
		Connection conn = mConnect.getConnectMySQL();
		String sql = "SELECT * FROM "+tbName+" LIMIT ?, ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, rowCount);			
			rs = pst.executeQuery();
			while(rs.next()){
				alItem.add(new Say(rs.getInt("id_saying"), rs.getString("content"), rs.getString("author")));
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
