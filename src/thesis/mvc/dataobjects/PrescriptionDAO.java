package thesis.mvc.dataobjects;

import java.util.List;

import thesis.mvc.model.Prescription;

public interface PrescriptionDAO {
	public void addPrescription ( Prescription prescription );
	public void deletePrescription ( int prescriptionId );
	public void updatePrescription ( Prescription prescription );
	public List<Prescription> getAllPrescription();
	public Prescription getPrescriptionByID( int prescriptionId );
}
