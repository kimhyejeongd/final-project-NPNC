package com.project.npnc.note.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.note.dto.NoteFileDto;
import com.project.npnc.note.dto.NoteReceptionDto;
import com.project.npnc.note.dto.NoteSendDto;

@Repository
public class NoteDaoImpl implements NoteDao {
	
//  즐겨찾기 화면

	@Override
	public List<NoteReceptionDto> noteBookMarkPaging(SqlSession session, Map<String, Object> page) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds(((Integer)(page.get("cPage"))-1)*((Integer)page.get("numPerpage")),(Integer)page.get("numPerpage"));
		int memberKey=(Integer)page.get("memberKey");

		return session.selectList("note.noteBookMarkPaging",memberKey ,rb);
	}

	@Override
	public int noteBookMarkTotalData(SqlSession session, int memberKey) {
		// TODO Auto-generated method stub
		return session.selectOne("noteBookMarkTotalData", memberKey);
	}


//	즐겨찾기 삭제
	@Override
	public int noteBookMarkDelete(SqlSession session, Map<String, Object> param) {

		return session.update("note.noteBookMarkDelete", param);
	}


	//	즐겨찾기 추가
	@Override
	public int noteBookMarkInsert(SqlSession session, Map<String, Object> param) {

		return session.update("note.noteBookMarkInsert", param);
	}

	
	//내게 쓴 쪽지함 	
	@Override
	public List<NoteReceptionDto> selectNoteMeAll(SqlSession session, Map<String, Integer> page) {
		RowBounds rb=new RowBounds((page.get("cPage")-1)*page.get("numPerpage"),page.get("numPerpage"));
		int memberKey=page.get("memberKey");
		System.out.println(memberKey+"       "+rb);
		return  session.selectList("note.selectNoteMeAll", memberKey, rb);
	
		
	}

	@Override
	public int selectNoteMeTotalData(SqlSession session, int memberKey) {
		// TODO Auto-generated method stub
		return session.selectOne("note.selectNoteMeTotalData",memberKey);
	}

	//	보낸 쪽지 삭제, 업데이트 구문
	@Override
	public int noteSendDelete(SqlSession session, int checkDeleteValue) {
		
		return session.update("note.noteSendDelete", checkDeleteValue);
	}
	
	// 받은 쪽지 삭제, 업데이트 구문
	@Override
	public int noteRecDelete(SqlSession session, Map<String, Integer> param) {
		
		return session.update("note.noteRecDelete", param);
	}

	@Override
	public int noteFileInput(SqlSession session, NoteFileDto noteFile) {
			
		return session.insert("note.noteFileInput", noteFile);
	}
	
	@Override
	public int noteOneWrite(SqlSession session, NoteReceptionDto note) {
	System.out.println(note);
		return session.insert("note.noteOneWrite", note);
	}

	@Override
	public int sendNoteOneWrite(SqlSession session, NoteReceptionDto sendNote) {
		
		return session.insert("note.sendNoteOneWrite", sendNote);
	}

	

	@Override
	public int noteSelectTotalData(SqlSession session, Map<String,Object> param) {
		
		return session.selectOne("note.noteSelectTotalData",param);
	}
	
	

	@Override
	public List<NoteSendDto> sendNoteSelectAllPaging(SqlSession session, Map<String, Integer> page) {
		RowBounds rb=new RowBounds((page.get("cPage")-1)*page.get("numPerpage"),page.get("numPerpage"));
		int memberKey=page.get("memberKey");
		System.out.println(memberKey+" 여기에 들어 왔냐고");
		
		return session.selectList("note.sendNoteSelectAllPaging", memberKey, rb);
	}

	@Override
	public List<NoteReceptionDto> selectNoteAll(SqlSession session, Map<String, Object> page) {
		RowBounds rb=new RowBounds(((Integer)(page.get("cPage"))-1)*((Integer)page.get("numPerpage")),(Integer)page.get("numPerpage"));
		int memberKey=(Integer)page.get("memberKey");
		Map<String, Object> param=new HashMap<>();
		param.put("memberKey", memberKey);
		
		
		if (page.containsKey("title")) {
			param.put("title", page.get("title"));
			
			System.out.println(page.get("title")+"제목 들어왔냐고");
		}
		if(page.containsKey("name")) {
			param.put("name", page.get("name"));
			System.out.println(page.get("name")+"네임 들어왔냐고");

		}
		
	
		return session.selectList("note.noteSelectAll",param,rb);
	}

	@Override
	public NoteReceptionDto selectNoteOne(SqlSession session, Map<String, Integer> param) {
	
		return session.selectOne("note.noteSelectOne", param);
	}

	@Override
	public int noteReciver(SqlSession session, Map<String, Object> param) {
		System.out.println(param+"여기 뭐가 들어가는데");
		return session.insert("note.noteReciver", param);
	}

	@Override
	public int noteMsgKey(SqlSession session) {
		
		return session.selectOne("note.noteMsgKey");
	}
	
	@Override
	public List<NoteSendDto> sendNoteSelectAll(SqlSession session, Map<String, Integer> page) {
		RowBounds rb=new RowBounds((page.get("cPage")-1)*page.get("numPerpage"),page.get("numPerpage"));
		int memberKey=page.get("memberKey");
		return session.selectList("note.sendNoteSelectAll",memberKey,rb);
	}

	@Override
	public int sendNoteSelectTotalData(SqlSession session, int memberKey) {
		
		return session.selectOne("note.sendNoteSelectTotalData",memberKey);
	}
	
	@Override
	public NoteSendDto selectSendOne(SqlSession session, Map<String, Integer> param) {
		
		return session.selectOne("note.selectSendOne", param);
	}

}
