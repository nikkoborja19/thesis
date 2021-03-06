package com.smith.servlet;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.smith.dao.AcademicYearDAO;
import com.smith.dao.BuildingDAO;
import com.smith.dao.CollegeDAO;
import com.smith.dao.CourseDAO;
import com.smith.dao.DaysDAO;
import com.smith.dao.DegreeprogramDAO;
import com.smith.dao.DepartmentDAO;
import com.smith.dao.FacultyDAO;
import com.smith.dao.FlowchartDAO;
import com.smith.dao.OfferingDAO;
import com.smith.dao.RoomDAO;
import com.smith.dao.SpecialDAO;
import com.smith.dao.TimeframeDAO;
import com.smith.model.AcademicYear;
import com.smith.model.Building;
import com.smith.model.College;
import com.smith.model.Course;
import com.smith.model.Degreeprogram;
import com.smith.model.Department;
import com.smith.model.Faculty;
import com.smith.model.Offering;
import com.smith.model.Room;
import com.smith.model.StringResponse;
import com.smith.model.TempOffering;
import com.smith.model.Timeframe;
import com.sun.corba.se.impl.oa.poa.ActiveObjectMap.Key;

@RestController
public class APOController {
	private ArrayList<Timeframe> timeframes = new ArrayList();
	private ArrayList<String> formatTimeframes = new ArrayList();
	private ArrayList<TempOffering> tempOfferingList = new ArrayList();
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
	
	@RequestMapping(value="/getBuildingNameModal", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody StringResponse getBuildingsAndRooms(@RequestParam("buildingId") String buildingId) {
		Building b = new Building();
		StringResponse sr = new StringResponse("");
		try {
			b = BuildingDAO.getBuildingByID(buildingId);
			sr = new StringResponse(b.getBuildingName());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sr;
	}
	
	@RequestMapping(value="/populateBuildingDropdown", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<String> populateBuildingDropdown() {
		ArrayList<String> typeList = new ArrayList<String>();
		
		try {
			typeList = BuildingDAO.getAllBuildingNames();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return typeList;
	}
	/********************BUILDING RELATED METHODS*************************/
	/********************ROOM RELATED METHODS*************************/
	@RequestMapping(value="/getRoomsOfBuilding", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<Room> getRoomsOfBuilding(
			@RequestParam("buildingId") String buildingId,
			@RequestParam("roomType") String roomType,
			@RequestParam("roomCapacity") String roomCapacity) {
		ArrayList<Room> roomList = new ArrayList<Room>();
		
		try {
			roomList = RoomDAO.getAllRoomsOfBuilding(buildingId, roomType, roomCapacity);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return roomList;
	}
	
	@RequestMapping(value="/populateRoomCapacityDropdown", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<String> populateRoomCapacityDropdown() {
		ArrayList<String> capacityList = new ArrayList<String>();
		
		try {
			capacityList = RoomDAO.getAllUniqueRoomCapacity();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return capacityList;
	}
	
	@RequestMapping(value="/populateRoomTypeDropdown", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<String> populateRoomTypeDropdown() {
		ArrayList<String> typeList = new ArrayList<String>();
		
		try {
			typeList = RoomDAO.getAllUniqueRoomType();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return typeList;
	}
	
	@RequestMapping(value="/getRoomListWithKey", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<Room> getRoomListWithKey(
			@RequestParam("offeringId") String offeringId,
			@RequestParam("searchKeyword") String searchKeyword,
			@RequestParam("roomType") String roomType,
			@RequestParam("building") String building) {
		ArrayList<Room> roomList = new ArrayList<Room>();
		Offering o = new Offering();
		Building b = new Building();
		int tempId = -999;
		
		try {
			o = OfferingDAO.getOfferingByID(offeringId);
			if(building.equalsIgnoreCase("All")){
				tempId = -999;
			}else{
				b = BuildingDAO.getBuildingByName(building);
				tempId = Integer.parseInt(b.getId());
			}
			
			roomList = RoomDAO.getAllRoomsWithSearchKey(o, tempId, roomType, searchKeyword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return roomList;
	}
	
	@RequestMapping(value="/initiateRoomAssignment", method=RequestMethod.POST, produces="application/json")
	public @ResponseBody StringResponse initiateRoomAssignment(
			@RequestParam("offeringId") String offeringId,
			@RequestParam("roomId") String roomId){
		
		StringResponse sr = new StringResponse("success");
		
		try {
			DaysDAO.assignRoomToOffering(offeringId, roomId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sr;
	}
	/********************ROOM RELATED METHODS*************************/
	/********************ACADEMIC YEARS/FLOWCHARTS RELATED METHODS***************/
	@RequestMapping(value="/getAllAcademicYears", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<AcademicYear> getAllAcademicYears() {
		ArrayList<AcademicYear> AYList = new ArrayList<AcademicYear>();
		
		try {
			AYList = AcademicYearDAO.getAllAY();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return AYList;
	}
	/********************ACADEMIC YEARS/FLOWCHARTS RELATED METHODS***************/
	/********************OFFERING RELATED METHODS**************************/
	@RequestMapping(value="/getOfferingListWithKey", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<Offering> getOfferingListWithKey(
			@RequestParam("startYear") String startYear,
			@RequestParam("endYear") String endYear,
			@RequestParam("term") String term,
			@RequestParam("searchKeyword") String searchKeyword) {
		ArrayList<Offering> offeringList = new ArrayList<Offering>();
		
		try {
			offeringList = OfferingDAO.getListOfferingsByTermWithCourseKey(startYear, endYear, term, searchKeyword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return offeringList;
	}
	
	@RequestMapping(value="/getAllOfferingsWithFilters", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<Offering> getAllOfferingsWithFilters(
			@RequestParam("startYear") String startYear,
			@RequestParam("endYear") String endYear,
			@RequestParam("term") String term,
			@RequestParam("daysList[]") String[] daysList,
			@RequestParam("selectedTimeBlock") String selectedTimeBlock,
			@RequestParam("selectedBatch") String selectedBatch,
			@RequestParam("selectedStatus") String selectedStatus,
			@RequestParam("selectedRoomType") String selectedRoomType,
			@RequestParam("searchKeyword") String searchKeyword) {
		
		ArrayList<Offering> offeringList = new ArrayList<Offering>();
		/*System.out.println(daysList.length + "-" + selectedTimeBlock + "-" + selectedRoomType
				+ "-" + selectedBatch + "-" + selectedStatus
				+ "-" + endYear + "-" + startYear+ "-" + term + "-" + daysList[2]
						+ "-" + daysList[4] + "-" + searchKeyword);*/
		try {
			offeringList = OfferingDAO.getListOfferingsByTermWithFilters(startYear, endYear, term, 
					daysList, selectedTimeBlock, selectedBatch, selectedStatus, selectedRoomType, searchKeyword);
			//System.out.println(offeringList.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return offeringList;
	}
	
	@RequestMapping(value="/publishAYTerm", method=RequestMethod.POST, produces="application/json")
	public @ResponseBody StringResponse publishAYTerm(
			@RequestParam("startYear") String startYear,
			@RequestParam("endYear") String endYear,
			@RequestParam("term") String term,
			@RequestParam("state") String state){
		
		StringResponse sr = new StringResponse("success");
		
		try {
			OfferingDAO.publishOfferings(startYear, endYear, term, state);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sr;
	}
	
	@RequestMapping(value="/populateBatchDropdown", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<String> populateBatchDropdown(
			@RequestParam("startYear") String startYear,
			@RequestParam("endYear") String endYear,
			@RequestParam("term") String term) {
		ArrayList<String> sList = new ArrayList<String>();
		
		try {
			sList = OfferingDAO.getAllUniqueBatch(startYear, endYear, term);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sList;
	}
	
	@RequestMapping(value="/populateStatusDropdown", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<String> populateStatusDropdown(
			@RequestParam("startYear") String startYear,
			@RequestParam("endYear") String endYear,
			@RequestParam("term") String term) {
		ArrayList<String> sList = new ArrayList<String>();
		
		try {
			sList = OfferingDAO.getAllUniqueStatus(startYear, endYear, term);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sList;
	}
	
	@RequestMapping(value="/populateTimeBlockDropdown", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<String> populateTimeBlockDropdown(
			@RequestParam("startYear") String startYear,
			@RequestParam("endYear") String endYear,
			@RequestParam("term") String term) {
		ArrayList<String> sList = new ArrayList<String>();
		
		try {
			sList = DaysDAO.getAllUniqueTimeBlock(startYear, endYear, term);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sList;
	}
	
	@RequestMapping(value="/populateTimeBlockEODropdown", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<String> populateTimeBlockEODropdown() {
		ArrayList<String> sList = new ArrayList<String>();
		
		try {
			sList = DaysDAO.getAllUniqueTimeBlock("none", "none", "none");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sList;
	}
	@RequestMapping(value="/emptyNewOfferingList", method=RequestMethod.POST, produces="application/json")
	public @ResponseBody StringResponse emptyNewOfferingList() throws SQLException{
		StringResponse sr = new StringResponse("delete");
	
		tempOfferingList.clear(); //remove the laman
		return sr;
	}
	
	@RequestMapping(value="/saveNewOfferingList", method=RequestMethod.POST, produces="application/json")
	public @ResponseBody StringResponse saveNewOfferingList() throws SQLException{
		StringResponse sr = new StringResponse("success");
		System.out.println(tempOfferingList.size() + " SAVE SIZE");
		//TempOffering o = new TempOffering(startYear, endYear, term, degreeProgram, courseId, courseCode,section, batch, status, remarks,days1, days2, time1, time2);
		//tempOfferingList.add(o);
		
		for(int i = 0; i < tempOfferingList.size(); i++){
			TempOffering o = tempOfferingList.get(i);
			int j = OfferingDAO.addNewOfferingsToDB(o.getStartYear(), o.getEndYear(), o.getTerm(), o.getDegreeProgram(), o.getCourseId(), o.getCourseCode(), o.getSection(), o.getBatch(), o.getStatus(), o.getRemarks(), o.getDays1(), o.getDays2(), o.getTime1(), o.getTime2());
		}
		
		sr = new StringResponse(OfferingDAO.getLastRecordIndex()+"");
		//emptyNewOfferingList();
		return sr;
	}
	
	@RequestMapping(value="/addNewOfferingList", method=RequestMethod.POST, produces="application/json")
	public @ResponseBody StringResponse addNewOfferingList(
			@RequestParam("startYear") String startYear,
			@RequestParam("endYear") String endYear,
			@RequestParam("term") String term,
			@RequestParam("degreeProgram") String degreeProgram,
			@RequestParam("courseId") String courseId,
			@RequestParam("courseCode") String courseCode,
			@RequestParam("section") String section,
			@RequestParam("batch") String batch,
			@RequestParam("status") String status,
			@RequestParam("remarks") String remarks,
			@RequestParam("daysList1[]") String[] days1,
			@RequestParam("daysList2[]") String[] days2,
			@RequestParam("timeSlot1") String time1, //time1 and 2 is in starttime-endtime format
			@RequestParam("timeSlot2") String time2) throws SQLException{
		StringResponse sr = new StringResponse("success " + courseCode);
		
		TempOffering o = new TempOffering(startYear, endYear, term, degreeProgram, courseId, courseCode,section, batch, status, remarks,days1, days2, time1, time2);
		tempOfferingList.add(o);
		//saveNewOfferingList();
		//int i = OfferingDAO.addNewOfferingsToDB(startYear, endYear, term, degreeProgram, courseId, courseCode, section, batch, status, remarks, days1, days2, time1, time2);
		//sr = new StringResponse(OfferingDAO.getLastRecordIndex()+"");
		System.out.println(tempOfferingList.size() + " SIZE");
		return sr;
	}
	/********************OFFERING RELATED METHODS**************************/
	/********************FLOWCHART RELATED METHODS************************/
	@RequestMapping(value="/populateFlowchartBatchDropdown", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<String> populateFlowchartBatchDropdown(
			@RequestParam("collegeId") String collegeId,
			@RequestParam("deptId") String deptId) {
		ArrayList<String> sList = new ArrayList<String>();
		
		try {
			sList = DegreeprogramDAO.getAllFlowchartBatch(collegeId, deptId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sList;
	}
	
	@RequestMapping(value="/populateFlowchartAYDropdown", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<String> populateFlowchartAYDropdown(
			@RequestParam("collegeId") String collegeId,
			@RequestParam("deptId") String deptId) {
		ArrayList<String> sList = new ArrayList<String>();
		
		try {
			sList = FlowchartDAO.getAllFlowchartAcademicYear(collegeId, deptId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sList;
	}
	
	@RequestMapping(value="/populateFlowchartDegreeProgramDropdown", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<String> populateFlowchartDegreeProgramDropdown(
			@RequestParam("collegeId") String collegeId,
			@RequestParam("deptId") String deptId) {
		ArrayList<String> sList = new ArrayList<String>();
		
		try {
			sList = DegreeprogramDAO.getAllFlowchartDegreeProgram(collegeId, deptId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sList;
	}
	/********************FLOWCHART RELATED METHODS************************/
	/*********************COURSE RELATED METHODS**************************/
	@RequestMapping(value="/getAllCoursesWithCourseKey", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<Course> getAllCoursesWithCourseKey(
			@RequestParam("searchKeyword") String key) {
		ArrayList<Course> courseList = new ArrayList<Course>();
		
		try {
			if(!key.isEmpty() && !removeSpaces(key).isEmpty()){
				courseList = CourseDAO.getAllCoursesWithKey(key);
	        }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return courseList;
	}
	@RequestMapping(value="/getAllFlowchartCourses", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<Course> getAllFlowchartCoursesList(
			@RequestParam("selectedDegreeProgram") String degreeProgram,
			@RequestParam("selectedBatch") String batch,
			@RequestParam("selectedTerm") String term,
			@RequestParam("startYear") String startYear,
			@RequestParam("endYear") String endYear) {
		ArrayList<Course> courseList = new ArrayList<Course>();
		
		try {
			courseList = CourseDAO.getAllFlowchartCourses(degreeProgram, batch, term, startYear, endYear);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return courseList;
	}
	
	@RequestMapping(value="/getCourseWithID", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody Course getCourseWithID(
			@RequestParam("courseId") String ID) {
		Course c = new Course();
		
		try {
			c = CourseDAO.getCourseByID(ID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return c;
	}
	/*********************COURSE RELATED METHODS**************************/
	/*********************FACULTY RELATED METHODS****************************/
	@RequestMapping(value="/getFacultyListWithKey", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<Faculty> getFacultyListWithKey(
			@RequestParam("offeringId") String offeringId,
			@RequestParam("facultyType") String facultyType,
			@RequestParam("department") String department,
			@RequestParam("college") String college,
			@RequestParam("searchKeyword") String searchKeyword) {
		
		ArrayList<Faculty> facultyList = new ArrayList<Faculty>();
		Offering o = new Offering();
		Department d = new Department();
		College c = new College();
		int tempDeptId = -999;
		int tempCollegeId = -999;
		String newFacultyType = facultyType;
//		String newFacultyType;
		
//		if(facultyType.equalsIgnoreCase("Full Time")) newFacultyType = "FT";
//		else if(facultyType.equalsIgnoreCase("Part Time")) newFacultyType = "PT";
//		else if(facultyType.equalsIgnoreCase("Half Time")) newFacultyType = "HT";
//		else  newFacultyType = "FT";
		
		try {
			o = OfferingDAO.getOfferingByID(offeringId);
			
			if(!department.equalsIgnoreCase("All")){//if not "All" then set, else use default value
				d = DepartmentDAO.getDepartmentByName(department);
				tempDeptId = Integer.parseInt(d.getId());
			}
			
			if(!college.equalsIgnoreCase("All")){//if not "All" then set, else use default value
				c = CollegeDAO.getCollegeByName(college);
				System.out.println("COLLEGE: "+ c.getCollegeName());
				tempCollegeId = Integer.parseInt(c.getId());
			}

			if(removeSpaces(searchKeyword).equalsIgnoreCase("") && tempCollegeId == -999 && tempDeptId == -999){
				String tempKey = "";
				facultyList = FacultyDAO.getAllFacultyWithRecommendations(o, newFacultyType, tempDeptId+"", tempCollegeId+"", tempKey);
			}else{
				facultyList = FacultyDAO.getAllFacultyWithSearchKey(o, newFacultyType, tempDeptId+"", tempCollegeId+"", searchKeyword);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return facultyList;
	}
	
	
	@RequestMapping(value="/populateFacultyTypeDropdown", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<String> populateFacultyTypeDropdown() {
		ArrayList<String> typeList = new ArrayList<String>();
		
		try {
			typeList = FacultyDAO.getAllUniqueFacultyType();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return typeList;
	}
	
	@RequestMapping(value="/initiateFacultyAssignment", method=RequestMethod.POST, produces="application/json")
	public @ResponseBody StringResponse initiateFacultyAssignment(
			@RequestParam("offeringId") String offeringId,
			@RequestParam("facultyId") String facultyId){
		
		StringResponse sr = new StringResponse("success");
		
		try {
			FacultyDAO.assignFacultyToOffering(offeringId, facultyId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sr;
	}
	/*********************FACULTY RELATED METHODS****************************/
	/*********************DEPARTMENT AND COLLEGE RELATED METHODS**********************/
	@RequestMapping(value="/populateCollegesDropdown", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<String> populateCollegesDropdown() {
		ArrayList<String> typeList = new ArrayList<String>();
		
		try {
			typeList = CollegeDAO.getAllUniqueColleges();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return typeList;
	}
	
	@RequestMapping(value="/populateDepartmentsDropdown", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<String> populateDepartmentsDropdown() {
		ArrayList<String> typeList = new ArrayList<String>();
		
		try {
			typeList = DepartmentDAO.getAllUniqueDepartments();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return typeList;
	}
	
	public static String removeSpaces(String s){
		s = s.replaceAll("\\s",""); 
		return s;
	}
	
	
}
