package com.safe.service;

import java.util.ArrayList;

import com.safe.vo.Member;

public interface MemberService {

	void insert(Member m);
	//void update(String id, String alergy);
	void update(Member m);
	void delete(String id);
	public int check(String id, String pass);
	ArrayList<String> searchMyFood(String id);
	ArrayList<String> searchAlergy(String id);
	//void updateFood(String id, String foods);
	int idcheck(String id);
	void updateFood(Member m);
	double getmycal(String id);
	Member searchMyPage(String id);

}
