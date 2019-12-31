package com.qna.service;

import java.util.List;

import com.qna.vo.Todo;

public interface TodoService {
	boolean addTodo(Todo todo);
	boolean modifyTodo(Todo todo);
	boolean removeTodo(int no);
	List<Todo> findTodoList(String userId);
	List<Todo> allTodoList();
	Todo findTodo(int no);
	
	boolean removeTodoList(String userId);
	boolean completeTodo(int no);
}
