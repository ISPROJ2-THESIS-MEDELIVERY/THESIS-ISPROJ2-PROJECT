package thesis.mvc.model;

public class Product {

	private int ProductID;
	private String ProductName;
	private String GenericName;
	private String RegistrationNo;
	private String ProductStrength;
	private String ProductForm;
	private String ProductPackaging;
	private String ProductManufacturer;
	private String ProductOrigin;
	private String ProductDescription;
	private String ProductImage;
	private boolean isRXProduct;
	private int CounterLimit;
	
	public int getProductID() {
		return ProductID;
	}
	public void setProductID(int productID) {
		ProductID = productID;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	public String getGenericName() {
		return GenericName;
	}
	public void setGenericName(String genericName) {
		GenericName = genericName;
	}
	public String getRegistrationNo() {
		return RegistrationNo;
	}
	public void setRegistrationNo(String registrationNo) {
		RegistrationNo = registrationNo;
	}
	public String getProductStrength() {
		return ProductStrength;
	}
	public void setProductStrength(String productStrength) {
		ProductStrength = productStrength;
	}
	public String getProductForm() {
		return ProductForm;
	}
	public void setProductForm(String productForm) {
		ProductForm = productForm;
	}
	public String getProductPackaging() {
		return ProductPackaging;
	}
	public void setProductPackaging(String productPackaging) {
		ProductPackaging = productPackaging;
	}
	public String getProductManufacturer() {
		return ProductManufacturer;
	}
	public void setProductManufacturer(String productManufacturer) {
		ProductManufacturer = productManufacturer;
	}
	public String getProductOrigin() {
		return ProductOrigin;
	}
	public void setProductOrigin(String productOrigin) {
		ProductOrigin = productOrigin;
	}
	public String getProductDescription() {
		return ProductDescription;
	}
	public void setProductDescription(String productDescription) {
		ProductDescription = productDescription;
	}
	public String getProductImage() {
		return ProductImage;
	}
	public void setProductImage(String productImage) {
		ProductImage = productImage;
	}
	public boolean isRXProduct() {
		return isRXProduct;
	}
	public void setRXProduct(boolean isRXProduct) {
		this.isRXProduct = isRXProduct;
	}
	public int getCounterLimit() {
		return CounterLimit;
	}
	public void setCounterLimit(int counterLimit) {
		CounterLimit = counterLimit;
	}

}
