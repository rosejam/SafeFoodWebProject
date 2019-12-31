package com.safe.dao;

import java.util.ArrayList;
import java.util.List;

import com.safe.vo.Food;
import com.safe.vo.FoodPageBean;
import com.safe.vo.Pagination;

public interface ISafeFood {
	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 식품 정보(Food)의 개수를 반환. 
	 * web에서 구현할 내용. 
	 * web에서 페이징 처리시 필요 
	 * @param bean  검색 조건과 검색 단어가 있는 객체
	 * @return 조회한  식품 개수
	 */
	public int foodCount(FoodPageBean bean);

	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 식품 정보(Food)를  검색해서 반환.  
	 * @param bean  검색 조건과 검색 단어가 있는 객체
	 * @return 조회한 식품 목록
	 */
	public ArrayList<Food> searchAll(FoodPageBean  bean);
	public List<Food> searchAll(Pagination pagination);

	
	/**
	 * 식품 코드에 해당하는 식품정보를 검색해서 반환. 
	 * @param code	검색할 식품 코드
	 * @return	식품 코드에 해당하는 식품 정보, 없으면 null이 리턴됨
	 */
	public Food search(int code);
	
	/**
	 * 가장 많이 검색한 Food  정보 리턴하기 
	 * web에서 구현할 내용.  
	 * @return
	 */
	public ArrayList<Food> searchBest();
	public ArrayList<Food> searchBestIndex();

	public void countUp(int code);

	public ArrayList<Food> sortkw(FoodPageBean bean);
	//spublic void saveword(String word);

	public ArrayList<Food> searchByCal(double cal);

	public void searchcnt(ArrayList<Food> list);

	public double getfoodcal(int code);
	public int getBoardListCnt() throws Exception;

}
