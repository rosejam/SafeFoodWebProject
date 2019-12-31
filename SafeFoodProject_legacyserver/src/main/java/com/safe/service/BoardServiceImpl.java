package com.safe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.safe.dao.BoardDao;
import com.safe.vo.Board;


//클라이언트(CustomerApp.java)가 getBean 해서 사용하는 객체 , 서비스객체 
//CustomerApp.java가 getBean()해 간 후에 메소드 호출해서 사용함  
@Service
public class BoardServiceImpl implements BoardService{
	@Autowired //주입기준은 타입 기준이다 
	BoardDao dao; //실제로 들어가는건 CustomerDaoImpl이 주입이된다. 
	
	public List<Board> selectAll() {
		return dao.selectAll();
	}
	
	public Board selectOne(String num) {
		dao.update2(num);
		return dao.selectOne(num);
	}

	public void insert(Board c) {
		dao.insert(c);
		
	}

	public void delete(String num) {
		dao.delete(num);
		
	}

	public List<Board> findByTitle(String title) {
		return dao.findByTitle(title);
	}

	public List<Board> findByName(String name) {
		return dao.findByName(name);
	}

	public void update(String num, String title, String name, String content) {
		Board b = new Board(num, null, name, null, title, content, null);
		dao.update(b);
	}

	




	
	
	
}
