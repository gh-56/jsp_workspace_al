package guide.practice02;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class CapitalQuiz {
	
	/**
	 * 국가별 수도 정보를 저장할 List
	 */
	private List<Nation> store = new ArrayList<>();
	
	private Scanner sc = new Scanner(System.in);
	
	public CapitalQuiz() {
		// ArrayList에 8개의 국가에 대한 기본적인 정보 입력 
		store.add(new Nation("한국", "서울"));
//		store.add(new Nation("프랑스", "파리"));
//		store.add(new Nation("그리스", "아테네"));
//		store.add(new Nation("중국", "베이징"));
//		store.add(new Nation("스페인", "마드리드"));
//		store.add(new Nation("영국", "런던"));
//		store.add(new Nation("독일", "베를린"));
//		store.add(new Nation("러시아", "모스크바"));
	}
	
	// 수도 맞추기 게임 시작
	public void run() {
		System.out.println("**** 수도 맞추기 게임을 시작합니다. ****");
		while(true) {
			System.out.println("입력 : 1, 퀴즈 : 2, 종료 : 3");
			int menu = sc.nextInt();
			switch(menu) {
				case 1 :
					// 국가별 수도 정보 추가
					input();
					break;
				case 2 : 
					// 국가 이름으로 수도 정보 맞추기
					quiz();
					break;
				case 3 : 
					System.out.println("게임을 종료합니다.");
					return;
				default :
					System.out.println("잘못된 입력입니다.");
			}
		}
	}
	
	// 국가 등록 - 국가 이름, 수도 이름 Nation 정보 등록 
	private void input() {
		int n = store.size();
		System.out.println("헌재 "+n+"개의 나라와 수도가 입력되어 있습니다.");
		while(true) {
			System.out.printf("국가 입력(현재 %d번째 국가 등록 / q는 종료)", store.size() + 1);
			// 사용자에게 국가 이름 입력
			String country = sc.next();
			if(country.equals("q")) {
				System.out.println("입력을 종료합니다.");
				break;
			}
			// 사용자에게 수도 이름 입력
			System.out.println("수도 입력 >> ");
			String capital = sc.next();
			Nation nation = new Nation(country, capital);
			
			if(store.contains(nation)) { //equasl 재정의 안해주면 주소비교
				System.out.println(country+"(은)는 이미 존재합니다.");
				continue;
			}
			
//			for(int i = 0; i<store.size(); i++) {
//				Nation na = store.get(i);
//				if(na.getCountry().equals(country)) {
//					System.out.println(country+"(은)는 이미 존재합니다.");
//					continue a;
//				}
//			}
			store.add(nation);
		}

	}
	
	// 국가 별 수도 이름 맞추기 게임 
	private void quiz() {
		if(store.isEmpty()) {
			System.out.println("모두 확인했습니다.");
			System.out.println("나라 정보를 추가하거나 종료하세요.");
			return;
		}
		int index = (int)(Math.random() * store.size());
		Nation nation = store.get(index);
		String question = nation.getCountry();
		String answer = nation.getCapital();
		System.out.println(question + "의 수도는? ");
		String capitalFromUser = sc.next();
		if(answer.equals(capitalFromUser)) {
			// 일치
			System.err.println("정답!"); // out과 똑같지만 색이 빨간색
			store.remove(index);
		} else {
			// 일치하지 않음
			System.out.printf("아닙니다! %s의 수도는 %s입니다. %n",question, answer);
		}
	}

	public static void main(String[] args) {
		CapitalQuiz quize = new CapitalQuiz();
		quize.run();
	}

}
