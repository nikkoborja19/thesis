package com.smith.servlet;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.smith.dao.UserDAO;
import com.smith.model.User;
import com.smith.utility.Scrambler;

@RestController
@SessionAttributes("user")
public class LoginController {
	
	@ModelAttribute
	public void setUsernameNav(@ModelAttribute("user") User user, Model mav) {		
		mav.addAttribute("user", user);
	}
	
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
	public ModelAndView receiveLoginForm(@RequestParam Map<String, String> pathVars, 
										@CookieValue(value="Gamer", defaultValue="Samurai Afro") String user, 
										@CookieValue(value="Code", defaultValue="John Cena") String pass, 
										@CookieValue(value="Class", defaultValue="Mage") String type, 
										HttpServletRequest request, HttpServletResponse response) throws SQLException{
		
		String ID = pathVars.get("idnumber");
		String password = pathVars.get("password");
		Cookie toBake;
		HttpSession session = request.getSession();
		
		User u = UserDAO.getUserByID(ID);
		
		if(u.getUserId() == null){
			ModelAndView mav = new ModelAndView("index");
			mav.addObject("msg", "USER DOES NOT EXIST");
			return mav; 
		}else{
			if(u.getUserId().equals(ID) && Scrambler.isSamePassword(u.getUserPassword(), password)){
				ModelAndView mav = null;
				
				toBake = new Cookie("Gamer", ID);//same shit as before
				toBake.setMaxAge(9999); //in secs
				
				response.addCookie(toBake);
				
				toBake = new Cookie("Code", password);//create cookie with key/name of "Code"; parang hashmap kc kaya may key/name
				toBake.setMaxAge(9999); //in secs; after 30 secs cookie DIES!!!
				
				response.addCookie(toBake);//to seal the deal... para ma dag dag sa session? browser? ang cookie
				
				toBake = new Cookie("Class", u.getUserType());
				toBake.setMaxAge(9999);
				
				response.addCookie(toBake);//to seal the deal... para ma dag dag sa session and cookie
				
				session.setAttribute("user", u);
				
				if(u.getUserType().equals("Academic Programming Officer")) {
					mav = new ModelAndView("dashboardAPO");
					mav.addObject(u);
				}else if(u.getUserType().equals("Chair") || u.getUserType().equals("Vice Chair")) {
					mav = new ModelAndView("dashboardCVC2");
					mav.addObject(u);
				}
				
				return mav; 
			}else{
				ModelAndView mav = new ModelAndView("index");
				mav.addObject("msg", "WRONG USERNAME OR PASSWORD");
				return mav; 
			}
		}
		
	}
	
	@RequestMapping(value="/homeTraverse", method=RequestMethod.GET)
	public ModelAndView homeTraverse(@CookieValue(value="Gamer", defaultValue="Samurai Afro") String user, @CookieValue(value="Code", defaultValue="John Cena") String pass, @CookieValue(value="Class", defaultValue="Mage") String type, HttpServletResponse response) {
		ModelAndView mav = null;
		Cookie toBake = null;
		
		if(user.equals("Samurai Afro") || pass.equals("John Cena") || type.equals("Mage")) {
			mav = new ModelAndView("index");
			
			return mav;
		} else if(type.equals("Academic Programming Officer")){
			mav = new ModelAndView("dashboardAPO");
		}
		
		toBake = new Cookie("Gamer", user);
		toBake.setMaxAge(9999); 
		
		response.addCookie(toBake);
		
		toBake = new Cookie("Code", pass);
		toBake.setMaxAge(9999); 
		
		response.addCookie(toBake);
		
		toBake = new Cookie("Class", type);
		toBake.setMaxAge(9999); 
		
		response.addCookie(toBake);
		
		return mav;
	}
}
