package com.sujin.rest;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sujin.board.BoardService;
import com.sujin.login.LoginService;
import com.sujin.util.Util;


// @Controller + @ResponseBody가 합쳐진 어노테이션이다.
@RestController
public class ResttController {

	@Autowired
	private LoginService loginService;

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private Util util;
	
	// 아이디 중복검사 2023-08-02
	@PostMapping("/checkID")
	public String checkID(@RequestParam("id") String id) {
		// loginService에서 checkID(파라미터 값)를 int result값을 대입한다.
		// 0과 1로 확인하기 위해서
		int result = loginService.checkID(id);
		// json
		JSONObject json = new JSONObject();
		json.put("result", result); // json변수에 result값을 result에 담는다.
		System.out.println(json.toString());

		return json.toString(); // String 데이터타입으로 변환하여 json으로 데이터를 반환한다.
	}

	// 자바스크립트로 만든 것.
	@PostMapping("/checkID2")
	public String checkID2(@RequestParam("id") String id) {
		int result = loginService.checkID(id);
		return result + "";
	}

	// boardList2
	@GetMapping(value = "/boardList2", produces = "application/json; charset=UTF-8")
	public String boardList2(@RequestParam("pageNo") int pageNo) {
//		System.out.println("jq가 보내주는 : " + pageNo);

		// List 배열의 Map
		List<Map<String, Object>> list = loginService.boardList2((pageNo - 1) * 10);
//		System.out.println(list);
		JSONObject json = new JSONObject();
		JSONArray arr = new JSONArray(list);
		json.put("totalCount", loginService.totalCount());
		json.put("pageNo", pageNo);
		json.put("list", arr);

		return json.toString();
	}

	/*
	 * boardList2 = { totalCount : 128, pageNo: 1, list : [ {bno:1, btitle:....},
	 * {bno:1, btitle:....}, {bno:1, btitle:....}, {bno:1, btitle:....} ] }
	 * 
	 * 객체 : {키 : 값, 이름 : 값,......................}
	 * 
	 * 
	 * 
	 */

	@PostMapping("/cdelR")
	public String cdelR(@RequestParam Map<String, Object> map, HttpSession session) {
		int result = 0;
		if (session.getAttribute("mid") != null) {
			if (map.containsKey("bno") && map.get("cno") != null && 
				!(map.get("bno").equals("")) && !(map.get("cno").equals("")) && 
				util.isNum(map.get("bno")) && util.isNum(map.get("cno"))) {

				System.out.println(map);

//				System.out.println("여기로 들어왔습니다.");
				map.put("mid", session.getAttribute("mid"));
				result = boardService.cdel(map);
				System.out.println("삭제 결과 : " + result);

			}

		}
		JSONObject json = new JSONObject();
		json.put("result", result);
		return json.toString();
		
	}
}
