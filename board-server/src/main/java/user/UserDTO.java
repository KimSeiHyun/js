package user;
import java.sql.Timestamp;

public class UserDTO {
	private String id , pw;
	private Timestamp regDate;
	
	//생성자
	public UserDTO(String id , String pw) {
		this.id = id;
		this.pw = pw;
		this.regDate = regDate;
	}
	public UserDTO(String id , String pw , Timestamp regDate) {
		this.id = id;
		this.pw = pw;
		this.regDate = regDate;
	}
	
	// 겟 세터
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	
	//
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return String.format("%s/%s/%s", id , pw , regDate);
	}
}
