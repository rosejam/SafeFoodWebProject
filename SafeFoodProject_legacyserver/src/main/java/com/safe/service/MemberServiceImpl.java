package com.safe.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.safe.dao.IMember;
import com.safe.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	IMember dao;
	
	@Override
	public void insert(Member m) {
		dao.insert(m);
	}

	/*
	 * @Override public void update(String id, String alergy) { dao.update(id,
	 * alergy); }
	 */

	@Override
	public void update(Member m) {
		dao.update(m);
	}
	
	@Override
	public void delete(String id) {
		dao.delete(id);
	}

	@Override
	public int check(String id, String pass) {
		return dao.check(id, pass);
	}

	@Override
	public ArrayList<String> searchMyFood(String id) {
		return dao.searchMyFood(id);
	}

	@Override
	public ArrayList<String> searchAlergy(String id) {
		return dao.searchAlergy(id);
	}

	/*
	 * @Override public void updateFood(String id, String foods) {
	 * dao.updateFood(id, foods); }
	 */
	@Override
	public void updateFood(Member m) {
		dao.updateFood(m);
	}

	@Override
	public int idcheck(String id) {
		return dao.idcheck(id);
	}

	@Override
	public double getmycal(String id) {
		return dao.getmycal(id);
	}

	@Override
	public Member searchMyPage(String id) {
		return dao.searchMyPage(id);
	}
	
}
