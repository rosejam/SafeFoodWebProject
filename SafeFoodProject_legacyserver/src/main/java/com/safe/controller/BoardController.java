package com.safe.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.safe.service.BoardService;
import com.safe.vo.Board;

@Controller
public class BoardController {
		 	 
	/*
	 * @ExceptionHandler public ModelAndView handler(Exception e) { ModelAndView mav
	 * = new ModelAndView("ErrorHandler"); mav.addObject("msg", e.getMessage());
	 * return mav; }
	 */
	 
	 @Autowired
	 BoardService service;
	 
	 @GetMapping("/listBoard.do")
	 public String boardList(Model model) {
		List<Board> list = service.selectAll();
		//Model : map구조로 데이터를 저장하고 view에서 꺼내서 쓸수 있음 
		model.addAttribute("list", list);
		 return "listBoard";
	 }
	 
	 @GetMapping("/detail.do")
	 public String detail(String num,String search, String searchtext, Model model) {
		 Board b = null;
		try {
			b = service.selectOne(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 model.addAttribute("b", b);
		 model.addAttribute("text", searchtext);
		 model.addAttribute("search", search);
		 return "boardDetail";
	 }
	 
	 @GetMapping("/searchBoard.do")
	 public String searchBoard(String search, String searchtext, Model model) {
		 if(search.equals("name")) {
			 List<Board> list = service.findByName(searchtext);
			 model.addAttribute("list", list);
			 model.addAttribute("text", searchtext);
			 model.addAttribute("search", search);
			
		 }else {
			 List<Board> list = service.findByTitle(searchtext);
			 model.addAttribute("list", list);
			 model.addAttribute("text", searchtext);
			 model.addAttribute("search", search);
			
		 }
		 return "searchBoard";
	 }
	 
	 @GetMapping("/insertBoardForm.do")
	 public String insertBoardForm(Board b) {
		 return "boardInsert";
	 }
	 
	 @PostMapping("/boardInsert.do")
	 public String insertBoard(Board b) {
		 service.insert(b);
		 return "redirect:/listBoard.do";
	 }

	 @GetMapping("/deleteBoard.do")
	 public String deleteBoard(String num) {
		 service.delete(num);
		 return "redirect:/listBoard.do";
	 }
	 
	 @GetMapping("/updateForm.do")
	 public String updateForm(String num, String title, String name, String content,  Model model) {
		 model.addAttribute("num", num);
		 model.addAttribute("title", title);
		 model.addAttribute("name", name);
		 model.addAttribute("content", content);
		 return "boardUpdate";
	 }
	 
	 @PostMapping("/boardUpdate.do")
	 public String updateBoard(String num, String title, String name ,String content,  Model model) {
		 Board b = null;
		try {
			b = service.selectOne(num);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 if(b.getTitle().equals(title) && b.getName().equals(name) && b.getContent().equals(content)) {
			 model.addAttribute("b", b);
			 return "boardDetail";
		 }
		 else {
			 service.update(num, title, name, content);
			 Board c = null;
			 try {
				 c = service.selectOne(num);
				 
			 } catch (Exception e) {
				 // TODO Auto-generated catch block
				 e.printStackTrace();
			 }
			 model.addAttribute("b", c);
			 return "boardDetail";
		 }
	 }
	 
	 
}





