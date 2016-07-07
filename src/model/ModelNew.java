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
public class ModelNew {

	private PreparedStatement pst;
	private Statement st;
	private ResultSet rs;
	private ModelConnectDb mConnect;
	
	private String tbName = "news";
	private String idName = "id_news";
	
	public ModelNew(){
		mConnect = new ModelConnectDb();
	}
	public ArrayList<New> getList() {
		ArrayList<New> alNew = new ArrayList<New>();
		Connection conn = mConnect.getConnectMySQL();
		String sql = "SELECT news.id_news,news.name,news.preview_text,news.detail_text,news.id_cat,news.picture,news.view,news.is_active,category.name AS nameCat FROM news INNER JOIN category ON news.id_cat = category.id_cat";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				alNew.add(new New(rs.getInt("id_news"), rs.getString("name"), rs.getString("preview_text"), rs.getString("detail_text"), rs.getInt("id_cat"), rs.getString("picture"), rs.getInt("view"), rs.getInt("is_active"), rs.getString("nameCat")));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return alNew;
	}
	public ArrayList<New> getListCommon(int itemIndex1) {
		ArrayList<New> alNew = new ArrayList<New>();
		Connection conn = mConnect.getConnectMySQL();
		String sql = "SELECT id_news,name,preview_text,detail_text,id_cat,picture,view,is_active FROM news WHERE id_cat = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, itemIndex1);
			rs = pst.executeQuery();
			while(rs.next()){
				alNew.add(new New(rs.getInt("id_news"), rs.getString("name"), rs.getString("preview_text"), rs.getString("detail_text"), rs.getInt("id_cat"), rs.getString("picture"), rs.getInt("view"), rs.getInt("is_active")));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return alNew;
	}
	public int addItem(New item) {
		int result = 0;
		Connection conn = mConnect.getConnectMySQL();
		String sql = "INSERT INTO "+tbName+"(name,preview_text,detail_text,id_cat,picture,view,is_active) VALUES (?,?,?,?,?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, item.getName());
			pst.setString(2, item.getPreview_text());
			pst.setString(3, item.getDetail_text());
			pst.setInt(4, item.getId_cat());
			pst.setString(5, item.getPicture());
			pst.setInt(6, item.getRead());
			pst.setInt(7, item.getIs_active());
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
	public New getItem(int id) {
		New item = null;
		Connection conn = mConnect.getConnectMySQL();
		String sql = "SELECT news.id_news,news.name,news.preview_text,news.detail_text,news.id_cat,news.picture,news.view,news.is_active,category.name AS namecat FROM news INNER JOIN category ON news.id_cat = category.id_cat WHERE news.id_news = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()){
				item = new New(rs.getInt("id_news"),rs.getString("name"),rs.getString("preview_text"),rs.getString("detail_text"),rs.getInt("id_cat"),rs.getString("picture"),rs.getInt("view"),rs.getInt("is_active"),rs.getString("namecat"));
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
	public int editItem(New item) {
		int result = 0;	
		Connection conn = mConnect.getConnectMySQL();
		if(item.getPicture().isEmpty()){
			String sql = "UPDATE "+tbName+" SET name = ?,preview_text = ?,detail_text = ?,id_cat = ? WHERE "+idName+" = ? LIMIT 1";
			try {
				pst = conn.prepareStatement(sql);
				pst.setString(1, item.getName());
				pst.setString(2, item.getPreview_text());
				pst.setString(3, item.getDetail_text());
				pst.setInt(4, item.getId_cat());
				pst.setInt(5, item.getId_new());
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
			String sql = "UPDATE "+tbName+" SET name = ?,preview_text = ?,detail_text = ?,id_cat = ?,picture = ? WHERE "+idName+" = ? LIMIT 1";
			try {
				pst = conn.prepareStatement(sql);
				pst.setString(1, item.getName());
				pst.setString(2, item.getPreview_text());
				pst.setString(3, item.getDetail_text());
				pst.setInt(4, item.getId_cat());
				pst.setString(5, item.getPicture());
				pst.setInt(6, item.getId_new());
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
	public ArrayList<New> getListForPagination(int offset, int rowCount) {
		ArrayList<New> alItem = new ArrayList<New>();
		Connection conn = mConnect.getConnectMySQL();
		String sql = "SELECT news.id_news,news.name,news.preview_text,news.detail_text,news.id_cat,news.picture,news.view,news.is_active,category.name AS nameCat FROM news INNER JOIN category ON news.id_cat = category.id_cat LIMIT ?, ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, rowCount);			
			rs = pst.executeQuery();
			while(rs.next()){
				alItem.add(new New(rs.getInt("id_news"), rs.getString("name"), rs.getString("preview_text"), rs.getString("detail_text"), rs.getInt("id_cat"), rs.getString("picture"), rs.getInt("view"), rs.getInt("is_active"), rs.getString("nameCat")));
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
	public ArrayList<New> getListConcer(int id_cat,int id_news) {
		ArrayList<New> alItem = new ArrayList<New>();
		Connection conn = mConnect.getConnectMySQL();
		String sql = "SELECT id_news,name,preview_text,detail_text,id_cat,picture,view,is_active FROM news WHERE id_cat = ? AND id_news NOT IN(?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id_cat);
			pst.setInt(2, id_news);
			rs = pst.executeQuery();
			while(rs.next()){
				alItem.add(new New(rs.getInt("id_news"), rs.getString("name"), rs.getString("preview_text"), rs.getString("detail_text"), rs.getInt("id_cat"), rs.getString("picture"), rs.getInt("view"), rs.getInt("is_active")));
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
	public ArrayList<New> getListSearch(String searchName, String searchDM, String searchActive) {
		String temp1 = "",temp2 = "";
		ArrayList<New> alItem = new ArrayList<New>();
		Connection conn = mConnect.getConnectMySQL();
		if(!searchDM.isEmpty()){
			temp1 = "news.id_cat = "+searchDM;
		}else{
			temp1 = "1";
		}
		if(!searchActive.isEmpty()){
			if("active".equals(searchActive)){
				temp2 = "news.is_active = 1";
			}else if("noactive".equals(searchActive)){
				temp2 = "news.is_active = 0";
			}
		}else{
			temp2 = "1";
		}
		if(searchName.isEmpty()){
			String sql = "SELECT news.id_news,news.name,news.preview_text,news.detail_text,news.id_cat,news.picture,news.view,news.is_active,category.name AS nameCat FROM news INNER JOIN category ON news.id_cat = category.id_cat WHERE "+temp1+" AND "+temp2;
			try {
				pst = conn.prepareStatement(sql);
				rs = pst.executeQuery();
				while(rs.next()){
					alItem.add(new New(rs.getInt("id_news"), rs.getString("name"), rs.getString("preview_text"), rs.getString("detail_text"), rs.getInt("id_cat"), rs.getString("picture"), rs.getInt("view"), rs.getInt("is_active"), rs.getString("nameCat")));
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
		}else{
			String sql = "SELECT news.id_news,news.name,news.preview_text,news.detail_text,news.id_cat,news.picture,news.view,news.is_active,category.name AS nameCat FROM news INNER JOIN category ON news.id_cat = category.id_cat WHERE news.name LIKE \"%"+searchName+"%\" AND "+temp1+" AND "+temp2;
			try {
				pst = conn.prepareStatement(sql);
				rs = pst.executeQuery();
				while(rs.next()){
					alItem.add(new New(rs.getInt("id_news"), rs.getString("name"), rs.getString("preview_text"), rs.getString("detail_text"), rs.getInt("id_cat"), rs.getString("picture"), rs.getInt("view"), rs.getInt("is_active"), rs.getString("nameCat")));
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
		}
		return alItem;
	}
	public int editItemActive(New item) {
		int result = 0;	
		Connection conn = mConnect.getConnectMySQL();
		String sql = "UPDATE "+tbName+" SET is_active = ? WHERE "+idName+" = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, item.getIs_active());
			pst.setInt(2, item.getId_new());
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
