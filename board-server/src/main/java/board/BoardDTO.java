package board;

import java.sql.Timestamp;

public class BoardDTO {
	private int no , likes;
	private  String id , pw , title;
	private String content;
	Timestamp regDate;
	

	
	public BoardDTO(String id , String pw , String title , String content) {
		this.id = id;
		this.pw = pw;
		this.title = title;
		this.content = content;
	}
	public BoardDTO(int no , String id , String pw , String title , String content , int likes, Timestamp regDate) {
		this.no = no;
		this.id = id;
		this.pw = pw;
		this.title = title;
		this.content = content;
		this.likes = likes;
		this.regDate = regDate;
	}

	public int getNo() {
		return no;
	}


	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public String getId() {
		return id;
	}


	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
}
