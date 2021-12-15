package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

import board.BoardDAO;
import board.BoardDTO;

public class UserDAO {
	// DAO : Date Access Object
	public static final int REMOVE = 0;
	public static final int UPDATE = 1;
	
	// 1 . singletone Pattern
	// ㄴ 데이터에 대한 중앙 관리자가 한번만 사용되기 위해서 . 싱글톤사용
	private UserDAO() {}
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	
	// 2. DTO에 대한 객체 배열 (Arraylist , Vector)     Data Transfer object
	private ArrayList<UserDTO> users = null;
	
	
	// 3. 상세 데이터베이스에 연동할 객체들 (SQL)
	// ㄴ 1) Connection (DB 연동)
	// ㄴ 2) DB에 쿼리를 날릴 준비
	// ㄴ 3) excute된 쿼리에 대한 결과값을 가져와줌
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			// jdbc:mysql://localhost:3306/데이터베이스스키마명?serverTimezone=UTC
			String url = "jdbc:mysql://localhost:3306/board?serverTimezone=UTC"; // 데이터베이스 주소
			String id = "root";
			String pw = "tpgus1659617!";
			
			conn = DriverManager.getConnection(url, id, pw);
			
			if(conn != null) {
				System.out.println("데이터베이스 연동 성공!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("데이터베이스 연동 실패...");
		}
		return conn;
	}
	
	// 데이터 조회 (객체 배열을 초기화 - 가져온 데이터에 대해서)
	public ArrayList<UserDTO> getUsers() {
		
		
		// 쿼리를 스트링 타입으로 작성
		try {
			conn = getConnection(); // DB연동
			
			String str = "select * from users"; // sql 쿼리를 준비
			pstmt = conn.prepareStatement(str); // 쿼리를 prepareStatement() 메소드를 활용하여 태움(탑승)
			rs = pstmt.executeQuery();			// 쿼리를 날림과 동시에 rs로 결과값을 받음.(객체로 가져옴)
			
			users = new ArrayList<UserDTO>();
			while(rs.next()) { // 행(row) 단위  sql은 인덱스가 1부터시작.
				String id = rs.getString(1); // id 
				String pw = rs.getString(2); // pw
				Timestamp regDate = rs.getTimestamp(3);
				users.add(new UserDTO(id , pw , regDate));
			}
			
			
			System.out.println("가져오기성공!!");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("가져오기실패");
		}
				
				
		return users;
	}
	
	// addUser()
	
	public int addUser(UserDTO user) {
		// ㄴ 중복예외처리 메소드 추가
		if(checkUser(user.getId())) {
			try {
				UserDTO newUser = new UserDTO(user.getId() , user.getPw() , new Timestamp(Calendar.getInstance().getTimeInMillis()));
				conn = getConnection();
				String str = "insert into users values(?,?,?)"; // ? 자리는 맵핑값을 setter로 처리할 포맷이다.
				pstmt = conn.prepareStatement(str);
				pstmt.setString(1, newUser.getId());
				pstmt.setString(2, newUser.getPw());
				pstmt.setTimestamp(3, newUser.getRegDate()); // 여기까지 쿼리 완성
				
				pstmt.executeUpdate();	// 완된 쿼리를 연동된 데이터베이스에 날림. 날리면서 다음연동때 배열에 추가됨. << DB
				users.add(newUser);		// 실행중인 상태에서 dao의 객체배열도 업데이트 << DAO
				
				System.out.println("업데이트 성공");	
				
				return users.size();
//			// 중복문 검사 99~111라인. (내가한 중복문검사)
//			String str2 = "select * from users"; // sql 쿼리를 준비
//			pstmt = conn.prepareStatement(str2);
//			rs = pstmt.executeQuery();
//			boolean check = false;
//			while(rs.next()) { 
//				String id = rs.getString(1); // id 
//				if(id.equals(user.getId())) check = true;
//			}
//
//			if(!check) {
//				pstmt.executeUpdate();	// 완된 쿼리를 연동된 데이터베이스에 날림. 날리면서 다음연동때 배열에 추가됨.
//				System.out.println("업데이트 성공");				
//			}
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("업데이트 실패...");
			}
			
		}
		return -1;
	}
	
	private boolean checkUser(String id) {
		users = getUsers();
		for(UserDTO user : users) {
			if(id.equals(user.getId()))
				return false;
		}
		
		return true;
	}
	
	public boolean checkLogin(String id , String pw) {
		users = getUsers();
		for(UserDTO user : users) {
			if(user.getId().equals(id) && user.getPw().equals(pw)) {
				return true;
			}
		}
		
		return false;
	}
	
	public int deletUser(String id , String pw) {
		users = getUsers();
		int delIdx = -1;
		for(int i=0; i<users.size(); i++) {
			if(id.equals(users.get(i).getId()) && pw.equals(users.get(i).getPw())) {
				delIdx = i;
			}
		}
		
		if(delIdx != -1) {
			try {
				conn = getConnection();
				
				String sql = "DELETE FROM users WHERE id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate(); // DB
				pstmt.close();
				users.remove(delIdx); // DAO
				
				BoardDAO dao  = BoardDAO.getBoardDAOGetInstance();
				ArrayList<BoardDTO> boards = dao.getBoards();
				for(int i=0; i<boards.size(); i++) {
					BoardDTO temp = boards.get(i);
					if(id.equals(temp.getId())) {
						dao.deletBoard(id);
					}
				}
				
				return delIdx;
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return -1;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
