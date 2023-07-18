package com.sujin.pro;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	// 첫화면 로딩 : index.jsp 호출
	@GetMapping(value = {"/", "/index", "/home" })
	public String index() {
		return "index"; // 데이터 붙임 없이 index.jsp페이지만 보여줍니다.
	}
	
	// 임시로 만들었어요. 나중에 수정할게요.
	@GetMapping("/board2")
	public String menu() {
		return "board2";
	}
	
	// 임시로 만들었어요. 나중에 수정할게요.
	@GetMapping("/mooni")
	public String mooni() {
		return "mooni";
	}

	// 임시로 만들었어요. 나중에 수정할게요.
	@GetMapping("/notice")
	public String notice() {
		return "notice";
	}
		
}
