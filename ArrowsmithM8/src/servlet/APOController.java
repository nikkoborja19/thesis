package servlet;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import dao.OfferingDAO;
import model.Offering;

@RestController
public class APOController {
	@RequestMapping(value="/addCourse", method=RequestMethod.GET)
	public ModelAndView addCourse() {
		ModelAndView mav = new ModelAndView("addCourses");
		
		return mav;
	}
	
	@RequestMapping(value="/roomAssign", method=RequestMethod.GET)
	public ModelAndView assignRoom() {
		ModelAndView mav = new ModelAndView("roomAssignment");
		
		return mav;
	}
	
	@RequestMapping(value="/manageCourse", method=RequestMethod.GET)
	public ModelAndView manageCoursesForm() {
		ArrayList<Offering> offerings = new ArrayList();
		
		try {
			offerings = OfferingDAO.getListOfferingsByTerm("2016", "2017", "1");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Gson gson = new Gson();
		String obj = gson.toJson(offerings);
		System.out.println("JSON: " + obj);
		
		ModelAndView mav = new ModelAndView("manageCourseOfferings");
		mav.addObject("offeringList", obj);
		
		return mav;
	}
}
