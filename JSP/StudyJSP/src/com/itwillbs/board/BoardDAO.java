package com.itwillbs.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class BoardDAO {
	//Data Access Object => itwill_board 테이블에 관련된 정보처리객체
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql ="";
	
	// DB 연결메서드
	// 1. 라이브러리 설치
	private Connection getCon() throws Exception{ 
		//프로젝트 정보를 초기화
		Context initCTX = new InitialContext();
		
		// 프로젝트에 있는 디비 연결정보(이름)를 불러오기
		DataSource ds
		= (DataSource)initCTX.lookup("java:comp/env/jdbc/mysqlDB");
		
		// 디비 연결
		con = ds.getConnection();
		System.out.println("DAO : ");
		return con;
	}
	public void closeDB(){
		try {
			if(rs != null )rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public void insertBoard(BoardBean bb) { // 글쓰기 메서드() - insertBoard()
//		final String DRIVER="com.mysql.jdbc.Driver";
//		final String DBURL="jdbc:mysql://localhost:3306/jspdb";
//		final String DBID="root";
//		final String DBPW="1234";
	
		int num = 0; // 계산된 글번호 저장
		try {	
	//		Class.forName(DRIVER);
	//		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
			// 1.2 디비연결(CP)
			Connection con = getCon();
			//게시판번호 계산
			// "select max(num) from itwill_board";
			String sql = "select max(num) from itwill_board";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
	//			num = rs.getInt("max(num)");
				num = rs.getInt(1)+1;
			}
			
			System.out.println("DAO : 글번호 : "+num);
	
			sql = "insert into itwill_board (num, name,pass,subject,content,"
					+"readcount,re_ref,re_lev,re_seq,date,ip,file)"
					+"values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0); // 조회수 0
			pstmt.setInt(7, num); // re_ref 답글 그룹번호 / 일반글번호 == 그룹번호
			pstmt.setInt(8, 0);  // re_lev 답글 들여쓰기 / 일반글 들여쓰기없음(0)
			pstmt.setInt(9, 0); // re_seq 답글 순서 / 일반글 0
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11, bb.getFile());
			
			pstmt.executeUpdate();
			System.out.println("DAO : 게시글 작성 완료 ! ");
			
		} catch (ClassNotFoundException e){
			e.printStackTrace();
			System.out.println("DAO : 드라이버 로드 실패 ! ");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DAO : 디비 연결 실패 ! ");
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			closeDB();		
		}
	}
	// getBoardCount() ---------
	public int getBoardCount() {
		int cnt = 0;
		
		try {
			con = getCon();
			
			sql = "select count(num) from itwill_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				cnt=rs.getInt(1);  // 인덱스(1) 사용하면 더빠름
//				cnt=rs.getInt("count(*)"); //컬럼명 사용
			}
			System.out.println("DAO : 글 개수 확인" + cnt);
			
		} catch (Exception e) {

			e.printStackTrace();
		}finally{
			closeDB();
		}
		return cnt;
	}
	// getBoardCount() ---------
	// getBoardList()
	public ArrayList getBoardList(){
		ArrayList boardList = new ArrayList();
		try {
			con = getCon();
			sql = "select * from itwill_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardBean bb = new BoardBean();
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
				
				boardList.add(bb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return boardList;
	}
	// getBoardList()
	
	// getBoardList(startRow, pageSize)
	public ArrayList getBoardList(int startRow, int pageSize){
		ArrayList boardList = new ArrayList();
		try {
			con = getCon();
			sql = "select * from itwill_board order by re_ref desc, re_seq asc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardBean bb = new BoardBean();
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
								
				boardList.add(bb);
			}
			System.out.println("DAO : 게시판글 저장완료(페이징처리)");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return boardList;
	}
	// getBoardList(startRow, pageSize)
	
	// updateReadcount(num)
		public void updateReadcount(int num){
			try {
				con = getCon();
				sql = "update itwill_board set readcount=readcount+1 where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				System.out.println("DAO : 글 조회수 1증가 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
	}
	// updateReadcount(num)
	// getBoard(num)
		public BoardBean getBoard(int num){
			BoardBean bb = null;
			try {
				con = getCon();
				sql = "select * from itwill_board "
						+ "where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if(rs.next()){
					bb = new BoardBean();
					bb.setContent(rs.getString("content"));
					bb.setDate(rs.getDate("date"));
					bb.setFile(rs.getString("file"));
					bb.setIp(rs.getString("ip"));
					bb.setName(rs.getString("name"));
					bb.setNum(rs.getInt("num"));
					bb.setPass(rs.getString("pass"));
					bb.setRe_lev(rs.getInt("re_lev"));
					bb.setRe_ref(rs.getInt("re_ref"));
					bb.setRe_seq(rs.getInt("re_seq"));
					bb.setReadcount(rs.getInt("readcount"));
					bb.setSubject(rs.getString("subject"));
				}
				System.out.println("DAO : 글 정보 저장완료");
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				closeDB();
			}
			return bb;
		}
	// getBoard(num)
	// updateBoard(bb)
		public int updateBoard(BoardBean bb){
			int check = -1 ;
			try {
				con = getCon();
				sql = "select pass from itwill_board "
						+ "where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bb.getNum());
				rs = pstmt.executeQuery();
				if(rs.next()){
					
					if(bb.getPass().equals(rs.getString("pass"))){
						sql = "update itwill_board set name=?, subject=?, content=? "
								+ "where num=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, bb.getName());
						pstmt.setString(2, bb.getSubject());
						pstmt.setString(3, bb.getContent());
						pstmt.setInt(4, bb.getNum());
						pstmt.executeUpdate();
						check = 1;
						System.out.println("DAO : 회원정보 수정완료");
					}else {
						// 비밀번호오류
						check = 0;
					}
				}else {
					check = -1;
					
				}
				System.out.println("DAO : 글 정보 저장완료");
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				closeDB();
			}
			return check;
		}
	// updateBoard(bb);
	// deleteBoard(bb)
		public int deleteBoard(int num , String pass){
			int check = -1 ;
			try {
				con = getCon();
				sql = "select pass from itwill_board where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if(rs.next()){
					if(pass.equals(rs.getString("pass"))){
						sql = "delete from itwill_board where num=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, num);
						pstmt.executeUpdate();
						check = 1;
						System.out.println("DAO : 글 삭제 완료");
					}else{
						System.out.println("비밀번호 오류");
						check=0;
					}
				}else{
					System.out.println("해당정보없음");
					check=-1;
				}
			} catch (Exception e) {

				e.printStackTrace();
			}finally{
				closeDB();
			}
			return check;
		}
	// deleteBoard(bb)
	// reWriteBoard(bb)
		public void reInsertBoard(BoardBean bb){
			int num = 0;
			try {
				con = getCon();
				sql = "select max(num) from itwill_board";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					num = rs.getInt(1)+1;
				}
				System.out.println("DAO : 답글 번호 계산" + num);
				////답글 순서 재배치
				sql = "update itwill_board set re_seq = (re_seq + 1) "
						+ "where re_ref=? and re_seq>?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bb.getRe_ref());
				pstmt.setInt(2, bb.getRe_seq());
				pstmt.executeUpdate();
				////답글 저장
				sql = "insert into itwill_board values(?,?,?,?,?,"
						+ "?,?,?,?,now(),"
						+ "?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, bb.getName());
				pstmt.setString(3, bb.getPass());
				pstmt.setString(4, bb.getSubject());
				pstmt.setString(5, bb.getContent());
				pstmt.setInt(6, bb.getReadcount());
				pstmt.setInt(7, bb.getRe_ref()); // re_ref : 원글의 그룹번호와 동일
				pstmt.setInt(8, bb.getRe_lev()+1); // re_lev : 원글의 들여쓰기 +1; 
				pstmt.setInt(9, bb.getRe_seq()+1); // re_seq : 순서대로 기존의값 +1;
				pstmt.setString(10, bb.getIp());
				pstmt.setString(11, bb.getFile());
				pstmt.executeUpdate();
				System.out.println("DAO : 답글 작성완료");
			} catch (Exception e) {
				e.printStackTrace();
			} finally{
				closeDB();
			}
		}
	// reWriteBoard(bb)
}
