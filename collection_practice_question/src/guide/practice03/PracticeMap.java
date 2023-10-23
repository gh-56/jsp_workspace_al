package guide.practice03;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;
import java.lang.reflect.Array;
import java.util.Arrays;

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
			String input = sc.nextLine();
			
			if(input.equals("q")) {
				break;
			}
			
			String[] inputSplit = input.split(",");
			String city = inputSplit[0];
			String longitudeStr = inputSplit[1];
			Double longitude = Double.parseDouble(longitudeStr);
			String latitudeStr = inputSplit[2];
			Double latitude = Double.parseDouble(latitudeStr);
			
			Location loc = new Location(longitude,latitude);
			manage.put(city, loc);
		}
		
		while(true) {
			System.out.print("도시 이름 (q는 종료) >> ");
			String myAnswer = sc.nextLine();
			if(myAnswer.equals("q")) {
				break;
			}
			if(manage.containsKey(myAnswer)) {
				System.out.println(myAnswer + "  " + manage.get(myAnswer));
			} else {
				System.out.println(myAnswer + "는 도시에 없습니다.");
			}
		}
			
		System.out.println("시스템 종료");
		}
	}
