package com.seatech.student_manager.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
public class Student {
	@Id
	private String rollNumber;
	@NotNull
	@Size(min = 8, message = "name must greater than 7 character")
	private String name;
	@Min(18)
	@Max(60)
	private int age;
	private String classRoom;
	private String email;
	private String phone;
	private long createdAt;
	private long updatedAt;
	private int status;

	public Student() {
	}

	public Student(String rollNumber, String name, int age, String email, String phone) {
		this.rollNumber = rollNumber;
		this.name = name;
		this.age = age;
		this.email = email;
		this.phone = phone;
		this.createdAt = System.currentTimeMillis();
		this.updatedAt = this.createdAt;
		this.status = 1;
	}

	public String getClassRoom() {
		return classRoom;
	}

	public void setClassRoom(String classRoom) {
		this.classRoom = classRoom;
	}

	public String getRollNumber() {
		return rollNumber;
	}

	public void setRollNumber(String rollNumber) {
		this.rollNumber = rollNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public long getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(long createdAt) {
		this.createdAt = createdAt;
	}

	public long getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(long updatedAt) {
		this.updatedAt = updatedAt;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "roll: "+this.rollNumber
				+"\nName: "+ this.name
				+"\nAge: "+ this.age
				+"\nEmail: "+ this.email
				+"\nPhone: "+this.phone
				+"\nStatus: "+ this.status;
	}
	
	
	
}
