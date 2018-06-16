package thesis.mvc.dataobjects;

import java.util.List;

import thesis.mvc.model.Branch;

public interface BranchDAO {
	public int addBranch ( Branch branch );
	public void deleteBranch ( int branchId );
	public void updateBranch ( Branch branch );
	public List<Branch> getAllBranch();
	public Branch getBranchById ( int branchId );
}
