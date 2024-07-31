package com.project.npnc.note.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.project.npnc.member.model.dao.MemberDao;
import com.project.npnc.member.model.dto.SrMember;
import com.project.npnc.note.dao.NoteDao;
import com.project.npnc.note.dto.NoteFileDto;
import com.project.npnc.note.dto.NoteReceptionDto;
import com.project.npnc.note.dto.NoteSendDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoteServiceImpl implements NoteService{

	
	

	
	private final NoteDao dao;
	private final SqlSession session;
	private final MemberDao memberDao;
	
	@Override
	public int noteBookMarkDelete(Map<String, Object> param) {

		return dao.noteBookMarkDelete(session,param);
	}

	@Override
	public int noteBookMarkInsert(Map<String, Object> param) {

		return dao.noteBookMarkInsert(session,param);
	}

	//	즐겨찾기 화면
	@Override
	public List<NoteReceptionDto> noteBookMarkPaging(Map<String, Object> page) {
		// TODO Auto-generated method stub
		return dao.noteBookMarkPaging(session,page);
	}

	@Override
	public int noteBookMarkTotalData(int memberKey) {
		// TODO Auto-generated method stub
		return dao.noteBookMarkTotalData(session, memberKey);
	}
	
	@Override
	public List<SrMember> selectMemberAllNoPaging() {
		
		List<SrMember> result =memberDao.selectMemberAllNoPaging(session);
		
		return result;
	}

	
// 개별, 다중 쪽지 발송 파일 있는 버전	
	@Override
	public int noteWritesAndFile(int[] reMemberKey, NoteReceptionDto note, List<NoteFileDto> upfiles) {
		int noteMsgKey=dao.noteMsgKey(session);
		note.setPostMsgRecKey(noteMsgKey);
		int result=dao.noteOneWrite(session, note);
		int result1=dao.sendNoteOneWrite(session, note);

		for (int i=0; i<reMemberKey.length; i++) {
			Map<String,Object> param=new HashMap();
			
			param.put("reMemberKey", reMemberKey[i]);
			param.put("noteMsgKey", noteMsgKey);
			int result2=dao.noteReciver(session, param);
			
		}
		
		
		for (int i=0; i<upfiles.size();i++) {
			NoteFileDto file=upfiles.get(i);
			file.setPostMsgKey(noteMsgKey);
			file.setPostMsgSendKey(noteMsgKey);
			int result3=dao.noteFileInput(session, file);
			
		}
		return 0;
	}

//	전체 쪽지 발송
	@Override
	public int noteAllWrite(NoteReceptionDto note) {
		int noteMsgKey=dao.noteMsgKey(session);
		note.setPostMsgRecKey(noteMsgKey);
		int result=dao.noteOneWrite(session, note);
		int result1=dao.sendNoteOneWrite(session, note);
		
		Map<String,Object> param=new HashMap();
		param.put("noteMsgKey", noteMsgKey);

		List<SrMember> members=memberDao.selectMemberAllNoPaging(session);
		
		for (int i=0; i<members.size(); i++) {
			
			param.put("reMemberKey",members.get(i).getMemberKey());
			int result2=dao.noteReciver(session, param);
			
		}
		
		return 0;
	}
	
//	전체 쪽지 발송 파일 버전
	@Override
	public int noteAllWriteAndFile(NoteReceptionDto note, List<NoteFileDto> upfiles) {
		int noteMsgKey=dao.noteMsgKey(session);
		note.setPostMsgRecKey(noteMsgKey);
		int result=dao.noteOneWrite(session, note);
		int result1=dao.sendNoteOneWrite(session, note);
		
		Map<String,Object> param=new HashMap();
		param.put("noteMsgKey", noteMsgKey);

		List<SrMember> members=memberDao.selectMemberAllNoPaging(session);
		
		for (int i=0; i<members.size(); i++) {
			
			param.put("reMemberKey",members.get(i).getMemberKey());
			int result2=dao.noteReciver(session, param);
			
		}
		
		
		for (int i=0; i<upfiles.size();i++) {
			NoteFileDto file=upfiles.get(i);
			file.setPostMsgKey(noteMsgKey);
			file.setPostMsgSendKey(noteMsgKey);
			int result3=dao.noteFileInput(session, file);
			
		}
		
		return 0;

	}


	
	@Override
	public NoteReceptionDto selectNoteOne(Map<String,Integer> param) {
		
		return dao.selectNoteOne(session,param);
	}

	
	@Override
	public int noteOneWrite(int reMemberKey , NoteReceptionDto note) {
		int noteMsgKey=dao.noteMsgKey(session);
		note.setPostMsgRecKey(noteMsgKey);
		int result=dao.noteOneWrite(session, note);
		int result1=dao.sendNoteOneWrite(session, note);
		
		Map<String,Object> param=new HashMap();
		
		param.put("reMemberKey", reMemberKey);
		param.put("noteMsgKey", noteMsgKey);
		
		int result2=dao.noteReciver(session, param);
		
		
		return result;
	}

//	개별, 다중 쪽지 발송
	@Override
	public int noteWrites(int[] reMemberKey, NoteReceptionDto note) {
	
		int noteMsgKey=dao.noteMsgKey(session);
		note.setPostMsgRecKey(noteMsgKey);
		int result=dao.noteOneWrite(session, note);
		int result1=dao.sendNoteOneWrite(session, note);

		for (int i=0; i<reMemberKey.length; i++) {
			Map<String,Object> param=new HashMap();
			
			param.put("reMemberKey", reMemberKey[i]);
			param.put("noteMsgKey", noteMsgKey);
			int result2=dao.noteReciver(session, param);
			
		}
		
		
		return noteMsgKey;
	}

	@Override
	public List<NoteReceptionDto> selectNoteAll(Map<String, Object> page) {
	
		return dao.selectNoteAll(session, page);
	}

	@Override
	public int noteSelectTotalData(Map<String,Object> param) {
		
		return dao.noteSelectTotalData(session, param);
	}


	@Override
	public List<NoteSendDto> sendNoteSelectAll(Map<String, Integer> page) {
		// TODO Auto-generated method stub
		return dao.sendNoteSelectAll(session, page);
	}

	@Override
	public int sendNoteSelectTotalData(int memberKey) {
		
		return dao.sendNoteSelectTotalData(session, memberKey);
	}
	
	@Override
	public NoteSendDto selectSendOne(Map<String, Integer> param) {
		
		return dao.selectSendOne(session,param);
	}

	@Override
	public List<NoteSendDto> sendNoteSelectAllPaging(Map<String, Integer> page) {
		
		return dao.sendNoteSelectAllPaging(session, page);
	}

//	보낸쪽지 삭제
	@Override
	public int noteSendDelete(int[] checkDeleteValue) {
		int result1=0;
		for(int i=0; i<checkDeleteValue.length; i++) {
			
			 result1= dao.noteSendDelete(session, checkDeleteValue[i]);
		}
		
		
		return result1;
	}
//	받은쪽지 삭제
	@Override
	public int noteRecDelete(int[] checkDeleteValue, int memberKey) {
		
		int result1=0;
		Map<String,Integer> param=new HashMap();
		param.put("memberKey", memberKey);
		for(int i=0; i<checkDeleteValue.length; i++) {
			param.put("checkDeleteValue", checkDeleteValue[i]);	
			 result1= dao.noteRecDelete(session, param);
		}
		
		
		return result1;
	}

//	내게보낸쪽지함
	@Override
	public List<NoteReceptionDto> selectNoteMeAll(Map<String, Integer> page) {
		List<NoteReceptionDto> list= dao.selectNoteMeAll(session, page);
		return  list;
	}


	@Override
	public int selectNoteMeTotalData(int memberKey) {
		
		return dao.selectNoteMeTotalData(session, memberKey);
	}


	


}
