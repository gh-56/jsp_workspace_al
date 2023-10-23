package guide.member;
 
/**
 * AppBase의 기능을 구현한 자식 class
 * AppBase의 기능을 상속받아 제시된 기능을 완성하시오.
 */
public class MemberManagement extends AppBase{

	@Override
	protected void terminate() {
		// TODO application 종료
		
	}

	@Override
	protected void join() {
		// TODO 회원가입
		
	}

	@Override
	protected void login() {
		// TODO id 와 password를 비교하여 동일한 회원 정보가 존재할 시 loginMember에 회원정보 저장
		
	}

	@Override
	protected void select() {
		// TODO 회원 목록 검색 출력
		
	}

	@Override
	protected void update() {
		// TODO 회원 정보 수정
		
	}

	@Override
	protected void delete() {
		// TODO 회원정보 삭제
		
	}

	@Override
	protected void deleteMember() {
		// TODO 회원 탈퇴
		
	}
	
}
