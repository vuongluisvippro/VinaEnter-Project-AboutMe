package bean;

@SuppressWarnings("all")
public class Say {
	private int id_saying;
	private String content;
	private String author;
	public Say() {
		super();
	}
	public Say(int id_saying, String content, String author) {
		super();
		this.id_saying = id_saying;
		this.content = content;
		this.author = author;
	}
	
	public Say(String content, String author) {
		super();
		this.content = content;
		this.author = author;
	}
	public int getId_saying() {
		return id_saying;
	}
	public void setId_saying(int id_saying) {
		this.id_saying = id_saying;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
}
