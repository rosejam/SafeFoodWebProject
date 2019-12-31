package com.safe.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.safe.dao.ISafeFood;
import com.safe.vo.Food;
import com.safe.vo.FoodPageBean;
import com.safe.vo.Pagination;

@Service
public class SafeFoodServiceImpl implements SafeFoodService {
	
	
	@Autowired
	ISafeFood dao;
	
	public int foodCount(FoodPageBean bean) {
		return dao.foodCount(bean);
	}

	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 식품 정보(Food)를 검색해서 반환.
	 * 
	 * @param bean 검색 조건과 검색 단어가 있는 객체
	 * @return 조회한 식품 목록
	 */
	public ArrayList<Food> searchAll(FoodPageBean bean) { //검색!!
		return dao.searchAll(bean);
	}
/*	public ArrayList<Food> searchID(String id) { //검색!!
		ArrayListFood finds = new ArrayList<Food>();
		if (bean != null) {
			String key = bean.getKey();
			System.out.println(key);
			//String word = bean.getWord();
			String[] words = bean.getWords();
			if (!key.equals("all") && words != null ) {//&& word != null && !word.trim().equals("")) { ///name, maker, material
				//boolean flag = true;
				for(String word : words) {
					if(!word.trim().equals("")) {
						Map<String, String> map = new HashMap<String, String>();
						map.put( "key", key );
						map.put( "word", word );
						finds= session.selectOne("Food.selectAll_keyword",map);
						System.out.println(finds);
					}
				}
			}
			else {
				finds= (ArrayList)session.selectList("Food.selectAll");
			}
		}
		return finds;
	}*/
	
	public ArrayList<Food> searchByCal(double cal){
		return dao.searchByCal(cal);
		
	}
	
	//검색어소팅용 //검색수가 같다면 조회수 높은 순 정렬됨
	public ArrayList<Food> sortkw(FoodPageBean bean) {
		return dao.sortkw(bean);	}
	
	/**
	 * 식품 코드에 해당하는 식품정보를 검색해서 반환.
	 * 
	 * @param code 검색할 식품 코드
	 * @return 식품 코드에 해당하는 식품 정보, 없으면 null이 리턴됨
	 */
	public Food search(int code) { //1가지 식품을 //코드로 검색//상세검색시 영양소 함량을 그래프로 표시 
		return dao.search(code);
	}

	/**
	 * 가장 많이 검색한 Food 정보 리턴하기 web에서 구현할 내용.
	 * 
	 * @return
	 */
	public ArrayList<Food> searchBest() { //조회수 기능
		return dao.searchBest();
	}

	public ArrayList<Food> searchBestIndex() {
		return dao.searchBestIndex();
	}
	
	public void countUp(int code) { //read한 경우 selectOne전에 조회수 올리기용!!!
		dao.countUp(code);
	}
	public void searchcnt(ArrayList<Food> list) {
		dao.searchcnt(list);
	}
	
	public static void print(ArrayList<Food> foods) {
		/*
		 * for (Food food : foods) { System.out.println(food); }
		 */
	}

	@Override
	public double getfoodcal(int code) {
		return dao.getfoodcal(code);
	}

	@Override
	public int getBoardListCnt() throws Exception {
		return dao.getBoardListCnt();
	}

	@Override
	public List<Food> searchAll(Pagination pagination) throws Exception {
		System.out.println("service2 : " + pagination.getListCnt());
		return dao.searchAll(pagination);

	}
}
