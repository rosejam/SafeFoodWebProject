package com.qna.dao;

import java.util.List;

import com.qna.vo.QnA;

public interface QnADao {
	public List<QnA> selectAll();
	public QnA findQuestionById(int id);
	public List<QnA> findLikeTitles(String name);
	public boolean addQuestion(QnA c);
	public boolean addAnswer(QnA c);
	public boolean updateQuestion(QnA c);
	public boolean deleteQuestion(String id);
}
