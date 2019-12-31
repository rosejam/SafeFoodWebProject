package com.safe.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.safe.service.MemberService;
import com.safe.service.SafeFoodService;
import com.safe.vo.Food;
import com.safe.vo.Member;

@Controller
public class MemberController {
	/*
	 * @ExceptionHandler public ModelAndView handler(Exception e) { ModelAndView mav
	 * = new ModelAndView("ErrorHandler"); mav.addObject("msg", e.getMessage());
	 * return mav; }
	 */

	@Autowired
	MemberService service2;

	@Autowired
	SafeFoodService service;

	@GetMapping("/insert.food")
	public String insertForm(HttpSession session, HttpServletRequest req) { // 회원가입
		String id = (String) session.getAttribute("id");
//		session.setAttribute("cpage", req.getRequestURI());// 세션에 현재 위치 저장시켜놓고 로그인했을 경우 돌아오기
		String url = "";
		if (id == null) { // 로그인 한 경우
//입력하는 화면이 뜨게 한다(db에 넣는 작업 이전)
			url = "insertForm";
		} else { // 로그인 한 경우
			url = "redirect:/list.food";
		}
		return url;
		/*
		 * RequestDispatcher dispatcher =
		 * req.getRequestDispatcher("/view/insertForm.jsp");//회원가입 jsp try {
		 * //res.sendRedirect("/view/insertForm.jsp"); dispatcher.forward(req, res); }
		 * catch (Exception e) { e.printStackTrace(); }
		 */
	}

	@PostMapping("/insertProcess.food")
	public String insert(Model model, String id, String pass, String[] alergy, int weight) { // DB에 가입정보 저장
		StringBuilder alergy_comb = new StringBuilder();
		for (int i = 0; i < alergy.length; i++) {
			alergy_comb.append(alergy[i] + " ");
		}

		String alergy_combined = alergy_comb.toString();
		Member m = new Member(id, pass, alergy_combined, weight);
		service2.insert(m);
		model.addAttribute("id", id);
		model.addAttribute("alergy_combined", alergy_combined);
		model.addAttribute("weight", weight);

		return "insertSuccess";
	}

	@GetMapping("/delete.food")
	public String delete(HttpSession session, Model model) { // DB에서 탈퇴
		String id = (String) session.getAttribute("id");
		service2.delete(id);
		session.setAttribute("id", null); // session에서 지우기

		return "index"; // 리다이렉트?
	}

	@GetMapping("/update.food")
	public String updateForm() { // 수정
		return "updateForm";
	}

	@PostMapping("/updateProcess.food")
	public String update(HttpSession session, Model model, String[] alergy, int weight) { // DB에 가입정보 저장
		String id = (String) session.getAttribute("id");
		StringBuilder alergy_comb = new StringBuilder();
		for (int i = 0; i < alergy.length; i++) {
			alergy_comb.append(alergy[i] + " ");
		}
		String alergy_combined = alergy_comb.toString();
//if(pass != null) {
//Food c = new Food(num, name, address);
//dao.update(id, pass, alergy_combined);

		//// service2.update(id, alergy_combined);
		Member m = new Member(id, null, alergy_combined, weight);
		service2.update(m);
		model.addAttribute("updateMember", m);
//req.setParameter("id",id);
//forward 방식으로 jsp로 전환
		return "updateSuccess";
//}else {
// try {
// res.sendRedirect("/view/fail.jsp");
// } catch (IOException e) {
// // TODO Auto-generated catch block
// e.printStackTrace();
// }
//}
	}

	@GetMapping("/addfood.food")
	public String addfood(HttpSession session, String code, Model model) {
		String id = (String) session.getAttribute("id");
		ArrayList<String> list = service2.searchMyFood(id);
		double mycal = service2.getmycal(id);
		int nc = Integer.parseInt(code);
		Food ingredient = service.search(nc);
		Member searchmem = service2.searchMyPage(id);
		
		String[] alergylist = searchmem.getAlergy().split(" ");
		
		for(int i=0; i<alergylist.length; i++) {
			if(ingredient.getMaterial().contains(alergylist[i])  ) {
				session.setAttribute("almsg" , alergylist[i] +  " 알러지 주의!!!");
				int code1 = Integer.parseInt(code);
				Food b = service.search(code1);
				model.addAttribute("b", b); // req에 넣어 저장
				return "detail";
			}
		}
		
		// if (code != null) {
		if (!list.contains(code)) { // 음식이 없을 때만 추가!!!!

			StringBuilder f_comb = new StringBuilder();
			for (int i = 0; i < list.size(); i++) {
				f_comb.append(list.get(i) + " ");
			}
			f_comb.append(code + " ");
			mycal += service.getfoodcal(Integer.parseInt(code));

			String f_combined = f_comb.toString();
			Member m = new Member(id, null, null, f_combined, mycal, 0);

			// service2.updateFood(id, f_combined);
			service2.updateFood(m);
		}
		// }
		return "redirect:/myfood.food";
	}

	@GetMapping("/deletefood.food")
	public String deletefood(HttpSession session, String code) {
		String id = (String) session.getAttribute("id");
		ArrayList<String> list = service2.searchMyFood(id);
		double mycal = service2.getmycal(id);

		// if (code != null) {
		if (list.contains(code)) { // 음식이 없을 때만

			list.remove(code);

			StringBuilder f_comb = new StringBuilder();
			for (int i = 0; i < list.size(); i++) {
				f_comb.append(list.get(i) + " ");
			}
			mycal -= service.getfoodcal(Integer.parseInt(code));
			String f_combined = f_comb.toString();
			Member m = new Member(id, null, null, f_combined, mycal, 0);

			// service2.updateFood(id, f_combined);
			service2.updateFood(m);

		} 
		// }
		return "redirect:/myfood.food";
	}

	@GetMapping("/idcheck.food")
	@ResponseBody
	public String check(String id, Model model) {
		return String.valueOf(service2.idcheck(id));

	}

}