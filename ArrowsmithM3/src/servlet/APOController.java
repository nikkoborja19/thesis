package servlet;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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
		ModelAndView mav = new ModelAndView("manageCourseOfferings");
		
		return mav;
	}
}
