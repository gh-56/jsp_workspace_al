package guide.practice02;

public class Nation {
	
	private String country;	// 국가 이름
	private String capital;	// 수도 이름
	
	public Nation(String country, String capital) {
		this.country = country;
		this.capital = capital;
	}
	
	public String getCountry() {
		return country;
	}

	public String getCapital() {
		return capital;
	}

	@Override
	public boolean equals(Object obj) {
		// 국가 이름이 일치하면 동일한 객체로 정의
		if(obj instanceof Nation) { // null이어도 false
			Nation n = (Nation) obj;
			if(this.country.equals(n.getCountry())) {
				return true;
			}
		}
		return false;
	}
	
}
