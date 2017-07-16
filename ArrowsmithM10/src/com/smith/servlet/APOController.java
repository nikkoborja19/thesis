package com.smith.servlet;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.smith.dao.OfferingDAO;
import com.smith.dao.TimeframeDAO;
import com.smith.model.Offering;
import com.smith.model.Timeframe;

@RestController
public class APOController {
	private ArrayList<Timeframe> timeframes = new ArrayList();
	private ArrayList<String> formatTimeframes = new ArrayList();
	private String timeframeButtonName = "Select Term";
	
	@ModelAttribute
	public void setTimeframeDropDown(Model mav) {		
		if(timeframes.isEmpty()) {
			try {
				timeframes = TimeframeDAO.getDistinctTimeframes();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Getting Timeframes");
		}
		
		if(formatTimeframes.isEmpty()) {
			if(timeframes != null) {
				for (Timeframe timeframe : timeframes) {
					formatTimeframes.add(timeframe.makeString());
				}
			}
			System.out.println("Formatting Timeframes");
		}
		
		mav.addAttribute("timeframeList", formatTimeframes);
		mav.addAttribute("timeframeButton", timeframeButtonName);
	}
	
	@RequestMapping(value="/addCourse", method=RequestMethod.GET)
	public ModelAndView addCoursePage() {
		ModelAndView mav = new ModelAndView("addCourses");
		
		return mav;
	}
	
	@RequestMapping(value="/roomAssign", method=RequestMethod.GET)
	public ModelAndView assignRoomPage() {
		ModelAndView mav = new ModelAndView("roomAssignment");
		
		return mav;
	}
	
	@RequestMapping(value="/manageCourse", method=RequestMethod.GET)
	public ModelAndView manageCoursesPage() {		
		ModelAndView mav = new ModelAndView("manageCourseOfferings");
		
		return mav;
	}
	
	@RequestMapping(value="/findCourse", method=RequestMethod.POST)
	public ModelAndView getListCourses(@RequestParam("searchVar") String searchVar) {
		ArrayList<Offering> offerings = new ArrayList();
		ArrayList<String> searchConfig = formatSearchVar(searchVar);
		
		try {
			offerings = OfferingDAO.getListOfferingsByTerm(searchConfig.get(0), searchConfig.get(1), searchConfig.get(2));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ModelAndView mav = new ModelAndView("manageCourseOfferings");
		mav.addObject("timeframeButton", searchVar);
//		timeframeButtonName = searchVar;
		mav.addObject("offeringList", offerings);
		
		System.out.println("searchVar: " + searchVar);
		return mav;
	}
	
	private ArrayList<String> formatSearchVar(String searchVar) {
		ArrayList<String> res = new ArrayList();
		String[] clean = searchVar.split(" ");//contains AY, 20xx-20yy, and TZ 
		String term = clean[2].substring(1);//gets TZ
		
		clean = clean[1].split("-");//Splits 20xx and 20yy. AY should be gone
		
		res.add(clean[0]);
//		System.out.println("clean[0]: " + clean[0]);
		res.add(clean[1]);
//		System.out.println("clean[1]: " + clean[1]);
		res.add(term);
//		System.out.println("term: " + term);
		
		return res;
	}

	public String getTimeframeButtonName() {
		return timeframeButtonName;
	}

	public void setTimeframeButtonName(String timeframeButtonName) {
		this.timeframeButtonName = timeframeButtonName;
	}
	
	
}
