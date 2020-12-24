package addproducttodb;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import utility.HibernateUtility;


@WebServlet("/NewProductServlet")
public class NewProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			Session session = HibernateUtility.getSession();
			Transaction tx = session.beginTransaction();
			
			String productName = request.getParameter("pname");
			String productDetails = request.getParameter("pdescription");
	
			Product product = new Product(productName,productDetails);
			
			session.save(product);
			tx.commit();
			
			response.sendRedirect("productadded.html");
	}

}
