package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import member.vo.BackUpMemberVO;
import member.vo.MemberVO;
import utils.DBUtils;

public class MemberDAOImpl implements MemberDAO {

	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public MemberDAOImpl() {
		// database와 연결 작업
		String url = "jdbc:mysql://localhost:3306/develop_sql";
		String user = "root";
		String password = "12345";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("Driver class를 찾을 수 없음");
		} catch (SQLException e) {
			System.out.println("연결 정보 오류 " + e.getMessage());
		}
		
	}
	
	// MemberVO 정보를 넘겨받아서 회원가입을 진행하고
	// 가입 완료된 회원의 정보를 검색하여 Member type으로 반환
	@Override
	public MemberVO join(MemberVO memberVO) {
		MemberVO m = null;
		// 작성
		String sql = "INSERT INTO tbl_member(mName, mId, mPw, reg) VALUES(?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVO.getmName());
			pstmt.setString(2, memberVO.getmId());
			pstmt.setString(3, memberVO.getmPw());
			pstmt.setLong(4, System.currentTimeMillis());
			
			int result = pstmt.executeUpdate();
			
			if(result == 1) {
				sql = "SELECT mNum, reg FROM tbl_member WHERE mId = '" + memberVO.getmId() + "'";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				m = memberVO;
				if(rs.next()) {
					m.setmNum(rs.getInt(1));
					m.setReg(rs.getLong(2));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.close(rs, stmt, pstmt);
		}
		return m;
	}
	
	// 로그인 - id 와 pw 가 일치하는 사용자일시 정보 전달
	@Override
	public MemberVO selectMember(String mId, String mPw) {
		MemberVO member = null;
		// 작성
		String sql = "SELECT * FROM tbl_member WHERE mId = ? AND mPw = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setString(2, mPw);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				// mId와 mPw가 일치하는 행 정보 존재 - 검증 완료
				// int mNum, String mName, String mId, String mPw, long reg
				member = new MemberVO(
						rs.getInt("mNum"),
						rs.getString("mName"),
						rs.getString("mId"),
						rs.getString("mPw"),
						rs.getLong("reg")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.close(rs, pstmt);
		}
		return member;
	}
	
	// 회원번호로 회원 정보 검색
	@Override
	public MemberVO selectMember(int mNum) {
		MemberVO member = null;
		// 작성
		String sql = "SELECT * FROM tbl_member WHERE mNum = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new MemberVO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getLong(5)
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.close(rs, pstmt);
		}
		return member;
	}

	// 기존에 동일한 아이디가 존재하는지 확인
	// true 사용가능 - 아이디가 존재하지 않으면
	// false 사용불가 - 아이디가 존재하면
	@Override
	public boolean selectMember(String mId) {
		boolean isChecked = true;
		// 작성
		String sql = "SELECT mId FROM tbl_member WHERE mId = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				isChecked = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			isChecked = false;
		} finally {
			DBUtils.close(rs, pstmt);
//			DBUtils.close(pstmt);
		}
		return isChecked;
	}

	// 전체 회원 목록을 ArrayList에 담아서 반환
	@Override
	public ArrayList<MemberVO> select() {
		ArrayList<MemberVO> members = new ArrayList<>();
		// 작성
		String sql = "SELECT * FROM tbl_member ORDER BY mNum DESC";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				MemberVO m = new MemberVO();
				int mNum = rs.getInt(1);
				String mName = rs.getString(2);
				String mId = rs.getString(3);
				String mPw = rs.getString(4);
				long reg = rs.getLong(5);
				
				m.setmNum(mNum);
				m.setmName(mName);
				m.setmId(mId);
				m.setmPw(mPw);
				m.setReg(reg);
				
				members.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.close(rs, stmt);
		}
		
		return members;
	}
	
	// mNum이 일치하는 사용자의 회원이름 정보 수정
	@Override
	public int update(MemberVO member) {
		int result = 0;
		// 작성
		String sql = "UPDATE tbl_member SET mName = ? WHERE mNum = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getmName());
			pstmt.setInt(2, member.getmNum());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.close(pstmt);
		}
		return result;
	}
	
	// 회원 탈퇴 - 회원번호를 입력받아 일치하는 회원 정보 삭제
	@Override
	public int delete(int mNum) {
		int result = 0;
		// 작성
		// 탈퇴 요청한 회원 번호 nNum
		// 탈퇴 요청한 회원 정보를 검색해서 back_up_member 테이블에 등록
		// tbl_member 활성 회원 테이블에서 삭제
		MemberVO deleteMember = selectMember(mNum); // 탈퇴 요청한 회원 정보
		String sql = "INSERT INTO back_up_member VALUES(?,?,?,?,?,now())";
		try {
			conn.setAutoCommit(false); // 직접 트랜잭션 제어하겠다는 표현, 원래는 execute하면 커밋됨
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deleteMember.getmNum());
			pstmt.setString(2, deleteMember.getmName());
			pstmt.setString(3, deleteMember.getmId());
			pstmt.setString(4, deleteMember.getmPw());
			pstmt.setLong(5, deleteMember.getRealReg());
			
			result = pstmt.executeUpdate();
			if(result == 1) {
				sql = "DELETE FROM tbl_member WHERE mNum = " + mNum;
				stmt = conn.createStatement();
				result = stmt.executeUpdate(sql);
				conn.commit();
			} else {
				conn.rollback();
			}
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {}
		} finally {
			DBUtils.close(stmt, pstmt);
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {}
		}
		return result;
	}
	
	// 탈퇴한 회원 정보 검색
	@Override
	public ArrayList<BackUpMemberVO> deleteMember() {
		ArrayList<BackUpMemberVO> deletes = new ArrayList<>();
		// 작성
		String sql = "SELECT * FROM back_up_member ORDER BY deleteDate DESC";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				// int mNum, String mName, String mId, String mPw, long reg, Date deleteDate
				BackUpMemberVO vo = new BackUpMemberVO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getLong(5),
						rs.getTimestamp(6)
						);
				deletes.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.close(rs, stmt);
		}
		
		return deletes;
	}
	
}












