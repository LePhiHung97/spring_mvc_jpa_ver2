package com.phihung.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phihung.springmvc.entities.Course;
import com.phihung.springmvc.entities.Student;
import com.phihung.springmvc.entities.Users;
import com.phihung.springmvc.service.CourseService;
import com.phihung.springmvc.service.StudentService;
import com.phihung.springmvc.service.TeacherService;

@Controller
public class CourseController {

	@Autowired
	private CourseService courseService;

	@Autowired
	private StudentService studentService;
	
	@Autowired TeacherService teacherService;

	//Trả về danh sách khóa học
	@RequestMapping(value = "/list-course")
	public String getAllCourse(Model model, HttpSession session) {
		List<Course> listCourse = courseService.getAllCourse();
		System.out.println("list size " + listCourse.size());
		model.addAttribute("listCourse", listCourse);
		Users user = (Users) session.getAttribute("user");
		if(user.getRole().getRole_id() ==3)
			model.addAttribute("listCourseLearning",courseService.getCourseByStudentId(user.getStudent().getMasv()));
		session.setAttribute("user", user);
		return "list-course";
	}

	//Lấy thông tin khóa học theo mã
	@RequestMapping(value = "/course-detail/{course_id}")
	public String getCourseDetail(@PathVariable int course_id, Model model, HttpSession session) {
		List<Student> listStudent = courseService.getStudentByCourseId(course_id);
		Course course = courseService.getCourseById(course_id);
		Users user = (Users) session.getAttribute("user");
		session.setAttribute("user", user);
		model.addAttribute("listStudent", listStudent);
		model.addAttribute("course", course);
		return "course_detail";
	}

	//Lấy khóa học đang dạy của giảng viên
	@RequestMapping(value = "/list-course/teacher/{teacher_id}")
	public String getCourseByTeacherId(Model model, @PathVariable int teacher_id) {
		List<Course> list = courseService.getCourseByTeacherId(teacher_id);
		model.addAttribute("listCourse", list);
		return "list-course";
	}

	//Lấy khóa học đang học của sv
	@RequestMapping(value = "/list-course/student/{student_id}")
	public String getCourseByStudentJoin(Model model, @PathVariable int student_id) {
		List<Course> list = courseService.getCourseByStudentId(student_id);
		model.addAttribute("listCourse", list);
		boolean isCourseByStudent = true;
		model.addAttribute("isCourseByStudent",isCourseByStudent);
		return "list-course";
	}
	
	//SV Đăng kí tham gia khóa học
	@RequestMapping(value="/register-course/{course_id}/{student_id}")
	public String registerCourse(@PathVariable int course_id, @PathVariable int student_id,Model model) {
		courseService.registerCourseForStudent(student_id, course_id);
		
		return "success";
	}
	
	//Xóa khóa học
	@RequestMapping(value="/delete-course/{course_id}")
	public String deleteCourse(@PathVariable int course_id) {
		courseService.deleteCourse(course_id);		
		return "redirect:/list-course";
	}
	
	//Sửa khóa học - GET
	@RequestMapping(value="/update-course/{course_id}",method = RequestMethod.GET)
	public String updateCourse(@PathVariable int course_id, Model model) {
		Course course = courseService.getCourseById(course_id);
		model.addAttribute("listTeacher",teacherService.getAllTeacher());
		model.addAttribute("course", course);
		return "update-course";
	}

	// Sửa khóa học - POST
	@RequestMapping(value="/test", method = RequestMethod.POST)
	public String doUpdateCourse(@ModelAttribute("course") Course course, Model model) {
		/*
		 * courseService.update(course); System.out.println(course.getCourse_id() + "--"
		 * + course.getCourse_name() + "--" + course.getTeacher());
		 * model.addAttribute("listCourse", courseService.getAllCourse());
		 */
		System.out.println("sasdfsdfaf");
		return "success";
	}
	
	//Thêm khóa học - GET
	@RequestMapping(value="/save-course",method = RequestMethod.GET)
	public String saveCourse(Model model) {
		model.addAttribute("course", new Course());
		return "save-course";
	}
	
	
	
	

}
