package com.smith.servlet;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.smith.dao.AcademicYearDAO;
import com.smith.dao.CollegeDAO;
import com.smith.dao.CourseDAO;
import com.smith.dao.DaysDAO;
import com.smith.dao.DepartmentDAO;
import com.smith.dao.EquivalenceDAO;
import com.smith.dao.FacultyDAO;
import com.smith.dao.LoadDAO;
import com.smith.dao.OfferingDAO;
import com.smith.dao.RoomDAO;
import com.smith.model.AcademicYear;
import com.smith.model.College;
import com.smith.model.Constants;
import com.smith.model.Course;
import com.smith.model.Degreeprogram;
import com.smith.model.Department;
import com.smith.model.Faculty;
import com.smith.model.Load;
import com.smith.model.Offering;
import com.smith.model.StringResponse;
import com.smith.model.TempOffering;
import com.smith.model.Timeframe;

@RestController
public class CVCController {
	private ArrayList<Faculty> listFaculty = new ArrayList();
	private ArrayList<Timeframe> listTimeframe = new ArrayList();
	private ArrayList<Offering> listOffering = new ArrayList();
	
	private ArrayList<Timeframe> timeframes = new ArrayList();
	private ArrayList<String> formatTimeframes = new ArrayList();
	private ArrayList<TempOffering> tempOfferingList = new ArrayList();
	private String timeframeButtonName = "Select Term";
	
	private ArrayList<Degreeprogram> degreeProgramList = new ArrayList();
	private ArrayList<String> degreeList = null;
	private ArrayList<String> batchList = null;
	private ArrayList<String> yearList = null;
	
	private ArrayList<Course> previewCourseList = new ArrayList();
	
	/********************ACADEMIC YEARS/FLOWCHARTS RELATED METHODS***************/
	@RequestMapping(value="/getAllAcademicYearsCVC", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<AcademicYear> getAllAcademicYearsCVC() {
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
	@RequestMapping(value="/getOfferingListWithKeyCVC", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<Offering> getOfferingListWithKeyCVC(
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
	
	@RequestMapping(value="/getAllOfferingsWithFiltersCVC", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<Offering> getAllOfferingsWithFiltersCVC(
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
	
	@RequestMapping(value="/getAllOfferingsWithoutFiltersCVC", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<Offering> getAllOfferingsWithoutFiltersCVC(
			@RequestParam("startYear") String startYear,
			@RequestParam("endYear") String endYear,
			@RequestParam("term") String term) {
		
		ArrayList<Offering> offeringList = new ArrayList<Offering>();
		
		try {
			offeringList = OfferingDAO.getListOfferingsByTerm(startYear, endYear, term);
			//System.out.println(offeringList.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return offeringList;
	}
	
	@RequestMapping(value="/populateBatchDropdownCVC", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<String> populateBatchDropdownCVC(
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
	
	@RequestMapping(value="/populateStatusDropdownCVC", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<String> populateStatusDropdownCVC(
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
	
	@RequestMapping(value="/populateTimeBlockDropdownCVC", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<String> populateTimeBlockDropdownCVC(
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
	
	@RequestMapping(value="/populateRoomTypeDropdownCVC", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<String> populateRoomTypeDropdownCVC() {
		ArrayList<String> typeList = new ArrayList<String>();
		
		try {
			typeList = RoomDAO.getAllUniqueRoomType();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return typeList;
	}
	
	@RequestMapping(value="/getOfferingWithScheduleCVC", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody Offering getOfferingWithScheduleCVC(
			@RequestParam("offeringId") String offeringId) {
		Offering offering = new Offering();
		
		try {
			offering = OfferingDAO.getOfferingByID(offeringId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return offering;
	}
	
	@RequestMapping(value="/getOfferingListOfFacultyCVC", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<Offering> getOfferingListOfFacultyCVC(
			@RequestParam("facultyId") String facultyId,
			@RequestParam("startYear") String startYear,
			@RequestParam("endYear") String endYear,
			@RequestParam("term") String term) {
		
		ArrayList<Offering> offeringList = new ArrayList<Offering>();
		
		try {
			offeringList = OfferingDAO.getListOfferingsByFaculty(facultyId, startYear, endYear, term);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return offeringList;
	}
	/********************OFFERING RELATED METHODS**************************/
	/*********************FACULTY RELATED METHODS****************************/
	@RequestMapping(value="/getNormalFacultyListWithKeyCVC", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<Faculty> getNormalFacultyListWithKeyCVC(
			@RequestParam("offeringId") String offeringId,
			@RequestParam("startYear") String startYear,
			@RequestParam("endYear") String endYear,
			@RequestParam("term") String term) {
		
		ArrayList<Faculty> facultyList = new ArrayList<Faculty>();
		Offering offering = new Offering();
		Department dept = new Department();
		College college = new College();
		Course course = new Course();
		
		try {
			offering = OfferingDAO.getOfferingByID(offeringId);
			course = CourseDAO.getCourseByID(offering.getCourseId());
			dept = DepartmentDAO.getDepartmentByID(course.getDepartment().getId());
			college = CollegeDAO.getCollegeByID(course.getCollege().getId());
			
			facultyList = FacultyDAO.getAllFacultyWithSameCollegeAsOffering(course, college, startYear, endYear, term);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		return facultyList;
	}
	
	@RequestMapping(value="/getFacultyListWithKeyCVC", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<Faculty> getFacultyListWithKeyCVC(
			@RequestParam("offeringId") String offeringId,
			@RequestParam("facultyType") String facultyType,
			@RequestParam("department") String department,
			@RequestParam("college") String college,
			@RequestParam("searchKeyword") String searchKeyword,
			@RequestParam("startYear") String startYear,
			@RequestParam("endYear") String endYear,
			@RequestParam("term") String term) {
		
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
				//System.out.println("COLLEGE: "+ c.getCollegeName());
				tempCollegeId = Integer.parseInt(c.getId());
			}

			System.out.println(tempCollegeId + "--" + tempDeptId + "--" +searchKeyword + "--" +facultyType);
			facultyList = FacultyDAO.getAllFacultyWithSearchKey(o, newFacultyType, tempDeptId+"", tempCollegeId+"", searchKeyword, startYear, endYear, term);

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return facultyList;
	}
	
	@RequestMapping(value="/getRecommendedFacultyListWithKeyCVC", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<Faculty> getRecommendedFacultyListWithKeyCVC(
			@RequestParam("offeringId") String offeringId,
			@RequestParam("facultyType") String facultyType,
			@RequestParam("department") String department,
			@RequestParam("college") String college,
			@RequestParam("searchKeyword") String searchKeyword,
			@RequestParam("startYear") String startYear,
			@RequestParam("endYear") String endYear,
			@RequestParam("term") String term) {
		
		ArrayList<Faculty> facultyList = new ArrayList<Faculty>();
		Offering o = new Offering();
		int tempDeptId = -999;
		int tempCollegeId = -999;
		String newFacultyType = facultyType;
		
		try {
			o = OfferingDAO.getOfferingByID(offeringId);
			
			facultyList = FacultyDAO.getAllFacultyWithRecommendations(o, newFacultyType, tempDeptId+"", tempCollegeId+"", "", startYear, endYear, term);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return facultyList;
	}
	
	@RequestMapping(value="/populateFacultyTypeDropdownCVC", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<String> populateFacultyTypeDropdownCVC() {
		ArrayList<String> typeList = new ArrayList<String>();
		
		try {
			typeList = FacultyDAO.getAllUniqueFacultyType();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return typeList;
	}
	
	@RequestMapping(value = "/initiateFacultyAssignmentCVC", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json")
	public @ResponseBody StringResponse initiateFacultyAssignmentCVC(
			@RequestParam("offeringId") String offeringId,
			@RequestParam("facultyId") String facultyId,
			@RequestParam("startYear") String startYear,
			@RequestParam("endYear") String endYear,
			@RequestParam("term") String term) throws SQLException {

		StringResponse s = new StringResponse("Success");
		float units = 0;
		String loadsId = "", currentloadsId ="";
		units = OfferingDAO.getNumberOfUnits(offeringId);
		
		if (!(FacultyDAO.checkIfSameFaculty(facultyId, offeringId))) {

			// check if load id is existing, if not create a new load id for this specific faculty
			try {
				if (FacultyDAO.checkIfHasLoadId(facultyId, startYear, endYear, term)) {
					try {
						// remove faculty from course if any (make faculty id = 1)
						String currentFacultyId = OfferingDAO.getFacultyIdUsingOfferingId(offeringId);
						System.out.println("Current faculty id: " + currentFacultyId);
						if(!currentFacultyId.equals("1")) { // 1 - no professor, no need to decrement
							OfferingDAO.removeFacultyFromOffering(offeringId); // prompt in the future if sure the user really wants to change
							currentloadsId = LoadDAO.getLoadsId(currentFacultyId, startYear, endYear, term);
							FacultyDAO.decrementLoad(currentloadsId, units);
						}
						/****************************LOAD NECESSARY INFO******************************/
				        ArrayList<Offering> initialOfferingList = OfferingDAO.getListOfferingsByFaculty(facultyId, startYear, endYear, term);
				        Offering o = OfferingDAO.getOfferingByID(offeringId);
				        Load l = LoadDAO.getLoadByID(facultyId, startYear, endYear, term);
				        Faculty f = FacultyDAO.getFacultyByID(facultyId, startYear, endYear, term);
				        /****************************LOAD NECESSARY INFO******************************/
				        /****************************DETERMINE MAX LOADS PER FACULTY TYPE******************************/
				        float maxUnits = 12;
				        
				        if(f.getFacultyType().equalsIgnoreCase("FT")) maxUnits = 12;
				        else if(f.getFacultyType().equalsIgnoreCase("PT")) maxUnits = 9;
				        else if(f.getFacultyType().equalsIgnoreCase("HT")) maxUnits = 6;
				        /****************************DETERMINE MAX LOADS PER FACULTY TYPE******************************/
				        /****************************FACULTY ASSIGNMENT PROPER******************************/
						if(Integer.parseInt(l.getPreparations()) < 4){ //CHECK IF REACHED MAX PREPARATIONS
						//first step of recommend algo
							
							/****************************CHECK IF TOTAL LOAD +UNITS OF COURSE OT BE ADDED IS GREATER THAN MAX UNITS******************************/
							if((Float.parseFloat(l.getTotalLoad()) + Float.parseFloat(o.getCourse().getUnits())) <=  maxUnits){
								Integer hasViolatedSixHoursPerDay = 0;
								
								if(hasViolatedSixHoursPerDay == 0){
									FacultyDAO.assignFacultyToOffering(offeringId, facultyId); // assign the faculty id to offering id
									loadsId = LoadDAO.getLoadsId(facultyId, startYear, endYear, term);
									FacultyDAO.incrementLoad(loadsId, units);
									
									/****************************UPDATE PREPARATION COUNT******************************/
									int foundEquivalent = 0;
									
							        for(int j = 0; j < initialOfferingList.size(); j++){
							        	if(EquivalenceDAO.checkIfTwoCoursesAreEquivalent(initialOfferingList.get(j).getCourseId()+"", o.getCourseId()+"") == 1){
							        		foundEquivalent = 1;
							        	}
							        }
							        if(foundEquivalent == 0) LoadDAO.updateFacultyPreparationCount(facultyId, startYear, endYear, term);
							        /****************************UPDATE PREPARATION COUNT******************************/
		
									System.out.println("Finished adding units to faculty!");
									s = new StringResponse("Success");
								}
							}else if((Float.parseFloat(l.getTotalLoad()) + Float.parseFloat(o.getCourse().getUnits())) >  18){ //MAX LOADS 3: Over 15 na pag nagdagdag
								s = new StringResponse("Maximum Load Reached");
								
								s.setLastName(f.getLastName());
								s.setFirstName(f.getFirstName());
								
							}else if((Float.parseFloat(l.getTotalLoad()) >  maxUnits) && (Float.parseFloat(l.getTotalLoad()) <  18)){ //MAX LOADS 1: HAS REACHED MAX LOAD CHECKER
								s = new StringResponse("Already Overload");
								
								s.setLastName(f.getLastName());
								s.setFirstName(f.getFirstName());
								
								if(f.getFacultyType().equalsIgnoreCase("FT")){
									s.setFacultyType("Full Time");
									s.setMaxLoad(Float.parseFloat(Constants.MAX_LOAD_FULLTIME));
								}else if(f.getFacultyType().equalsIgnoreCase("PT")){
									s.setFacultyType("Part Time");
									s.setMaxLoad(Float.parseFloat(Constants.MAX_LOAD_PARTTIME));
								}if(f.getFacultyType().equalsIgnoreCase("HT")){
									s.setFacultyType("Half Time");
									s.setMaxLoad(Float.parseFloat(Constants.MAX_LOAD_HALFTIME));
								}else{
									s.setFacultyType("Full Time");
									s.setMaxLoad(Float.parseFloat(Constants.MAX_LOAD_FULLTIME));
								}
							}else if((Float.parseFloat(l.getTotalLoad()) + Float.parseFloat(o.getCourse().getUnits())) >  maxUnits){ //MAX LOADS 2: ADDING THE SUBJECT WILL MAKE THE FACULTY OVERLOAD
								s = new StringResponse("Overload Threat");
								
								s.setLastName(f.getLastName());
								s.setFirstName(f.getFirstName());
								
								if(f.getFacultyType().equalsIgnoreCase("FT")){
									s.setFacultyType("Full Time");
									s.setMaxLoad(Float.parseFloat(Constants.MAX_LOAD_FULLTIME));
								}else if(f.getFacultyType().equalsIgnoreCase("PT")){
									s.setFacultyType("Part Time");
									s.setMaxLoad(Float.parseFloat(Constants.MAX_LOAD_PARTTIME));
								}if(f.getFacultyType().equalsIgnoreCase("HT")){
									s.setFacultyType("Half Time");
									s.setMaxLoad(Float.parseFloat(Constants.MAX_LOAD_HALFTIME));
								}else{
									s.setFacultyType("Full Time");
									s.setMaxLoad(Float.parseFloat(Constants.MAX_LOAD_FULLTIME));
								}
							}
						}else{ //PREPARATION CHECKER
							s = new StringResponse("Max Preparation");
							s.setFacultyType(f.getFacultyType());
							s.setLastName(f.getLastName());
							s.setFirstName(f.getFirstName());
							s.setMaxPreparation(Integer.parseInt(Constants.MAX_PREPARATION));
						}
						/****************************FACULTY ASSIGNMENT PROPER******************************/
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} else { // create new loads id
					LoadDAO.addNewLoadsId(facultyId, startYear, endYear, term);
					
					// remove faculty from course if any (make faculty id = 1)
					String currentFacultyId = OfferingDAO.getFacultyIdUsingOfferingId(offeringId);
					if(!currentFacultyId.equals("1")) { // 1 - no professor, no need to decrement
						currentloadsId = LoadDAO.getLoadsId(currentFacultyId, startYear, endYear, term);		
						OfferingDAO.removeFacultyFromOffering(offeringId);
						FacultyDAO.decrementLoad(currentloadsId, units);
					}
					
					// faculty assignment proper
					loadsId = LoadDAO.getLoadsId(facultyId, startYear, endYear, term);
					FacultyDAO.assignFacultyToOffering(offeringId, facultyId); // assign the faculty id to offering id
					FacultyDAO.incrementLoad(loadsId, units);
					LoadDAO.updateFacultyPreparationCount(facultyId, startYear, endYear, term); //UPDATE PREPARATION COUNT
					System.out.println("Finished adding units to faculty!");
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else // the faculty is already assigned to the offering
			System.out.println("The faculty is already assigned to this offering!");

		return s; //StringResponse
	}

	@RequestMapping(value="/removeLoadFromFacultyCVC",method=RequestMethod.POST, produces ="application/json")
	public @ResponseBody StringResponse removeLoadFromFacultyCVC(
			@RequestParam("offeringId") String offeringId,
			@RequestParam("facultyId") String facultyId,
			@RequestParam("startYear") String startYear,
			@RequestParam("endYear") String endYear,
			@RequestParam("term") String term){
		
		StringResponse sr = new StringResponse("success");
		String loadsId ="";
		float units = 0;
		
		try {
			Offering o = OfferingDAO.getOfferingByID(offeringId);
			ArrayList<Offering> initialOfferingList = OfferingDAO.getListOfferingsByFaculty(facultyId, startYear, endYear, term);
			
			/****************************DECREASE PREPARATION COUNT******************************/
			int foundEquivalent = 0;
			
	        for(int j = 0; j < initialOfferingList.size(); j++){
	        	if(EquivalenceDAO.checkIfTwoCoursesAreEquivalent(initialOfferingList.get(j).getCourseId()+"", o.getCourseId()+"") == 1){
	        		foundEquivalent = 1;
	        	}
	        }
	        
	        if(foundEquivalent == 0) LoadDAO.decreaseFacultyPreparationCount(facultyId, startYear, endYear, term);
	        /****************************DECREASE PREPARATION COUNT******************************/
	        
	        OfferingDAO.removeFacultyFromOffering(offeringId);
			loadsId = LoadDAO.getLoadsId(facultyId, startYear, endYear, term);
			units = OfferingDAO.getNumberOfUnits(offeringId);
			FacultyDAO.decrementLoad(loadsId, units);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sr;
	}
	
	@RequestMapping(value="/populateCollegeDropdownCVC", method=RequestMethod.GET, produces="application/json")
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
	
	@RequestMapping(value="/populateDepartmentDropdownCVC", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<String> populateDepartmentsDropdown(
			@RequestParam("selectedCollege") String selectedCollege) {
		ArrayList<String> typeList = new ArrayList<String>();
		
		try {
			typeList = DepartmentDAO.getAllUniqueDepartmentsOfCollege(selectedCollege);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return typeList;
	}

	/*********************FACULTY RELATED METHODS****************************/
	
	
	
	
	/**************************GET LIST OF FACULTY*******************************/
	@RequestMapping(value="/getFacultyList", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<Faculty> getFacultyList(@RequestParam("term") String input) {
		String[] processed = input.split("-");
		String startYear = processed[0];
		String endYear = processed[1];
		String term = processed[2];
		
		try {
			listFaculty = FacultyDAO.getListFacultyByTerm(startYear, endYear, term);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listFaculty;
	}
	/**************************GET LIST OF FACULTY*******************************/
	/**************************GET LIST OF LOAD TIMEFRAME************************/
	@RequestMapping(value="/getLoadTimeframeList", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<Timeframe> getLoadTimeframe() {		
		if(listTimeframe.isEmpty()) {
			try {
				listTimeframe = LoadDAO.getLoadAY();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return listTimeframe;
	}
	/**************************GET LIST OF LOAD TIMEFRAME************************/

	/**************************GET LIST OF FACULTY LOAD*******************************/
	/* Get current load of a faculty for a specific term and school year */
	@RequestMapping(value="/getCurrentFacultyLoad", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<Offering> getCurrentFacultyLoad(
			@RequestParam("facultyId") int facultyId,
			@RequestParam("term") int term,
			@RequestParam("startYear") int startYear,
			@RequestParam("endYear") int endYear) {
		
		ArrayList<Offering> loadList = new ArrayList();
		try {
			loadList =  FacultyDAO.getCurrentFacultyLoad(facultyId, term, startYear, endYear);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return loadList;
		
	}
	
	@RequestMapping(value="/getCurrentFacultyLoadSpecific", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody Load getCurrentFacultyLoadSpecific(
			@RequestParam("facultyId") int facultyId,
			@RequestParam("startYear") int startYear,
			@RequestParam("endYear") int endYear,
			@RequestParam("term") int term) {
		
		Load facultyLoad = new Load();
		try {
			facultyLoad =  FacultyDAO.getCurrentFacultyLoadSpecific(facultyId, startYear, endYear, term);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return facultyLoad;
		
	}
	
	
	/* Get current course offerings for a term, this is arrange in faculty id ascending order (therefore, it shows the offerings with no faculty first) */
	@RequestMapping(value="/getCVCOfferings", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody ArrayList<Offering> getCVCOfferings(@RequestParam("term") String input) {
		String[] processed = input.split("-");
		String startYear = processed[0];
		String endYear = processed[1];
		String term = processed[2];
		
		try {
			listOffering = OfferingDAO.getListOfferingsByTermASC(startYear, endYear, term);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return listOffering;
	}
	/**************************GET LIST OF FACULTY LOAD*******************************/

	public static String removeSpaces(String s){
		s = s.replaceAll("\\s",""); 
		return s;
	}
}
