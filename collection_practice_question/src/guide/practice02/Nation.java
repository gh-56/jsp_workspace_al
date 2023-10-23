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
}
