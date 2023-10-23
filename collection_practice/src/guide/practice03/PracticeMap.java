package guide.practice03;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;

public class PracticeMap {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		/**
		 * 도시별 경도 위도를 저장할 map 객체
		 */
		Map<String,Location> manage = new HashMap<>();
		
		System.out.println("도시, 경도, 위도를 한번에 입력해주세요.(q는 입력완료)");
		// 코드 작성
		while(true) {
			System.out.print(">> ");
			// 도시이름, 경도, 위도
			String strs = sc.nextLine();
			if(strs.equals("q")) {
				break;
			}
			// [도시이름][경도][위도]
			String[] s = strs.split(",");
			if(s.length!=3) {
				System.out.println("잘못된 입력입니다.");
				continue;
			}
			String city = s[0].trim();
			String lngt = s[1].trim(); // 경도
			String latd = s[2].trim(); // 위도
			
			double longitude = Double.parseDouble(lngt); // 기본타입
			double latitude = Double.valueOf(latd); // wrapper 타입. 자동으로 언박싱해서 들어감.
			
			Location location = new Location(longitude, latitude);
			manage.put(city, location);
		} // end while
		System.out.println("--------------------");
		Set<String> keySet = manage.keySet();
		for(String k : keySet) {
			Location l = manage.get(k);
			System.out.printf("%s %.1f %.1f %n", k, l.getLongitude(), l.getLatitude());
		}
		System.out.println("--------------------");
		// 사용자가 입력한 도시를 찾아 경도, 위도 정보를 출력
		while(true) {
			System.out.println("도시 이름 (q는 종료) >> ");
			String city = sc.next();
			if(city.equals("q")) break;
			if(manage.containsKey(city)) {
				Location l = manage.get(city);
				System.out.println(city + " " + l);
			} else {
				System.out.println(city + "는 없습니다.");
			}
		} // end while
		
		System.out.println("시스템 종료");
	} // end main

}
