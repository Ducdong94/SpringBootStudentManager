package com.seatech.student_manager.model;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.seatech.student_manager.entity.Student;

public interface StudentModel extends PagingAndSortingRepository<Student, String>{

}