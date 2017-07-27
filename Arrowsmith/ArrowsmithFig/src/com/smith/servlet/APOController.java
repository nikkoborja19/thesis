package com.smith.servlet;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.smith.dao.BuildingDAO;
import com.smith.dao.CourseDAO;
import com.smith.dao.DegreeprogramDAO;
import com.smith.dao.FlowchartDAO;
import com.smith.dao.OfferingDAO;
import com.smith.dao.SpecialDAO;
import com.smith.dao.TimeframeDAO;
import com.smith.model.Building;
import com.smith.model.Course;
import com.smith.model.Degreeprogram;
import com.smith.model.Offering;
import com.smith.model.Timeframe;
import com.sun.corba.se.impl.oa.poa.ActiveObjectMap.Key;

@RestController
public class APOController {
	private ArrayList<Timeframe> timeframes = new ArrayList();
	private ArrayList<String> formatTimeframes = new ArrayList();
	private String timeframeButtonName = "Select Term";
	
	private ArrayList<Degreeprogram> degreeProgramList = new ArrayList();
	private ArrayList<String> degreeList = null;
	private ArrayList<String> batchList = null;
	private ArrayList<String> yearList = null;
	
	private ArrayList<Course> previewCourseList = new ArrayList();
	
	@ModelAttribute
	public void setTimeframeDropDown(Model mav) {		
		if(timeframes.isEmpty()) {
			try {
				timeframes = TimeframeDAO.getDistinctTimeframes();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//			System.out.println("Getting Timeframes");
		}
		
		if(formatTimeframes.isEmpty()) {
			if(timeframes != null) {
				for (Timeframe timeframe : timeframes) {
					formatTimeframes.add(timeframe.makeString());
				}
			}
//			System.out.println("Formatting Timeframes");
		}
		
		try {
			if(degreeList == null) {
				degreeList = DegreeprogramDAO.getDegreeList();
			}
			
			if(batchList == null) {
				batchList = FlowchartDAO.getBatchList();
			}
			
			if (yearList == null) {
				yearList = FlowchartDAO.getYearList();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if (degreeList != null && degreeProgramList.isEmpty()) {
			for (String string : degreeList) {
				try {
					degreeProgramList.add(DegreeprogramDAO.getCourseByID(string));
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		mav.addAttribute("timeframeList", formatTimeframes);
		mav.addAttribute("timeframeButton", timeframeButtonName);
		mav.addAttribute("degreeList", degreeProgramList);
		mav.addAttribute("batchList", batchList);
		mav.addAttribute("yearList", yearList);
	}
	
	@RequestMapping(value="/addCourse", method=RequestMethod.GET)
	public ModelAndView addCoursePage() {
		System.out.println("-----REFRESHING PREVIEW COURSE LIST-----");
		previewCourseList = new ArrayList();
		ModelAndView mav = new ModelAndView("addCourses");
		
		return mav;
	}
	
	@RequestMapping(value="/roomAssign", method=RequestMethod.GET)
	public ModelAndView assignRoomPage() {
		ArrayList<Offering> offerings = new ArrayList();
		
		try {
			offerings = OfferingDAO.getListOfferingsByTerm("2016", "2017", "2");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ModelAndView mav = new ModelAndView("roomAssignment");
		mav.addObject("startYear", "2016");
		mav.addObject("endYear", "2017");
		mav.addObject("term", "2");
		mav.addObject("offeringList", offerings);
		
		//System.out.println("searchVar: " + searchVar);
		return mav;
	}
	
	@RequestMapping(value="/manageCourse", method=RequestMethod.GET)
	public ModelAndView manageCoursesPage() {		
		ModelAndView mav = new ModelAndView("manageCourseOfferings");
		
		return mav;
	}
	
	@RequestMapping(value="/findCourses", method=RequestMethod.POST)
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
	
	@RequestMapping(value="/filterCourses", method=RequestMethod.POST)
	public ModelAndView filterCourses(@RequestParam Map<String, String> reqPar) {
		String degree = reqPar.get("degSelect");
		String batch = reqPar.get("batSelect");
		String yearLevel = reqPar.get("yearSelect");
		String term = reqPar.get("termSelect");
		ArrayList<Course> courseList = new ArrayList();
		ArrayList<String> courseIdList = new ArrayList();
		ArrayList<String> formattedYear = splitByDash(yearLevel);
		
		try {
			courseIdList = SpecialDAO.getCourseByID(degree, batch, formattedYear.get(0), formattedYear.get(1), term);
			
			if(!courseIdList.isEmpty()) {
				for (String string : courseIdList) {
					courseList.add(CourseDAO.getCourseByID(string));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ModelAndView mav = new ModelAndView("addCourses");
		mav.addObject("courseList", courseList);
		
		return mav;
	}
	
	@RequestMapping(value="/getCourseById", method=RequestMethod.POST, produces="application/json")
	public @ResponseBody ArrayList<Course> getSingleCourse(@RequestParam("courseId") String id) {
		String courseId = splitByDash(id).get(0);
		
		System.out.println("courseId: " + courseId);
		
		try {
			previewCourseList.add(CourseDAO.getCourseByID(courseId));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return previewCourseList;
	}
	
	@RequestMapping(value="/displayCourseRoomAssign", method=RequestMethod.POST)
	public ModelAndView roomAssignmentClick(
			@RequestParam("inputDumpID") String ID,
			@RequestParam("inputDumpStartYear") String startYear,
			@RequestParam("inputDumpEndYear") String endYear,
			@RequestParam("inputDumpTerm") String term) {
		ArrayList<Offering> offerings = new ArrayList();
		Offering clickedOffering = new Offering();
		
		try {
			clickedOffering = OfferingDAO.getOfferingByID(ID);
			offerings = OfferingDAO.getListOfferingsByTerm(startYear, endYear, term);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ModelAndView mav = new ModelAndView("roomAssignment");
		mav.addObject("startYear", startYear);
		mav.addObject("endYear", endYear);
		mav.addObject("term", term);
		mav.addObject("clickedID", clickedOffering.getOfferingId());
		//mav.addObject("timeframeButton", searchVar);
//		timeframeButtonName = searchVar;
		mav.addObject("clickedOffering", clickedOffering);
		mav.addObject("offeringList", offerings);
		
		//System.out.println("searchVar: " + searchVar);
		return mav;
	}
	
	@RequestMapping(value="/addSections", method=RequestMethod.POST)
	public void getSections(@RequestParam Map<String, String> sectionList) {
		ArrayList<String> res = new ArrayList();
		Set<String> keys = sectionList.keySet();
		
		for (String string : keys) {
			System.out.println("val: " + sectionList.get(string) + " key: " + string);
		}
		
		for (Course course : previewCourseList) {
			res.add(course.getCourseCode() + "-" + sectionList.get(course.getCourseCode()));
		}
		
		for (String string : res) {
			System.out.println("section: " + string);
		}
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

	private ArrayList<String> splitByDash(String dashMid){
		ArrayList<String> res = new ArrayList();
		List<String> temp = Arrays.asList(dashMid.split("-"));
		
		res.addAll(temp);
		
		return res;
	}
	
	public String getTimeframeButtonName() {
		return timeframeButtonName;
	}

	public void setTimeframeButtonName(String timeframeButtonName) {
		this.timeframeButtonName = timeframeButtonName;
	}
	
	/********************BUILDING RELATED METHODS*************************/
	@RequestMapping(value="/getBuildingsAndRooms", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<Building> getBuildingsAndRooms() {
		ArrayList<Building> buildingList = new ArrayList<Building>();
		
		try {
			buildingList = BuildingDAO.getAllBuildingsWithRoomCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return buildingList;
	}
	/********************BUILDING RELATED METHODS*************************/
}
