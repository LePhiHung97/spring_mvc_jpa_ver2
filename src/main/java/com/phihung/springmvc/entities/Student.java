package com.phihung.springmvc.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "student")
public class Student implements java.io.Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "masv")
	private int masv;

	@Column(name = "hoten")
	private String hoten;

	@Column(name = "namsinh")
	private int namsinh;

	@Column(name = "lop")
	private String lop;

	@Column(name = "diem")
	private double diem;

	@Column(name = "numorder")
	private int numorder;

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "enroll", catalog = "studentdb", joinColumns = {
			@JoinColumn(name = "masv", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "course_id", nullable = false, updatable = false) })
	private List<Course> courses;
	
	

	@OneToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", referencedColumnName = "user_id", insertable = false, updatable = false, nullable=false)
	private Users users_student;

	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}

	public int getNumorder() {
		return numorder;
	}

	public void setNumorder(int numorder) {
		this.numorder = numorder;
	}

	public int getMasv() {
		return masv;
	}

	public void setMasv(int masv) {
		this.masv = masv;
	}

	public int getNamsinh() {
		return namsinh;
	}

	public void setNamsinh(int namsinh) {
		this.namsinh = namsinh;
	}

	public String getHoten() {
		return hoten;
	}

	public void setHoten(String hoten) {
		this.hoten = hoten;
	}

	public String getLop() {
		return lop;
	}

	public void setLop(String lop) {
		this.lop = lop;
	}

	public double getDiem() {
		return diem;
	}

	public void setDiem(double diem) {
		this.diem = diem;
	}

	@Override
	public String toString() {
		return this.masv + " - " + this.getHoten() + " - " + this.getNamsinh() + " - " + this.getLop() + " - "
				+ this.getDiem();
	}

}
