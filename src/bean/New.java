package bean;

@SuppressWarnings("all")
public class New {
	private int id_new;
	private String name;
	private String preview_text;
	private String detail_text;
	private int id_cat;
	private String picture;
	private int read;
	private int is_active;
	private String nameCat;
	public New() {
		super();
	}
	public New(int id_new, String name, String preview_text, String detail_text, int id_cat, String picture,
			int read, int is_active, String nameCat) {
		super();
		this.id_new = id_new;
		this.name = name;
		this.preview_text = preview_text;
		this.detail_text = detail_text;
		this.id_cat = id_cat;
		this.picture = picture;
		this.read = read;
		this.is_active = is_active;
		this.nameCat = nameCat;
	}
	public New(String name, String preview_text, String detail_text, int id_cat, String picture, int read,
			int is_active, String nameCat) {
		super();
		this.name = name;
		this.preview_text = preview_text;
		this.detail_text = detail_text;
		this.id_cat = id_cat;
		this.picture = picture;
		this.read = read;
		this.is_active = is_active;
		this.nameCat = nameCat;
	}
	public New(String name, String preview_text, String detail_text, int id_cat, String picture, int read,
			int is_active) {
		super();
		this.name = name;
		this.preview_text = preview_text;
		this.detail_text = detail_text;
		this.id_cat = id_cat;
		this.picture = picture;
		this.read = read;
		this.is_active = is_active;
	}
	public New(int id_new, String name, String preview_text, String detail_text, int id_cat, String picture) {
		super();
		this.id_new = id_new;
		this.name = name;
		this.preview_text = preview_text;
		this.detail_text = detail_text;
		this.id_cat = id_cat;
		this.picture = picture;
	}
	public New(int id_new, String name, String preview_text, String detail_text, int id_cat, String picture, int read,
			int is_active) {
		super();
		this.id_new = id_new;
		this.name = name;
		this.preview_text = preview_text;
		this.detail_text = detail_text;
		this.id_cat = id_cat;
		this.picture = picture;
		this.read = read;
		this.is_active = is_active;
	}
	public New(int id_new, int is_active) {
		super();
		this.id_new = id_new;
		this.is_active = is_active;
	}
	public int getId_new() {
		return id_new;
	}
	public void setId_new(int id_new) {
		this.id_new = id_new;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPreview_text() {
		return preview_text;
	}
	public void setPreview_text(String preview_text) {
		this.preview_text = preview_text;
	}
	public String getDetail_text() {
		return detail_text;
	}
	public void setDetail_text(String detail_text) {
		this.detail_text = detail_text;
	}
	public int getId_cat() {
		return id_cat;
	}
	public void setId_cat(int id_cat) {
		this.id_cat = id_cat;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getRead() {
		return read;
	}
	public void setRead(int read) {
		this.read = read;
	}
	public int getIs_active() {
		return is_active;
	}
	public void setIs_active(int is_active) {
		this.is_active = is_active;
	}
	public String getNameCat() {
		return nameCat;
	}
	public void setNameCat(String nameCat) {
		this.nameCat = nameCat;
	}
}
