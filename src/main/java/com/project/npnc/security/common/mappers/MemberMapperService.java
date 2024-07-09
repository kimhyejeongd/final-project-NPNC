package com.project.npnc.security.common.mappers;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.npnc.security.dto.Member;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberMapperService {
	private final MemberMapper memberMapper;
	// private final MemberMapperService mapperService;
	
	public List<Member> selectMemberAll() {
		return memberMapper.selectMemberAll();
	}
	
	@GetMapping("/mapper/member")
	public List<Member> getMpperMember(){
		return memberMapper.selectMemberAll();
	}
}
