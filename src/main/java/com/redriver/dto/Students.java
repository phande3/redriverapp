package com.redriver.dto;

import java.util.ArrayList;
import java.util.List;

public class Students  {
	/**
	 * 
	 */
	private List<Student> students ;
	
	public Students() {
		students = new ArrayList<Student>();
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}
} 
