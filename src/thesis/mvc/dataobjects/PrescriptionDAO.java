package thesis.mvc.dataobjects;

import java.util.List;

import thesis.mvc.model.Prescription;

public interface PrescriptionDAO {
	public void addPrescription ( Prescription prescription );
	public void updatePrescription ( int prescriptionId );
	public void deletePrescription ( Prescription prescription );
	public List<Prescription> getAllPrescription();
	public Prescription getPrescriptionByID( int prescriptionId );
}
