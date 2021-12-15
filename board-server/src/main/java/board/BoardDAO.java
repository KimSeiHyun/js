package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

public class BoardDAO {

	
	private BoardDAO() {};
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getBoardDAOGetInstance() {
		return instance;
	}
	
	
	private ArrayList<BoardDTO> boards = null;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public Connection getConnection () {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url ="jdbc:mysql://localhost:3306/board?serverTimezone=UTC";
			String id = "root";
			String pw = "tpgus1659617!";
			
			conn = DriverManager.getConnection(url, id, pw);
			
			if(conn != null) {
				System.out.println("게시판 연동 선공 !! ");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시판 연동 실패 ....  ");
		}
		return conn;
	}
	
	public ArrayList<BoardDTO> getBoards() {
		
		try {
			conn = getConnection();
			
			String str = "select * from boards";
			this.pstmt = conn.prepareStatement(str);
			this.rs = pstmt.executeQuery();
			
			this.boards = new ArrayList<BoardDTO>();
			while(rs.next()) {
				int no = Integer.parseInt(rs.getString(1));
				String id = rs.getString(2);
				String pw = rs.getString(3);
				String title = rs.getString(4);
				String content = rs.getString(5);
				content = content.replace("\r\n","<br>");
				int likes =Integer.parseInt(rs.getString(6));
				Timestamp regdate = rs.getTimestamp(7);
				this.boards.add(new BoardDTO(no , id , pw , title , content , likes , regdate));
			}
			System.out.println("sql에서 보드값 가져오기 성공 !!!");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("sql에서 보드값 가져오기 실패 .... ");
		}
		
		
		return this.boards;
	}
	
	public int addBoard(BoardDTO board) {
		
		if(checkBoard(board.getTitle())) {
			
			try {
				
				BoardDTO newBoard = new BoardDTO(board.getNo() , board.getId() , board.getPw() , board.getTitle() , board.getContent() , 0 , new Timestamp(Calendar.getInstance().getTimeInMillis()));
				
				conn = getConnection();
				String str = "insert into boards values(?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(str);
				pstmt.setInt(1, newBoard.getNo());
				pstmt.setString(2, newBoard.getId());
				pstmt.setString(3, newBoard.getPw());
				pstmt.setString(4, newBoard.getTitle());
				String a = board.getContent().replace("\r\n","<br>");
				pstmt.setString(5, a);
				pstmt.setInt(6, newBoard.getLikes());
				pstmt.setTimestamp(7, newBoard.getRegDate());
				pstmt.executeUpdate();
				this.boards.add(newBoard);
				System.out.println("업데이트 성공 !! ");
				return this.boards.size();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("업데이트 실패 ,,,, ");
			}
		}
		return -1;
		
	}

	private boolean checkBoard(String title) {
		this.boards = getBoards();
		for(BoardDTO board : boards) {
			if(title.equals(board.getTitle()))
				return false;
		}
		
		return true;
	}
	
	public void deletBoard(String id , String title) {
		this.boards = getBoards();
		int idx = -1;
		String no = "";
		for(int i=0; i<this.boards.size(); i++) {
			BoardDTO temp = this.boards.get(i);
			if(id.equals(temp.getId()) && title.equals(temp.getTitle())) {
				idx = i;
				no = temp.getNo()+"";
			}
		}
		
		try {
			conn = getConnection();
			
			String sql = "DELETE FROM boards WHERE no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			pstmt.executeUpdate();
		
			this.boards.remove(idx);
			System.out.println("``삭제성공``");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("삭제실패..");
		}
		
	}
	public void deletBoard(String id) {
		this.boards = getBoards();
		int idx = -1;
		String no = "";
		for(int i=0; i<this.boards.size(); i++) {
			BoardDTO temp = this.boards.get(i);
			if(id.equals(temp.getId())) {
				idx = i;
				no = temp.getNo()+"";
			}
		}
		
		try {
			conn = getConnection();
			
			String sql = "DELETE FROM boards WHERE no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			pstmt.executeUpdate();
			
			this.boards.remove(idx);
			System.out.println("``삭제성공``");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("삭제실패..");
		}
		
	}
//	

	public void printBoard() {
		System.out.println("----게시물----");
		for(int i=0; i<this.boards.size(); i++) {
			BoardDTO x = this.boards.get(i);
			System.out.printf("no : %d \nid : %s\npw : %s\ntitle : %s\ncontnt : %s\nlike : %d\nregDate : %s\n",x.getNo(),x.getId(),x.getPw(),x.getTitle(),x.getContent(),x.getLikes(),x.getRegDate());
		}
	}
	
	public boolean setBoard(String id , String title , String content) {
		this.boards = getBoards();
		int check = 0;
		for(int i=0; i<this.boards.size(); i++) {
			BoardDTO temp = this.boards.get(i);
			if(id.equals(temp.getId()) && title.equals(temp.getTitle())) {
				check ++;
			}
		}
		if(check == 1 || check == 0) {
			String no = "";
			for(int i=0; i<this.boards.size(); i++) {
				BoardDTO temp = this.boards.get(i);
				if(id.equals(temp.getId())) {
					no = temp.getNo()+"";
					this.boards.get(i).setTitle(title);
					this.boards.get(i).setContent(content);
				}
			}
			try {
				conn = getConnection();
				
				String sql = String.format("update boards set title = '%s' where no = ?", title );
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, no);
				pstmt.executeUpdate();
				pstmt.close();
				System.out.println("수정성공!");
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("수정실패;");
			}
		}
		
		return false;
	}
	
	public void setContent(String id , String title , String content) {
		try {
			String no = "";
			for(int i=0; i<this.boards.size(); i++) {
				BoardDTO temp = this.boards.get(i);
				if(id.equals(temp.getId())) {
					no = temp.getNo()+"";

				}
			}
			conn = getConnection();
			String content2 = content.replace("<br>","\n");
			String sql = String.format("update boards set content = '%s' where no = ?", content2);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1 , no);
			pstmt.executeUpdate();
			System.out.println("내용물성공!");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("내용물수정실패;");
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
