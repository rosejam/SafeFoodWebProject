package com.safe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.safe.dao.QnADao;
import com.safe.vo.QnA;

@Service
public class QnAServiceImpl implements QnAService{
	@Autowired
	QnADao dao;
	
	@Override
	public List<QnA> selectAll() {
		System.out.println(dao.selectAll());
		return dao.selectAll();
	}

	@Override
	public QnA findQuestionById(int id) {
		return dao.findQuestionById(id);
	}

	@Override
	public List<QnA> findLikeTitles(String name) {
		return dao.findLikeTitles(name);
	}

	@Override
	public boolean addQuestion(QnA c) {
		return dao.addQuestion(c);
	}

	@Override
	public boolean addAnswer(QnA c) {
		return dao.addAnswer(c);
	}

	@Override
	public boolean updateQuestion(QnA c) {
		return dao.updateQuestion(c);
	}

	@Override
	public boolean deleteQuestion(String id) {
		return dao.deleteQuestion(id);
	}

}
