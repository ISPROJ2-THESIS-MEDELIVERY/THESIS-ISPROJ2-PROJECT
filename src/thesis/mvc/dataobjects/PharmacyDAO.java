package thesis.mvc.dataobjects;

import java.util.List;

import thesis.mvc.model.Pharmacy;

public interface PharmacyDAO {
	public int addPharmacy( Pharmacy pharmacy );
	public void deletePharmacy( int pharmacyId );
	public void UpdatePharmacy( Pharmacy pharmacy ); 
	public List<Pharmacy> getAllPharmacys();
	public Pharmacy getPharmacyById( int pharmacyId );

}
