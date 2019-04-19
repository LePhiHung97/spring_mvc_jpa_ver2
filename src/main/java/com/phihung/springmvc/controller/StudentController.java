package com.phihung.springmvc.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.phihung.springmvc.entities.Student;
import com.phihung.springmvc.entities.Users;
import com.phihung.springmvc.service.StudentService;
import com.phihung.springmvc.service.UserService;
import com.phihung.springmvc.util.DiemSortDownComparator;
import com.phihung.springmvc.util.DiemSortUpComparator;

@Controller
public class StudentController {

	@Autowired
	private StudentService studentService;

	int total = 5;
	
	// DS sinh viên
	@RequestMapping(value = "/listStudent")
	public String Default(Model model, HttpSession session) {
		session.invalidate();
		List<Student> listStudent = studentService.getAllSortByOrder();
		model.addAttribute("listStudent", listStudent);
		return "listStudent";
	}

	// Lưu chèn thứ tự - GET
	@RequestMapping(value = "/save-custom-student/{order}", method = RequestMethod.GET)
	public String insertCustomStudent(Model model, @PathVariable Integer order) {
		model.addAttribute("student", new Student());
		model.addAttribute("order", order);
		return "save-student";
	}

	// Lưu chèn thứ tự - POST
	@RequestMapping(value = "/save-custom-student/{order}", method = RequestMethod.POST)
	public String doInsertCustomStudent(@ModelAttribute("Student") Student student, Model model,
			@PathVariable Integer order) {
		studentService.insertByOrder(student, order);
		model.addAttribute("listStudent", studentService.getAllSortByOrder());
		return "redirect:/listStudent/1";
	}

	// Lưu - GET
	@RequestMapping(value = "/save-student", method = RequestMethod.GET)
	public String addStudent(Model model) {
		model.addAttribute("student", new Student());
		return "save-student";
	}

	// Lưu - POST
	@RequestMapping(value = "/save-student", method = RequestMethod.POST)
	public String doInsertStudent(@ModelAttribute("Student") Student student, Model model) {
		studentService.save(student);
		model.addAttribute("listStudent", studentService.findAll());
		return "redirect:/listStudent/1";
	}

	// Sửa - POST
	@RequestMapping("/update-student/{masv}")
	public String updateStudent(@PathVariable int masv, Model model) {
		Student student = studentService.findById(masv);
		model.addAttribute("student", student);
		return "update-student";
	}

	// Sửa - GET
	@RequestMapping(value = "/update-student", method = RequestMethod.POST)
	public String doUpdateStudent(@ModelAttribute("Student") Student student, Model model) {
		studentService.update(student);
		model.addAttribute("listStudent", studentService.getAllSortByOrder());
		return "redirect:/listStudent/1";
	}

	// Xóa
	@RequestMapping(value = "/delete-student/{masv}")
	public String doDeleteStudent(@PathVariable int masv, Model model) {
		boolean isDeleteSuccess = studentService.delete(masv);
		if (isDeleteSuccess) {
			model.addAttribute("listStudent", studentService.getAllSortByOrder());
			return "redirect:/listStudent/1";
		} else
			return "error";
	}

	// Tìm kiếm
	@RequestMapping(value = "/search-student")
	public String doSearch(@RequestParam("hoten") String hoten, Model model, HttpSession session) {
		List<Student> listStudent = studentService.getListStudentByName(hoten);

		if (!hoten.trim().isEmpty() || hoten.length() != 0)
			session.setAttribute("hoten", hoten);
		else
			return "redirect:/listStudent/1";

		model.addAttribute("listStudent", listStudent);
		return "search";
	}

	@RequestMapping(value = "/listStudent/sort-up")
	public String doSortUp(Model model, HttpSession session) {
		String hoten = (String) session.getAttribute("hoten");
		if (hoten == null) {
			/* List<Student> listAll = studentService.getStudentByPage(pageid, total); */
			List<Student> list = studentService.getAllSortByOrder();
			Collections.sort(list, new DiemSortUpComparator());
			model.addAttribute("listStudent", list);
		} else {
			List<Student> listSearch = studentService.getListStudentByName(hoten);
			Collections.sort(listSearch, new DiemSortUpComparator());
			model.addAttribute("listStudent", listSearch);
		}
		return "listStudent";
	}

	// Sắp xếp
	@RequestMapping(value = "/listStudent/sort-down")
	public String doSortDown(Model model, HttpSession session) {
		String hoten = (String) session.getAttribute("hoten");
		if (hoten == null) {
			/* List<Student> listAll = studentService.getStudentByPage(pageid, total); */
			List<Student> list = studentService.getAllSortByOrder();
			Collections.sort(list, new DiemSortDownComparator());
			model.addAttribute("listStudent", list);
		} else {
			List<Student> listSearch = studentService.getListStudentByName(hoten);
			Collections.sort(listSearch, new DiemSortDownComparator());
			model.addAttribute("listStudent", listSearch);
		}
		return "listStudent";
	}

	// Tìm rồi sắp xếp
	@RequestMapping(value = "/search-student/{hoten}/{typesort}")
	public String doSortAfterSearch(Model model, @PathVariable String typesort, HttpSession session) {
		String hoten = (String) session.getAttribute("hoten");
		if (hoten == null) {
			List<Student> list = studentService.getAllSortByOrder();
			if (typesort.equals("sort-up"))
				Collections.sort(list, new DiemSortUpComparator());
			else if (typesort.equals("sort-down"))
				Collections.sort(list, new DiemSortDownComparator());

			model.addAttribute("listStudent", list);
		} else {
			List<Student> listSearch = studentService.getListStudentByName(hoten);
			if (typesort.equals("sort-up"))
				Collections.sort(listSearch, new DiemSortUpComparator());
			else if (typesort.equals("sort-down"))
				Collections.sort(listSearch, new DiemSortDownComparator());

			model.addAttribute("listStudent", listSearch);
		}
		return "listStudent";
	}

	// Chỉ phân trang
	@RequestMapping(value = "/listStudent/{pageid}")
	public String viewListStudentPagination(@PathVariable int pageid, Model model) {
		if (pageid == 1) {
		} else {
			pageid = (pageid - 1) * total + 1;
		}
		List<Student> listStudent = studentService.getStudentByPage(pageid, total);
		model.addAttribute("listStudent", listStudent);
		return "listStudent";
	}

	// Sắp xếp rồi phân trang
	@RequestMapping(value = "/listStudent/{typesort}/{pageid}")
	public String doSortAndPagination(Model model, @PathVariable String typesort, @PathVariable int pageid) {
		if (pageid == 1) {
		} else {
			pageid = (pageid - 1) * total + 1;
		}
		List<Student> list = null;
		list = studentService.getStudentByPageAfterSort(typesort, pageid, total);

		model.addAttribute("listStudent", list);
		return "listStudent";
	}
	
	
	

}
