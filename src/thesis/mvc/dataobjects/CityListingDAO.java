package thesis.mvc.dataobjects;

import java.util.List;

import thesis.mvc.model.CityListing;

public interface CityListingDAO {
	public void addCityListing ( CityListing cityListing );
	public void deleteCityListing ( int cityListingId );
	public void updateCityListing ( CityListing cityListing );
	public List<CityListing> getAllCityListing();
	public CityListing getCityListingById ( int cityListingId );
}
