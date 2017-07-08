package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * Servlet implementation class LogInServlet
 */
@WebServlet(name = "LogInServlet", urlPatterns = {"/LogInServlet"})
public class LogInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogInServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("gago");
		Gson gson = new Gson();
		
		JsonParser parser = new JsonParser();
		JsonObject jobject = parser.parse(request.getReader()).getAsJsonObject();
	    //jobject = jobject.getAsJsonObject("userInfo"); //user kasi ung $scope.user natin. Then user may laman na idnumber & password
	    //JsonArray jUserInfo = jobject.getAsJsonArray("userInfo");
	    String ID = jobject.get("idnumber").toString();
	    String password = jobject.get("password").toString();
	    ID = removeDoubleQuotes(ID);
	    password = removeDoubleQuotes(password);
	    //if(jobject == null) System.out.println("null puta");
	    System.out.println("User credentials: ID="+ ID +" password="+ password);
        //response.setContentType("text/plain");
        //response.setCharacterEncoding("UTF-8");
        //response.getWriter().write("hello from java. you entered : " + name);
	}

	public String removeDoubleQuotes(String s){
		String s1 = s.replaceAll("\"\\\\\"", "");
	    String s2 = s1.replaceAll("\\\\\"\"", "");

	    return s2;
	}
}
