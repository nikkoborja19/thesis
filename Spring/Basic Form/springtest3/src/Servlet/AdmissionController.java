package Servlet;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdmissionController {
	
	@RequestMapping(value="/admissionForm.html", method=RequestMethod.GET)
	public ModelAndView getAdmissionForm() {
		ModelAndView mav = new ModelAndView("AdmissionForm");
		
		return mav;
	}
	
	@RequestMapping(value="/submitAdmissionForm.html", method=RequestMethod.POST)
	public ModelAndView submitAdmissionForm(@RequestParam Map<String, String> pathVars) {
		String name = pathVars.get("name");
		String hobby = pathVars.get("hobby");
		
		ModelAndView mav = new ModelAndView("AdmissionSuccess");
		mav.addObject("msg", "You are " + name + " and your hobby is " + hobby);
		return mav; 
	}	
}
