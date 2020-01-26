package com.redriver.dto;

import java.util.ArrayList;
import java.util.List;

public class Content {
private List<Student> students ;
	
	public Content() {
		students = new ArrayList<Student>();
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}
}
