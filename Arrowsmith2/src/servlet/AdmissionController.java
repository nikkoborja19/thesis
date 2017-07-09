package servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class AdmissionController {
	@RequestMapping("/")
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("index");
		System.out.println("entered here");
		return mav;
	}
	
	@RequestMapping(value="/loginPage", method=RequestMethod.GET, headers = "Accept=application/json")
	public ModelAndView getAdmissionForm() {
		ModelAndView mav = new ModelAndView("index");
		
		return mav;
	}
	
	@RequestMapping(value="/admissionSuccess", method=RequestMethod.GET, headers = "Accept=application/json")
	public ModelAndView getAdmissionSuccess() {
		ModelAndView mav = new ModelAndView("AdmissionSuccess");
		
		return mav;
	}
	
	@RequestMapping(value="/submitUserCredentials")
	@ResponseBody
	public ModelAndView submitAdmissionForm(
			//@RequestParam("idnumber") String ID,
			//@RequestParam("password") String password,
			HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		//System.out.println(ID + " " + password);
		Gson gson = new Gson();
		JsonParser parser = new JsonParser();
		JsonObject jobject = parser.parse(request.getReader()).getAsJsonObject();
		String ID = jobject.get("idnumber").toString();
	    String password = jobject.get("password").toString();
	    ID = removeDoubleQuotes(ID);
	    password = removeDoubleQuotes(password);
	    
		//String ID = request.getParameter("idnumber");
		//String password = request.getParameter("password");
		System.out.println(ID + " " + password);
		if(ID.equalsIgnoreCase("admin") && password.equalsIgnoreCase("admin")){
			//ModelAndView mav = new ModelAndView("AdmissionSuccess");
			//mav.addObject("msg", "You are " + ID + " and your pasword is " + password);
			String url = "";
			return mav; 
		}else{
			//ModelAndView mav = new ModelAndView("index");
			//mav.addObject("msg", "Incorrect ID & password!");
			return mav; 
		}
	}
	
	public String removeDoubleQuotes(String s){
		String s1 = s.replaceAll("\"\\\\\"", "");
	    String s2 = s1.replaceAll("\\\\\"\"", "");

	    return s2;
	}
}
