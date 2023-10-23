package guide.practice01;

public class A {
	public static void main(String[] args) {
		SetterTest s = new SetterTest();
		
		System.out.println("num : " + s.getNum());  // 1
		
		
		s.setNum(2); // "num : 10000보다 작음"
		System.out.println("num : " + s.getNum());  // 1, num 변화 x
		
		
		s.setNum(100002); // 100002
		System.out.println("num : " + s.getNum());  // 100002
		
		
		
		SetterTest s2 = new SetterTest(2);
		System.out.println("num : " + s2.getNum());
	}
	
}

class SetterTest {
	private int num = 1;
	
	public SetterTest() {}
	
	public SetterTest(int num) {
		this.num = num;
	}
	
	// getter
	int getNum() {
		return num;
	}
	
	// setter
	void setNum(int num) {
		if(num > 10000) {
			this.num = num;
			System.out.println("num : " + num);
		} else {
			System.out.println("num : 10000보다 작음");
		}
	}
}
