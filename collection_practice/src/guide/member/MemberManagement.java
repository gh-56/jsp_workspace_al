package guide.member;
 
/**
 * AppBase의 기능을 구현한 자식 class
 * AppBase의 기능을 상속받아 제시된 기능을 완성하시오.
 */
public class MemberManagement extends AppBase{

	@Override
	protected void terminate() {
		// TODO application 종료
		isRun = false;
	}

	@Override
	protected void join() {
		while(true) {
			String mId = getStringData("아이디를 입력해주세요");
			String pw = getStringData("비밀번호를 입력해주세요");
			String rePw = getStringData("비밀번호를 입력해주세요");
			
			// 사용자 아이디 중복 체크
			if(!memberIdCheck(mId)) {
				System.out.println("사용할 수 없는 아이디 이거나 비밀번호가 일치하지 않습니다.");
				continue;
			}
			if(!pw.equals(rePw)) {
				System.out.println("사용할 수 없는 아이디 이거나 비밀번호가 일치하지 않습니다.");
				continue;
			}
			String name = getStringData("이름을 입력해주세요 ");
			Member m = new Member(number++, name, mId, pw, System.currentTimeMillis());
			memberList.add(m);
//			number++;
			System.err.println("회원가입 완료");
			break;
		}
	}

	@Override
	protected void login() {
		String mId = getStringData("아이디를 입력해주세요 > ");
		String mPw = getStringData("비밀번호를 입력해주세요 > ");
		
		Member member = findMember(new Member(mId,mPw));
		if(member == null) {
			System.out.println("일치하는 정보가 없습니다.(로그인 실패)");
			return;
		}
		loginMember = member;
		
		System.err.println("정상적으로 로그인 되었습니다.");
		if(loginMember.equals(master)) {
			System.out.println("관리자 계정입니다.");
		}
	}

	@Override
	protected void select() {
		// TODO 회원 목록 검색 출력
		if(loginMember == null) {
			System.out.println("로그인 이후 사용할 수 있는 메뉴입니다.");
			return;
		}
		if(loginMember.equals(master)) {
			for(Member m : memberList) {
				System.out.println(m);
			}
		} else {
			System.err.println(loginMember);
		}
		
	}

	@Override
	protected void update() {
		// TODO 회원 정보 수정
		if(loginMember == null) {
			System.out.println("로그인 후 사용가능한 메뉴입니다.");
		}
		if(loginMember.equals(master)) {
			System.err.println("관리자 계정입니다.");
			System.out.println("== 관리자 회원 정보 수정 ==");
			select();
			int mNum = getNumberData("수정할 회원의 번호를 입력해 주세요 > ");
			for(Member m : memberList) {
				if(m.getmNum() == mNum) {
					String name = getStringData("수정할 회원의 이름을 입력해주세요 > ");
					m.setmName(name);
					System.err.println("수정완료");
					return;
				}
			}
			System.out.println("수정할 회원 정보를 찾지 못했습니다.");
		} else {
			System.out.println("== 내 정보 수정");
			String pw = getStringData("비밀번호를 한번 더 입력해 주세요 > ");
			if(!loginMember.getmPw().equals(pw)) {
				System.out.println("비밀번호가 일치하지 않습니다.");
				return;
			}
			String name = getStringData("수정할 이름을 입력해주세요 > ");
			loginMember.setmName(name);
			System.err.println("수정이 완료되었습니다.");
		}
	}

	@Override
	protected void delete() {
		// TODO 회원정보 삭제
		if(master.equals(loginMember)) {
			System.err.println("회원 정보를 삭제할 수 없습니다.");
			return;
		}
		String answer = getStringData("정말로 삭제 하시겠습니까? y/n");
		switch(answer) {
			case "y": case "Y": case "ㅛ":
				deleteMember();
				break;
			default:
				System.out.println("회원정보 삭제(탈퇴)가 취소되었습니다.");	
		}
		
	}

	@Override
	protected void deleteMember() {
		// TODO 회원 탈퇴
		memberList.remove(loginMember);
		loginMember = null;
		System.err.println("회원 탈퇴 완료");
	}
	
}
