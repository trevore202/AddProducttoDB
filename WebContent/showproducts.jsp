<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
    <%@ page import="addproducttodb.Product" %>
    <%@ page import="utility.HibernateUtility" %>
    <%@ page import="org.hibernate.Session" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Products</title>
</head>
<body>

<%

response.getWriter().println("All Products<br/><br/>");

Session s = HibernateUtility.getSession();
List<Product> data = s.createQuery("from Product").list();
for (Product p:data) {
	response.getWriter().println("ID: " +p.getId() + "<br/>");
	response.getWriter().println("Name: " +p.getName()+ "<br/>");
	response.getWriter().println("Details: " +p.getDetails()+ "<br/><br/>");

}
%>

<br/><br/>
<a href="addproduct.html">Add new product</a>

</body>
</html>