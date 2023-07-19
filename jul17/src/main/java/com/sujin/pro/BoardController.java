package com.sujin.pro;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {
	// user -> Controller -> Service -> DAO -> mybatis -> DB

	// Autowired(데이터타입이 맞으면 ㅇㅋ) 말고 Resource로 연결해보기.. Resource는 이름으로 연결
	@Resource(name = "boardService")
	private BoardService boardService;

	@Autowired
	private Util util; // 컴포넌트 Util과 연결했습니다.
	
	
	@GetMapping("/board")
	public String board(Model model) { // 서비스에서 값 가져옵시다//서비스에서 값 가져옵시다
		model.addAttribute("list", boardService.boardList()); // list란 이름으로 보드서비스에서 보드리스트를 불러옴
		boardService.boardList();
		return "board";
	}

	// http://localhost:8080/pro1/detail?bno=118
	// 파라미터 잡기.. 각 페이지마다 bno 숫자가 다르니까
	@GetMapping("/detail")
	public String detail(HttpServletRequest request, Model model) { // 디테일이 들어올때 값까지 같이 들어오게 하는거.. 사용자가 118번 글을 클릭했을때 그
																	// 내용이 HttpServletRequest request에 들어있는거..
		String bno = request.getParameter("bno");
		// bno에 요청하는 값이 있습니다. 이 값을 db까지 보내겠습니다.
		// System.out.println("bno : " + bno);

		BoardDTO dto = boardService.detail(bno); // 보드서비스를 실행하면 dto가 나와 이런 느낌
		model.addAttribute("dto", dto);

		return "detail";
	}

	@GetMapping("/write") // 화면만 보여주는 녀석
	public String write() {
		return "write";
	}

	@PostMapping("/write")
	public String write(HttpServletRequest request) { // write 메소드가 똑같기 때문에 HttpServletRequest 씀
		// 사용자가 입력한 데이터 변수에 담기
		// System.out.println(request.getParameter("title")); //wirte.jsp에서 씀
		// System.out.println(request.getParameter("content"));
		// System.out.println("===============================");
		
		BoardDTO dto = new BoardDTO();
		dto.setBtitle(request.getParameter("title")); // write.jsp에서 지정하였다.
		dto.setBcontent(request.getParameter("content"));
//		dto.setBip(ip); // 얻어온 ip도 저장해서 데이터베이스로 보내겠습니다.
//		dto.setBip(util.getIp()); -> BoardService.java로 옮겼다.
		dto.setBwrite("홍길동2");// 임시로 적는다. 로그인 추가되면 변경한다.

		// Service -> DAO -> maybatis -> DB로 보내서 저장하기
		boardService.write(dto);

		return "redirect:board"; // 글을 쓰면 다시 보드를 실행시킨다. 다시 컨트롤러 지나가기 get방식으로 간다.
	}

	// 삭제가 들어온다면 http://172.30.1.64/delete?bno=글번호
	@GetMapping("/delete")
	// 					 HttpServletRequest의 getParameter();
	// 좀 더 명확한 방법
	public String delete(@RequestParam(value = "bno", required = true, defaultValue = "0") int bno) {
		// required : 필수로 적어야지 적용이 되는 것. false면 없어도 상관없는 것.
//		System.out.println("bno : " + bno);
		// dto
		BoardDTO dto = new BoardDTO();
		dto.setBno(bno);
//		dto.setBwrite(null) 사용자 정보
		// 추후 로그인을 하면 사용자의 정보도 담아서 보냅니다.
		
		boardService.delete(dto);
		
		return "redirect:board"; // 삭제를 완료한 후에 다시 보드로 갑니다.
	}

}