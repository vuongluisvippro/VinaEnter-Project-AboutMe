package bean;

@SuppressWarnings("all")
public class Contact {
	private int id_contact;
	private String fullname;
	private String email;
	private String address;
	private int phone;
	private String content;
	public Contact() {
		super();
	}
	public Contact(int id_contact, String fullname, String email, String address, int phone, String content) {
		super();
		this.id_contact = id_contact;
		this.fullname = fullname;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.content = content;
	}
	
	public Contact(String fullname, String email, String address, int phone, String content) {
		super();
		this.fullname = fullname;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.content = content;
	}
	public int getId_contact() {
		return id_contact;
	}
	public void setId_contact(int id_contact) {
		this.id_contact = id_contact;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
