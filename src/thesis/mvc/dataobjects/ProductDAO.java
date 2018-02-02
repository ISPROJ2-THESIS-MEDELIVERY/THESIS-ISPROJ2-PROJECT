package thesis.mvc.dataobjects;

import java.util.List;

import thesis.mvc.model.Product;

public interface ProductDAO {
	public void addProduct ( Product product );
	public void deleteProduct ( int productId );
	public void updateProduct ( Product product );
	public List<Product> getAllProducts();
	public Product getProductById( int productId );
}
