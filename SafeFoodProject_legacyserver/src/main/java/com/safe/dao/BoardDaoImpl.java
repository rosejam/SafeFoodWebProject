package com.safe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.safe.vo.Board;
@Repository("ddao") //생성되는 객체의 역할이 무엇인지 표시해주는 방법 
public class BoardDaoImpl implements BoardDao {
	@Autowired
	SqlSession session;
	
	public List<Board> selectAll() {
		return session.selectList("board.selectAll");
	}

	public Board selectOne(String num) {
		return session.selectOne("board.selectOne",num);
	}

	public void insert(Board c) {
		session.insert("board.insert", c);
	}

	public void delete(String num) {
		session.delete("board.delete", num);		
	}

	public List<Board> findByTitle(String title) {
		return session.selectList("board.findTitle", title);
	}

	public List<Board> findByName(String name) {
		return session.selectList("board.findName", name);
	}

	public void update(Board b) {
		session.update("board.update", b);
		
	}

	public void update2(String num) {
		session.update("board.update2", num);
	}

	

}
