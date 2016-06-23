package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Say;

@SuppressWarnings("all")
public class ModelSay {

	private PreparedStatement pst;
	private Statement st;
	private ResultSet rs;
	private ModelConnectDb mConnect;
	
	private String tbName = "category";
	private String idName = "id_cat";
	
	public ModelSay(){
		mConnect = new ModelConnectDb();
	}

	public ArrayList<Say> getList() {
		// TODO Auto-generated method stub
		return null;
	}
}
