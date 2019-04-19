package com.phihung.springmvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.phihung.springmvc.entities.Teacher;
import com.phihung.springmvc.service.TeacherService;

@Controller
public class TeacherController {

	@Autowired
	private TeacherService teacherService;

	@RequestMapping(value = "/list-teacher")
	public String getAllTeacher(Model model) {
		model.addAttribute("teachers", teacherService.getAllTeacher());
		model.addAttribute("nameURLPagination", "list-teacher");
		return "list-teacher";
	}

	@RequestMapping(value = "/processExcel", method = RequestMethod.POST)
	public String processExcel(Model model, @RequestParam("excelfile") MultipartFile excelfile) {
		try {
			List<Teacher> lstTeacher = new ArrayList<Teacher>();
			int i = 0;
			// Creates a workbook object from the uploaded excelfile
			HSSFWorkbook workbook = new HSSFWorkbook(excelfile.getInputStream());
			// Creates a worksheet object representing the first sheet
			HSSFSheet worksheet = workbook.getSheetAt(0);
			// Reads the data in excel file until last row is encountered
			while (i <= worksheet.getLastRowNum()) {
				// Creates an object for the UserInfo Model
				Teacher teacher = new Teacher();
				// Creates an object representing a single row in excel
				HSSFRow row = worksheet.getRow(i++);
				// Sets the Read data to the model class
				teacher.setTeacher_id((int) row.getCell(0).getNumericCellValue());
				teacher.setTeacher_name(row.getCell(1).getStringCellValue());

				// persist data into database in here
				lstTeacher.add(teacher);
			}
			workbook.close();
			model.addAttribute("lstTeacher", lstTeacher);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "list-test";
	}
	
	@RequestMapping(value="import-exel",method = RequestMethod.GET)
	public String exel() {
		return "import-exel";
	}
}