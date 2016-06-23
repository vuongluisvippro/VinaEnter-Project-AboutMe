package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Category;
import bean.Contact;

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
}
