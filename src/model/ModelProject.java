package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.New;
import bean.Project;

@SuppressWarnings("all")
public class ModelProject {

	private PreparedStatement pst;
	private ResultSet rs;
	private Connection conn;
	private ModelConnectDb mConnect;
	private String tableName = "projects";
	private String idName = "id_project";

	public ModelProject(){
		mConnect = new ModelConnectDb();
	}
	public  ArrayList<Project> getList() {
		ArrayList<Project> alItem = new ArrayList<Project>();
		conn = mConnect.getConnectMySQL();
		String sql = "SELECT * FROM "+tableName+" WHERE 1";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()){
				alItem.add(new Project(rs.getInt("id_project"), rs.getString("name"), rs.getString("preview_text"), rs.getString("picture"), rs.getString("link")));
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
	public int delItem(int id) {
		int result = 0;
		conn = mConnect.getConnectMySQL();
		String sql = "DELETE FROM "+tableName+" WHERE "+idName+" = ? LIMIT 1";
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
	public Project getItem(int id) {
		Project item = null;
		conn = mConnect.getConnectMySQL();
		String sql = "SELECT * FROM "+tableName+" WHERE "+idName+" = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()){
				item = new Project(rs.getInt("id_project"), rs.getString("name"), rs.getString("preview_text"), rs.getString("picture"), rs.getString("link"));
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
	public int editItem(Project item) {
		int result = 0;	
		conn = mConnect.getConnectMySQL();
		if(item.getPicture().isEmpty()){
			String sql = "UPDATE "+tableName+" SET name = ?,preview_text = ?,link = ? WHERE "+idName+" = ?";
			try {
				pst = conn.prepareStatement(sql);
				pst.setString(1, item.getName());
				pst.setString(2, item.getPreview_text());
				pst.setString(3, item.getLink());
				pst.setInt(4, item.getId_project());
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
			String sql =  "UPDATE "+tableName+" SET name = ?,preview_text = ?,link = ?,picture = ? WHERE "+idName+" = ?";
			try { 
				pst = conn.prepareStatement(sql);
				pst.setString(1, item.getName());
				pst.setString(2, item.getPreview_text());
				pst.setString(3, item.getLink());
				pst.setString(4, item.getPicture());
				pst.setInt(5, item.getId_project());
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
	public int addItem(Project item) {
		int result = 0;
		conn = mConnect.getConnectMySQL();
		String sql = "INSERT INTO "+tableName+"(name,preview_text,picture,link) VALUES (?,?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, item.getName());
			pst.setString(2, item.getPreview_text());
			pst.setString(3, item.getPicture());
			pst.setString(4, item.getLink());
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
	public ArrayList<Project> getListForPagination(int offset, int rowCount) {
		ArrayList<Project> alItem = new ArrayList<Project>();
		Connection conn = mConnect.getConnectMySQL();
		String sql = "SELECT * FROM "+tableName+" WHERE 1 LIMIT ?, ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, rowCount);			
			rs = pst.executeQuery();
			while(rs.next()){
				alItem.add(new Project(rs.getInt("id_project"), rs.getString("name"), rs.getString("preview_text"), rs.getString("picture"), rs.getString("link")));
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
	public int getSum() {
		int sodong = 0;
		Connection conn = mConnect.getConnectMySQL();
		String sql = "SELECT COUNT("+idName+") AS sodong FROM "+tableName;
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
}
