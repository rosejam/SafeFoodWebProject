package com.safe.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.StringTokenizer;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.safe.vo.Member;

@Repository
public class MemberDAO implements IMember {
	@Autowired
	SqlSession session;

//회원 수정
	/*
	 * @Override public void update(String id, String alergy) { HashMap<String,
	 * String> map = new HashMap<>(); map.put("id", id); map.put("alergy", alergy);
	 * session.update("Member.update", map); }
	 */

	@Override
	public void update(Member m) {
		session.update("Member.update", m);
	}
//탈퇴
	@Override
	public void delete(String id) {
		session.delete("Member.delete", id);
	}

	@Override
	public void insert(Member m) {
		session.insert("Member.insert", m);
	}

	@Override
	//public void updateFood(String id, String foods) {
	public void updateFood(Member m) {
//		HashMap<String, String> map = new HashMap<>();
//		map.put("id", id);
//		map.put("foods", foods);
//		session.update("Member.updateFood", map);
		session.update("Member.updateFood", m);
	}

	public int check(String id, String pass) {
		int ch = 0;
		try {
			Member m = session.selectOne("Member.check", id);
			if (m != null) {
				ch = 1; // 아이디 있음
				if (m.getPass().equals(pass)) {
					ch = 2; // 로그인가능
				}
			}else {
				ch =3; //아이디없음
			}
		} catch (Exception e) {
			ch = -1;
		} finally {

		}
		return ch;

	}

	public int idcheck(String id) {
		Member m = session.selectOne("Member.check", id);
		if (m == null) {
			return 0; // 존재하지 않음
		} else {
			return 1; // 존재함
		}

	}
	@Override
	public ArrayList<String> searchMyFood(String id) { // 중복 제거용 셋은 필요없음!
		ArrayList<String> list = new ArrayList<>();
		// HashSet<String> set = new HashSet<>();
		Member m = session.selectOne("Member.select", id);
		if (m.getMyfood() != null) {
			StringTokenizer st = new StringTokenizer(m.getMyfood(), " ");
			// while(st.hasMoreTokens()) {
			// set.add(st.nextToken());
			// }
			while (st.hasMoreTokens()) {
				list.add(st.nextToken());
			}
		}
		// list = new ArrayList<>(set);
		return list;
	}

	public ArrayList<String> searchAlergy(String id) {
		ArrayList<String> list = new ArrayList<>();
		Member m = session.selectOne("Member.select", id);
		if (m.getAlergy() != null) {
			StringTokenizer st = new StringTokenizer(m.getAlergy(), " ");
			while (st.hasMoreTokens()) {
				list.add(st.nextToken());
			}
		}
		return list;
	}
	@Override
	public double getmycal(String id) {
		Member m = session.selectOne("Member.check", id);
		return m.getMycal();
	}
	@Override
	public Member searchMyPage(String id) {
		//Member m = 
		return session.selectOne("Member.select" , id);
	}


}
