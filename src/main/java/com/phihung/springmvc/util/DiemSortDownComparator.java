package com.phihung.springmvc.util;

import java.util.Comparator;

import com.phihung.springmvc.entities.Student;


public class DiemSortDownComparator implements Comparator<Student> {

	public int compare(Student s1, Student s2) {
		if(s1.getDiem()==s2.getDiem())  
			return 0;  
		else if(s1.getDiem()>s2.getDiem())  
		return 1;  
	else  
		return -1;  
	}  

	

}
