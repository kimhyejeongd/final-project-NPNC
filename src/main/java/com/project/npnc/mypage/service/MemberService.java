package com.project.npnc.mypage.service;

import org.springframework.stereotype.Service;
import com.project.npnc.mypage.repository.MemberRepository;
import com.project.npnc.security.dto.Member;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {

    private final MemberRepository memberRepository;

    public Member findMemberById(String memberId) {
        return memberRepository.findByMemberId(memberId);
    }

    public void updateMember(Member member) {
        memberRepository.updateMember(member);
    }
}