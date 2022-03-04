import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Test.do")
public class Test extends HttpServlet {

    public Test() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        var testContent = "<!DOCTYPE html><h1>Chegamos no Servlet 1</h1><a style='background-color: green; width: 300px;' href='/login/loginSuccess' />";
        response.getWriter().print(testContent);
		response.setStatus(200);

	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        var testContent = "<!DOCTYPE html><h1>Chegamos no Servlet 1</h1><a style='background-color: green; width: 300px;' href='/login/loginSuccess' />";
        response.getWriter().print(testContent);
		response.setStatus(200);

        response.sendRedirect("loginSuccess.html");
	}
}
