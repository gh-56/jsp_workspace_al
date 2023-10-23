package guide.practice02;

import java.util.ArrayList;
import java.util.Iterator;
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
		store.add(new Nation("프랑스", "파리"));
		store.add(new Nation("그리스", "아테네"));
		store.add(new Nation("중국", "베이징"));
		store.add(new Nation("스페인", "마드리드"));
		store.add(new Nation("영국", "런던"));
		store.add(new Nation("독일", "베를린"));
		store.add(new Nation("러시아", "모스크바"));
}
	
	// 수도 맞추기 게임 시작
	public void run() {
		System.out.println("**** 수도 맞추기 게임을 시작합니다. ****");
		while(true) {
			System.out.println("입력 : 1, 퀴즈 : 2, 종료 : 3");
			int menu = sc.nextInt();
			sc.nextLine();
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
		System.out.println("현재 " + store.size()+ "개의 나라와 수도가 입력되어 있습니다.");
		
		while(true) {
			System.out.println("국가 입력(현재: " + (store.size() + 1) 
										+ "번째 국가 등록 / q는 종료) >>>");
			String inputCountry = sc.nextLine().trim();
			if(inputCountry.equals("q")) {
				break;
			}
			System.out.println("수도 입력>>");
			String inputCapital = sc.nextLine().trim();
			
			boolean isCheck = true;
			
			Iterator<Nation> it = store.iterator();
			while(it.hasNext()) {
				Nation nationData = it.next();
				if(nationData.getCountry().equals(inputCountry)){
					isCheck = false;
					System.out.println(nationData.getCountry() + "는 이미 있습니다!");
					break;
				}
			}
			
			if(isCheck) {
				store.add(new Nation(inputCountry, inputCapital));			
			}
		}
	}
	
	// 국가 별 수도 이름 맞추기 게임 
	private void quiz() {
		int rand = (int)(Math.random() * store.size());
		Nation quiz = store.get(rand);
		System.out.print(quiz.getCountry() + "의 수도는 ? ");
		String usersAnswer = sc.nextLine().trim();
		if (usersAnswer.equals(quiz.getCapital())) {
			System.out.println("정답입니다!");
		} else {
			System.out.println("아닙니다! " + quiz.getCountry() + "의 수도는 " + quiz.getCapital() + "입니다.");
		}
		
	}

	public static void main(String[] args) {
		CapitalQuiz quize = new CapitalQuiz();
		quize.run();
	}

}
