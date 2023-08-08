package com.sujin.board;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sujin.util.Util;

@Service("boardService")
public class BoardService {

	@Inject
	@Named("boardDAO")
	private BoardDAO boardDAO;

	@Autowired
	private Util util;

	// 보드 리스트 불러오는 메소드
	// 메소드 괄호 안에 페이징을 가져오는 파라미터 PageDTO 객체타입을 넣는다.
	public List<BoardDTO> boardList(PageDTO page) {
		return boardDAO.boardList(page);
	}

	public BoardDTO detail(BoardDTO dto2) {
		
		// 조회수 +1하기 기능을 넣어주겠습니다.
		boardDAO.likeUp(dto2);
		
		BoardDTO dto = boardDAO.detail(dto2);
		System.out.println(dto);
//		System.out.println(dto.getBno());
//		System.out.println(dto.getBip());

		if (dto != null) { // 내 글이 아닐 때 null들어옵니다. 즉, null이 아닐때라고 검사해주세요.
			// 검사 : .이 없거나, null이면 실행하지 않게 해주세요.
			if (dto.getBip() != null && dto.getBip().indexOf(".") != -1) {
				// 여기서 ip 뽑아올 수 있죠?
				String ip = dto.getBip();
				// ip 중간에 하트 넣어주실 수 있죠? 172.30.1.19 ---> 172.♡.1.19
				String[] ipArr = ip.split("\\.");
				ipArr[1] = "♡";
				// 그거 다시 ip에 저장하실 수 있죠?
				dto.setBip(String.join(".", ipArr));
				// 끝
			}
		}
		
		return dto;

	}

	// 글쓰기입니다.
	public void write(BoardDTO dto) {
		// btitle을 꺼내줍니다.
//		String btitle = dto.getBtitle();

		// 값을 변경하겠습니다. replace() -> &lt; -> &gt
//		btitle = btitle.replace("<", "&lt;");
//		btitle = btitle.replace(">", "&gt;");

		dto.setBtitle(util.exchange(dto.getBtitle()));
		// 다시 저장해주세요.

		dto.setBip(util.getIp()); // 얻어온 ip도 저장해서 데이터베이스로 보내겠습니다.

		boardDAO.write(dto); // 실행만 시키고 결과를 받지 않습니다.
		// select를 제외한 나머지는 영향받은 행의 수(int)를 받아오기도 합니다.

	}

	public void delete(BoardDTO dto) {
		boardDAO.delete(dto);

	}

	public void update(BoardDTO dto) {
		boardDAO.update(dto);
	}

	// 전체 글 수 가져오기 2023-07-26 sql응용
	public int totalCount() {
		return boardDAO.totalCount();
	}

	public List<Map<String, Object>> commentsList(int bno) {
		return boardDAO.commentsList(bno);
	}

	public int cdel(Map<String, Object> map) {
		return boardDAO.cdel(map);
	}

	public int cupdate(Map<String, Object> map) {
		return boardDAO.cupdate(map);
	}

}
