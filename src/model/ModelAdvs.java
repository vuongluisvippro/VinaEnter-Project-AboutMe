package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Advs;
import bean.Category;
import bean.New;
import bean.User;

@SuppressWarnings("all")
public class ModelAdvs {

	private PreparedStatement pst;
	private Statement st;
	private ResultSet rs;
	private ModelConnectDb mConnect;
	
	private String tbName = "advs";
	private String idName = "id_advs";
	
	public ModelAdvs(){
		mConnect = new ModelConnectDb();
	}

	public ArrayList<Advs> getList() {
		ArrayList<Advs> alItem = new ArrayList<Advs>();
		Connection conn = mConnect.getConnectMySQL();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(new String("SELECT * FROM "+tbName));
			while(rs.next()){
				alItem.add(new Advs(rs.getInt("id_advs"), rs.getString("name"), rs.getString("banner"), rs.getString("link")));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return alItem;
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

	public int addItem(Advs item) {
		int result = 0;
		Connection conn = mConnect.getConnectMySQL();
		String sql = "INSERT INTO "+tbName+"(name,banner,link) VALUES (?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, item.getName());
			pst.setString(2, item.getBanner());
			pst.setString(3, item.getLink());
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

	public Advs getItem(int id) {
		Advs item = null;
		Connection conn = mConnect.getConnectMySQL();
		String sql = "SELECT * FROM "+tbName+" WHERE "+idName+" = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()){
				item = new Advs(rs.getInt("id_advs"), rs.getString("name"), rs.getString("banner"), rs.getString("link"));
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

	public int editItem(Advs item) {
		int result = 0;	
		Connection conn = mConnect.getConnectMySQL();
		if(item.getBanner().isEmpty()){
			String sql = "UPDATE "+tbName+" SET name = ?,link = ? WHERE "+idName+" = ? LIMIT 1";
			try {
				pst = conn.prepareStatement(sql);
				pst.setString(1, item.getName());
				pst.setString(2, item.getLink());
				pst.setInt(3, item.getId_advs());
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
			String sql = "UPDATE "+tbName+" SET name = ?,banner = ?,link = ? WHERE "+idName+" = ? LIMIT 1";
			try {
				pst = conn.prepareStatement(sql);
				pst.setString(1, item.getName());
				pst.setString(2, item.getBanner());
				pst.setString(3, item.getLink());
				pst.setInt(4, item.getId_advs());
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

	public ArrayList<Advs> getListForPagination(int offset, int rowCount) {
		ArrayList<Advs> alItem = new ArrayList<Advs>();
		Connection conn = mConnect.getConnectMySQL();
		String sql = "SELECT * FROM "+tbName+" LIMIT ?, ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, rowCount);			
			rs = pst.executeQuery();
			while(rs.next()){
				alItem.add(new Advs(rs.getInt("id_advs"), rs.getString("name"), rs.getString("banner"), rs.getString("link")));
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
