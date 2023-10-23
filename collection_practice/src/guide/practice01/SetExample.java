package guide.practice01;

//import java.util.Comparator;
import java.util.Scanner;
import java.util.TreeSet;

public class SetExample {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		// 코드 작성
//		TreeSet<Integer> set = new TreeSet<>(new Comparator<Integer>() {
//			@Override
//			public int compare(Integer o1, Integer o2) {
//				return o1 - o2; // 오름차순
////				return o2 - o1; // 내림차순
//			}
//		});
		
		TreeSet<Integer> set = new TreeSet<>((o1, o2) ->
			o1- o2 // {} 있을 때 반환 타입이 void가 아니면 return 생략 x, {} 없다면 생략 가능
		);
		
		System.out.println("정수(-1이 될때 까지 입력) >> ");
		while(true) {
			int n = sc.nextInt();
			if(n == -1) break;
			set.add(n);
		}
		if(set.isEmpty()) {
			System.out.println("저장된 값이 없습니다.");
			System.out.println("시스템 종료");
			sc.close();
			return;
		}
		int max = set.last();
		int min = set.first();
		System.out.println(set);
		System.out.println("최소값 : " + min);
		System.out.println("최대값 : " + max);
	}

}
