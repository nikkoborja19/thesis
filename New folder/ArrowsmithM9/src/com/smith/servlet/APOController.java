package com.smith.servlet;

import java.io.FileWriter;
import java.io.IOException;
import java.io.FileWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.smith.dao.OfferingDAO;
import com.smith.model.Offering;

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
		List<Offering> offerings = new ArrayList();
		FileWriter fw;
		
		try {
			offerings = OfferingDAO.getListOfferingsByTerm("2016", "2017", "1");
			Gson gson = new Gson();
			gson.toJson(offerings, new FileWriter("D:\\Toolbox\\eclipse\\jgson.txt"));
		
		} catch (SQLException | JsonIOException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		System.out.println("JSON: " + obj);
		
		ModelAndView mav = new ModelAndView("manageCourseOfferings");
		mav.addObject("offeringList", offerings);
		
		return mav;
	}
}
