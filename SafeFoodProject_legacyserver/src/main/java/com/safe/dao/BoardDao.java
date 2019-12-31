package com.safe.dao;

import java.util.List;

import com.safe.vo.Board;
//client 를 위한 인터페이스 
public interface BoardDao {
	public List<Board> selectAll();
	public Board selectOne(String num);
	public void insert(Board b);
	public void delete(String num);
	public List<Board> findByTitle(String title);
	public List<Board> findByName(String name);
	public void update(Board b);
	public void update2(String num);
}
