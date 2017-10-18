package com.smith.servlet;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.smith.dao.FacultyDAO;
import com.smith.dao.LoadDAO;
import com.smith.dao.OfferingDAO;
import com.smith.model.Faculty;
import com.smith.model.Load;
import com.smith.model.Offering;
import com.smith.model.Timeframe;

@RestController
public class CVCController {
	private ArrayList<Faculty> listFaculty = new ArrayList();
	private ArrayList<Timeframe> listTimeframe = new ArrayList();
	private ArrayList<Offering> listOffering = new ArrayList();
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

}
