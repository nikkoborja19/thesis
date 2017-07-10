package servlet;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import object.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import dao.*;

@RestController
public class TheController {
	@RequestMapping("/")
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("index");
		
		return mav;
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView getAdmissionForm() {
		ModelAndView mav = new ModelAndView("index");
		
		return mav;
	}
	
	@RequestMapping(value="/login")
	public ModelAndView submitAdmissionForm(@RequestParam Map<String, String> pathVars,
		HttpServletRequest request, HttpServletResponse response) throws SQLException{
		String ID = pathVars.get("idnumber");
		String password = pathVars.get("password");
		
		User u = new UserDAO().getUserWithIDNumber(ID);
		
		if(u.getId().isEmpty()){
			ModelAndView mav = new ModelAndView("index");
			mav.addObject("msg", "USER DOES NOT EXIST");
			return mav; 
		}else{
			if(u.getId().equalsIgnoreCase(ID) && u.getUserPassword().equalsIgnoreCase(password)){
				ModelAndView mav = new ModelAndView("homepageAPO");
				mav.addObject("msg", "Hello");
				mav.addObject("name", u.getFirstName() );
				mav.addObject("password", u.getUserPassword() );
				mav.addObject("userType", u.getUserType() );
				return mav; 
			}else{
				ModelAndView mav = new ModelAndView("index");
				mav.addObject("msg", "WRONG PASSWORD");
				return mav; 
			}
		}
		
	}	
}
