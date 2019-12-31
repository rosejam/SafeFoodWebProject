package com.qna.vo;

public class QnA {
	private int num;
	private String title;
	private String writer;
	private String wdate;
	private String question;
	private String answer;
	
	
	
	public QnA() {
	}

	public QnA(int num, String title, String writer, String wdate, String question, String answer) {
		this.num = num;
		this.title = title;
		this.writer = writer;
		this.wdate = wdate;
		this.question = question;
		this.answer = answer;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "QnA [num=" + num + ", title=" + title + ", writer=" + writer + ", wdate=" + wdate + ", question="
				+ question + ", answer=" + answer + "]";
	}
	
	
	
}
