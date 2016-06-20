package bean;

@SuppressWarnings("all")
public class Me {
	private int id_aboutme;
	private String name;
	private String detail_text;
	public Me() {
		super();
	}
	public Me(int id_aboutme, String name, String detail_text) {
		super();
		this.id_aboutme = id_aboutme;
		this.name = name;
		this.detail_text = detail_text;
	}
	public int getId_aboutme() {
		return id_aboutme;
	}
	public void setId_aboutme(int id_aboutme) {
		this.id_aboutme = id_aboutme;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDetail_text() {
		return detail_text;
	}
	public void setDetail_text(String detail_text) {
		this.detail_text = detail_text;
	}
}
