package com.qna.vo;

public class Todo {
	
	private int id;
	private String todo;
	private String userId;
	private String writeDate; 
	private String endDate; 
	private char done;
	
	public Todo() {
	}

	public Todo(int id, String todo, String userId, String writeDate, String endDate, char done) {
		super();
		this.id = id;
		this.todo = todo;
		this.userId = userId;
		this.writeDate = writeDate;
		this.endDate = endDate;
		this.done = done;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTodo() {
		return todo;
	}

	public void setTodo(String todo) {
		this.todo = todo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public char getDone() {
		return done;
	}

	public void setDone(char done) {
		this.done = done;
	}

	@Override
	public String toString() {
		return "Todo [id=" + id + ", todo=" + todo + ", userId=" + userId + ", writeDate=" + writeDate
				+ ", endDate=" + endDate + ", done=" + done + "]";
	}

}
