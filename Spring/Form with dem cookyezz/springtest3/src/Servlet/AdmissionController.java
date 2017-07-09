package Servlet;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdmissionController {
	
	@RequestMapping("/")
	public ModelAndView startPage() {
		ModelAndView mav = new ModelAndView("AdmissionForm");
		
		return mav;
	}
	
	@RequestMapping(value="/admissionForm.html", method=RequestMethod.GET)
	public ModelAndView getAdmissionForm() {
		ModelAndView mav = new ModelAndView("AdmissionForm");
		
		return mav;
	}
	
	@RequestMapping(value="/submitAdmissionForm.html", method=RequestMethod.POST)
	/*Added CookieValue and Response
	*CookieValue("cookie-name-to-search-for-in-the-list-of-all-cookies")
	*HttpServletResponse to add cookies into the thing
	*/
	public ModelAndView submitAdmissionForm(@RequestParam Map<String, String> pathVars, @CookieValue(value="Gamer", defaultValue="Ass Afro") String user, @CookieValue(value="Code", defaultValue="John Cena") String pass, HttpServletResponse response) {
		String name = pathVars.get("name");
		String hobby = pathVars.get("hobby");
		Cookie toBake;
		
		//You should try logging in a name and a hobby... after that, enter the SAME name but different hobby
		
		if(user.equals(name)) {//If there is cookie that exists
			ModelAndView mav = new ModelAndView("AdmissionSuccess");
			mav.addObject("msg", "You are " + name + " and your current hobby is " + hobby + " your previous hobby is " + pass);
			
			toBake = new Cookie("Code", hobby);//create cookie with key/name of "Code"; parang hashmap kc kaya may key/name
			toBake.setMaxAge(30); //in secs; after 30 secs cookie DIES!!!
			
			response.addCookie(toBake);//to seal the deal... para ma dag dag sa session? browser? ang cookie
			
			return mav; 
		}
		
		if (name.equals("Voldy")) {//If username is not found in our system
			ModelAndView mav = new ModelAndView("AdmissionForm");
			mav.addObject("loginError", "Name or hobby is wrong!");
			return mav; 			
		}else {//If user exists but has not logged in before
			ModelAndView mav = new ModelAndView("AdmissionSuccess");
			mav.addObject("msg", "You are " + name + " and your hobby is " + hobby);
			
			toBake = new Cookie("Gamer", name);//same shit as before
			toBake.setMaxAge(30); //in secs
			
			response.addCookie(toBake);
			
			System.out.println("Gamer: " + toBake.getValue());
			
			toBake = new Cookie("Code", hobby);
			toBake.setMaxAge(30); //in secs
			
			response.addCookie(toBake);
			
			System.out.println("Code: " + toBake.getValue());
			
			return mav; 
		}		
		
	}	
}
