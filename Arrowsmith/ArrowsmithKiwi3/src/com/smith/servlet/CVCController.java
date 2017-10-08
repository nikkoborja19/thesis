package com.smith.servlet;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.smith.dao.CollegeDAO;
import com.smith.dao.DepartmentDAO;
import com.smith.dao.FacultyDAO;
import com.smith.dao.LoadDAO;
import com.smith.dao.OfferingDAO;
import com.smith.model.College;
import com.smith.model.Department;
import com.smith.model.Faculty;
import com.smith.model.Offering;
import com.smith.model.StringResponse;
import com.smith.model.Timeframe;

@RestController
public class CVCController {
	private ArrayList<Faculty> listFaculty = new ArrayList();
	private ArrayList<Timeframe> listTimeframe = new ArrayList();
	/****************************************************************************/
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
				//System.out.println("COLLEGE: "+ c.getCollegeName());
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
	public static String removeSpaces(String s){
		s = s.replaceAll("\\s",""); 
		return s;
	}
}
