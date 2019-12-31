package com.safe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.safe.vo.QnA;

@Repository
public class QnADaoImpl implements QnADao{
	
	@Autowired
	SqlSession session;
	
	@Override
	public List<QnA> selectAll() {
		return session.selectList("selectqna");
	}

	@Override
	public QnA findQuestionById(int id) {
		return session.selectOne("selectId", id);
	}

	@Override
	public List<QnA> findLikeTitles(String title) {
		return session.selectList("selectTitle", title);
	}

	@Override
	public boolean addQuestion(QnA c) {
		return session.insert("insertQuestion", c) > 0;
	}

	@Override
	public boolean addAnswer(QnA answer) {
		return session.update("insertAnswer", answer) > 0;
	}

	@Override
	public boolean updateQuestion(QnA c) {
		return session.update("updateQuestion", c) > 0;
	}

	@Override
	public boolean deleteQuestion(String num) {
		int s = Integer.parseInt(num);
		return session.delete("deleteqna", s) >0;
	}

}
