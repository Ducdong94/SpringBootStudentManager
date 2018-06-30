package com.seatech.student_manager.controller;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.seatech.student_manager.entity.Student;
import com.seatech.student_manager.model.StudentModel;

@Controller
public class StudentController {
	@Autowired
	StudentModel studentModel;

	@RequestMapping(path = {"/{locale:en|fr|vi}","/"}, method = RequestMethod.GET)
	public String getListStudent(Model model, @RequestParam(defaultValue = "") String export,
			HttpServletResponse response) {
		List<Student> Students = (List<Student>) studentModel.findAll();	
		model.addAttribute("Students", Students);
		if (!export.isEmpty()) {
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment; filename=list_student.xls");
			try {
				System.out.println("param - " + export);
				OutputStream os = response.getOutputStream();
				ExportExcelStudents.generate(Students).write(os);
				os.flush();
				os.close();
			} catch (Exception e) {
				System.err.println("err: " + e.getMessage());
			}
			return "manager/index";
		}
		return "manager/index";
	}

	@RequestMapping(path = {"/create","/{locale:en|fr|vi}/create"}, method = RequestMethod.GET)
	public String getCreateForm() {
		return "manager/create";
	}

	@RequestMapping(path = "/create", method = RequestMethod.POST)
	public String createStudent(@Valid Student student, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			System.out.print("err");
			return "manager/create";
		}
		student.setCreatedAt(System.currentTimeMillis());
		student.setUpdatedAt(student.getCreatedAt());
		student.setStatus(1);
		System.out.print(student.getName() + "created");
		studentModel.save(student);
		return "redirect:/";
	}

	@RequestMapping(path = {"/{locale:en|fr|vi}/edit/{rollNumber}","/edit/{rollNumber}"}, method = RequestMethod.GET)
	public String getEditForm(@PathVariable String rollNumber, Model model) {
		Optional<Student> optStudent = studentModel.findById(rollNumber);
		if (optStudent.isPresent()) {
			model.addAttribute("student", optStudent.get());
			return "manager/edit";
		}
		return "error/notfound";
	}

	@RequestMapping(path = "/edit/{rollNumber}", method = RequestMethod.POST)
	public String updateStudent(@Valid Student student, BindingResult bindingResult) {

		if (bindingResult.hasErrors()) {
			return "manager/edit";
		}
		if (!studentModel.findById(student.getRollNumber()).isPresent()) {
			return "error/notfound";
		}
		student.setUpdatedAt(System.currentTimeMillis());
		System.out.println(student.toString());
		studentModel.save(student);
		return "redirect:/";
	}

	@RequestMapping(path = "/delete/{rollNumber}", method = RequestMethod.GET)
	public ResponseEntity getDeleteConfirm(@PathVariable String rollNumber) {
		if (studentModel.existsById(rollNumber)) {
			studentModel.deleteById(rollNumber);
			return new ResponseEntity(HttpStatus.OK);
		}
		return new ResponseEntity(HttpStatus.BAD_REQUEST);
	}
}
