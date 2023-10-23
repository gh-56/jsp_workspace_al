package guide.practice01;

import java.util.Iterator;
import java.util.Scanner;
import java.util.TreeSet;

public class SetExample {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		// 코드 작성
		TreeSet<Integer> set = new TreeSet<>();
		System.out.println("정수(-1이 입력될 때까지) >>");
		while(true) {
			int inputNum = Integer.parseInt(sc.nextLine());
			if(inputNum == -1) {
				break;
			}
			set.add(inputNum);
		}
//		Iterator<Integer> it = set.iterator();
//		while(it.hasNext()) {
//			it.next();
//		}
		if(set.isEmpty()) {
			System.out.println("수가 하나도 없음");
		} else {
			System.out.println("가장 큰 수는 : " + set.last());	
		}
		System.out.println("시스템 종료");
		sc.close();
	}

}
