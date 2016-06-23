package bean;

@SuppressWarnings("all")
public class User {
	private int id_user;
	private String username;
	private String password;
	private String fullname;
	public User() {
		super();
	}
	public User(int id_user, String username, String password, String fullname) {
		super();
		this.id_user = id_user;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
	}
	public User(String username, String password, String fullname) {
		super();
		this.username = username;
		this.password = password;
		this.fullname = fullname;
	}
	
	public User(int id_user, String password, String fullname) {
		super();
		this.id_user = id_user;
		this.password = password;
		this.fullname = fullname;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
}
