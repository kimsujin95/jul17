package com.sujin.pro;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

// Inject 사용해보기

@Repository("boardDAO")
public class BoardDAO {	
	@Inject
	@Named("sqlSession")
	private SqlSession sqlSession;
	
	public List<BoardDTO> boardList() {
		return sqlSession.selectList("board.boardList");
	}

	public BoardDTO detail(BoardDTO dto2) {
		return sqlSession.selectOne("board.detail", dto2); // 앞에는 네임스페이스.아이디, 값
	}

	public void write(BoardDTO dto) {
		sqlSession.insert("board.writer", dto); // 네임스페이스.id, 값
	}

	public void delete(BoardDTO dto) {
		sqlSession.delete("board.delete", dto);
	}

	public void update(BoardDTO dto) {
		sqlSession.update("board.update", dto);
	}
	
}
