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
import com.smith.model.Faculty;
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
}
