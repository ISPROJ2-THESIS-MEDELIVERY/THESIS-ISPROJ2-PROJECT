package thesis.mvc.dataobjects;

import java.util.List;

import thesis.mvc.model.Pharmacist;

public interface PharmacistDAO {
	public int addPharmacist ( Pharmacist pharmacist );
	public void deletePharmacist ( int pharmacistId );
	public void updatePharmacist ( Pharmacist pharmacist );
	public List<Pharmacist> getAllPharmacists();
	public Pharmacist getPharmacistById ( int pharmacistId );
}
