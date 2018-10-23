<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="/ProductController">
		<input type="hidden" />
		Product to add: <br>
		<select name="ProductAdd">
			<c:forEach items="${ProductList}" var="productList">
				<option value='<c:out value="${productList.productID}" />'><c:out value="${productList.productName}" /></option>
			</c:forEach>
		</select><br>
		Is it Featured?: <br>
		<input type="checkbox" name="feature"/><br>
		Price: <br>
		<input type="number" name="Price"/><br>
		<input type="submit" name="action" value="addProduct"/> 
	</form>
	<a href="ProductController?Action=AddnewProduct" class="btn btn-info" role="button">Add a new Product</a>
</body>
</html>