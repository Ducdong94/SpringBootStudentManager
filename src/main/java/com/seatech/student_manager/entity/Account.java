package com.seatech.student_manager.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

@Entity
public class Account {
	@Id
	private String username;
	@NotNull
	private String password;
	private long createdAt;
	private long updatedAt;
	private int status;

	public Account() {
	}

	public Account(String username, String password) {
		this.username = username;
		this.password = password;
		this.createdAt = System.currentTimeMillis();
		this.updatedAt = this.createdAt;
		this.status = 1;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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
}