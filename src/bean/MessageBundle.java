package bean;

@SuppressWarnings("all")
public class MessageBundle {
	/**
	 * @author vuongluis
	 * @comment: Validate + Variable or Field
	 */
	private String name;
	private String email;
	private String phone;
	private int status;
	private String exist;
	
	public MessageBundle() {
		super();
	}
	public MessageBundle(String name, String email, String phone, int status, String exist) {
		super();
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.status = status;
		this.exist = exist;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getExist() {
		return exist;
	}
	public void setExist(String exist) {
		this.exist = exist;
	}
}
