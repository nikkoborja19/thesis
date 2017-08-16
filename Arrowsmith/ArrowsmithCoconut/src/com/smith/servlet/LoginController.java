package com.smith.servlet;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.smith.dao.UserDAO;
import com.smith.model.User;

@RestController
public class LoginController {
	@RequestMapping("/")
	public ModelAndView startPage() {
		ModelAndView mav = new ModelAndView("index");
		
		return mav;
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView getLoginForm() {
		ModelAndView mav = new ModelAndView("index");
		
		return mav;
	}
	
	@RequestMapping(value="/loginSubmit", method=RequestMethod.POST)
	public ModelAndView receiveLoginForm(@RequestParam Map<String, String> pathVars, @CookieValue(value="Gamer", defaultValue="Ass Afro") String user, @CookieValue(value="Code", defaultValue="John Cena") String pass, HttpServletResponse response) throws SQLException{
		String ID = pathVars.get("idnumber");
		String password = pathVars.get("password");
		Cookie toBake;
		
		User u = UserDAO.getUserByID(ID);
		
		System.out.println("Fuckin user: " + u.getUserId());
		
		if(u.getUserId() == null){
			ModelAndView mav = new ModelAndView("index");
			mav.addObject("msg", "USER DOES NOT EXIST");
			return mav; 
		}else{
			if(u.getUserId().equals(ID) && u.getUserPassword().equals(password)){
				ModelAndView mav = new ModelAndView("homepageAPO");
				
				toBake = new Cookie("Gamer", ID);//same shit as before
				toBake.setMaxAge(30); //in secs
				
				response.addCookie(toBake);
				
				toBake = new Cookie("Code", password);//create cookie with key/name of "Code"; parang hashmap kc kaya may key/name
				toBake.setMaxAge(30); //in secs; after 30 secs cookie DIES!!!
				
				response.addCookie(toBake);//to seal the deal... para ma dag dag sa session? browser? ang cookie
//				mav.addObject("msg", "Hello");
//				mav.addObject("name", u.getFirstName() );
//				mav.addObject("password", u.getUserPassword() );
//				mav.addObject("userType", u.getUserType() );
				return mav; 
			}else{
				ModelAndView mav = new ModelAndView("index");
				mav.addObject("msg", "WRONG USERNAME OR PASSWORD");
				return mav; 
			}
		}
		
	}	
}
