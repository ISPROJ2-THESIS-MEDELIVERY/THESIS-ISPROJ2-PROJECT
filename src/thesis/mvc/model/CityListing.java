package thesis.mvc.model;

import java.math.BigDecimal;

public class CityListing {
	
	private int CityID;
	private String CityName;
	private String CityProvince;
	private BigDecimal CityCost;
	public int getCityID() {
		return CityID;
	}
	public void setCityID(int cityID) {
		CityID = cityID;
	}
	public String getCityName() {
		return CityName;
	}
	public void setCityName(String cityName) {
		CityName = cityName;
	}
	public String getCityProvince() {
		return CityProvince;
	}
	public void setCityProvince(String cityProvince) {
		CityProvince = cityProvince;
	}
	public BigDecimal getCityCost() {
		return CityCost;
	}
	public void setCityCost(BigDecimal cityCost) {
		CityCost = cityCost;
	}
	
	

}
