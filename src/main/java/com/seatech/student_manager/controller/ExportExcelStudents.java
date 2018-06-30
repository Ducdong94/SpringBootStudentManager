package com.seatech.student_manager.controller;

import java.util.List;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.seatech.student_manager.entity.Student;

public class ExportExcelStudents {

	public static XSSFWorkbook generate(List<Student> Students) {
		XSSFWorkbook workbook = new XSSFWorkbook();
		try {
			XSSFSheet sheet = workbook.createSheet("sheet1");
			Row header = sheet.createRow(0);
			header.createCell(0).setCellValue("ROLLNUMBER");
			header.createCell(1).setCellValue("NAME");
			header.createCell(2).setCellValue("AGE");
			header.createCell(3).setCellValue("CLASS");
			header.createCell(4).setCellValue("EMAIL");
			header.createCell(5).setCellValue("PHONE");
			header.createCell(6).setCellValue("STATUS");

			int rownum = 1;

			for (Student stu : Students) {
				Row row = sheet.createRow(rownum++);
				row.createCell(0).setCellValue(stu.getRollNumber());
				row.createCell(1).setCellValue(stu.getName());
				row.createCell(2).setCellValue(stu.getAge());
				row.createCell(3).setCellValue(stu.getClassRoom());
				row.createCell(4).setCellValue(stu.getEmail());
				row.createCell(5).setCellValue(stu.getPhone());
				row.createCell(6).setCellValue(stu.getStatus());
			}
		} catch (Exception e) {
			System.err.println("err - " + e.getMessage());
		} finally {
			return workbook;
		}
	}
}
