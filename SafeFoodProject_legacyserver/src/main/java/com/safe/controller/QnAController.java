
package com.safe.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.safe.service.QnAService;
import com.safe.vo.QnA;

@CrossOrigin(origins = { "*" }, maxAge = 6000) 
@RestController
  //@Api("TodoList Rest API") 
	public class QnAController {
  
  @Autowired 
  QnAService service;
  
  @RequestMapping(value = "/list", method = RequestMethod.GET) public List<QnA>selectAll() throws Exception { //QnA 모든정보
  return service.selectAll(); 
  }
  
  
  @RequestMapping(value = "/list/id/{num}", method = RequestMethod.GET) public
  QnA findQuestionById(@PathVariable String num) throws Exception { //id로 QnA찾기
  int x = Integer.parseInt(num); QnA a = service.findQuestionById(x); return
  service.findQuestionById(x); }
  
  
  @RequestMapping(value = "/list/name/{name}", method = RequestMethod.GET)
  public List<QnA> findLikeTitles(@PathVariable String name) throws Exception {
   return service.findLikeTitles(name); }
  
  @RequestMapping(value = "/add/question", method = RequestMethod.POST) public
  Map addQuestion(@RequestBody QnA c) throws Exception { //질문 추가하기 
	  boolean t =
  service.addQuestion(c); HashMap<String, String> map = new HashMap(); if(t) {
  map.put("result", "추가성공"); }else { map.put("result", "추가실패"); } return map; }
  
  @RequestMapping(value = "/add/answer", method = RequestMethod.PUT) public Map
  addAnswer(@RequestBody QnA c) throws Exception { //답변 추가하기 
	  boolean t =
  service.addAnswer(c); HashMap<String, String> map = new HashMap(); if(t) {
  map.put("result", "추가성공"); }else { map.put("result", "추가실패"); } return map; }
  
  @RequestMapping(value = "/question/update", method = RequestMethod.PUT)
  public Map updateQuestion(@RequestBody QnA c) throws Exception { //질문 수정하기
  boolean t = service.updateQuestion(c); HashMap<String, String> map = new
  HashMap(); if(t) { map.put("result", "수정성공"); }else { map.put("result",
  "수정실패"); } return map; }
  
  @RequestMapping(value = "/question/delete/{num}", method =
  RequestMethod.DELETE) public Map deleteQuestion(@PathVariable String num)
  throws Exception { //질문 삭제하기
	  boolean t = service.deleteQuestion(num);
  HashMap<String, String> map = new HashMap(); if(t) { map.put("result",
  "삭제성공"); }else { map.put("result", "삭제실패"); } return map; }
  
  
  
  
  }
