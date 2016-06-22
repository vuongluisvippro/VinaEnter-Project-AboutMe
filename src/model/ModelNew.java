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
		String sql = "SELECT news.id_news,news.name,news.preview_text,news.detail_text,news.id_cat,news.picture,news.read,news.is_active,category.name AS nameCat FROM news INNER JOIN category ON news.id_cat = category.id_cat";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				alNew.add(new New(rs.getInt("id_news"), rs.getString("name"), rs.getString("preview_text"), rs.getString("detail_text"), rs.getInt("id_cat"), rs.getString("picture"), rs.getInt("read"), rs.getInt("is_active"), rs.getString("nameCat")));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return alNew;
	}
}
