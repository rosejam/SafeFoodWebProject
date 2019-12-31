package com.qna.dao;

import java.util.List;

import com.qna.vo.Todo;

public interface TodoDAO {

	boolean insertTodo(Todo todo);
	boolean updateTodo(Todo todo);
	boolean deleteTodo(int no);
	List<Todo> selectTodoList(String userId);
	Todo selectTodo(int no);
	List<Todo> allTodoList();
	
	boolean deleteTodoList(String userId);
	boolean updateTodoDone(int no);
}
