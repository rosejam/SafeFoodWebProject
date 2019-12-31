package com.safe.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.safe.vo.Board;

//client(BoardApp.java)를 위한 인터페이스

public interface BoardService {
	public List<Board> selectAll();
	
	@Transactional
	public Board selectOne(String num) throws Exception;
	
	public void insert(Board c);
	public void delete(String num);
	public List<Board> findByTitle(String title);
	public List<Board> findByName(String name);
	public void update(String num, String title, String name,String content);
}
