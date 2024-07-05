package com.project.npnc.security.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.project.npnc.security.dto.Member;
import com.project.npnc.security.model.dao.MemberDao;

import lombok.AllArgsConstructor;

//시큐리티가 이용하는 인증처리 클래스 
//시큐리티에 있는 interface 를 사용함 ( UserDetailsService 인터페이스를 구현 ) -> loadUserByUsename() 메소드를 재정의
// public UserDetails를 반환함 (마찬가지로 시큐리티가 제공하는 추상화되어있는 클래스임)  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException을 예외처리하는 구조
//-> 매개변수로 보내는 값:id(매개변수 username -> 클라이언트가 입력한 아이디값)
//반환값 UserDetails -> UserDetails 인터페이스를 구현한 객체 
// Member DTO객체가 구현 
@AllArgsConstructor

public class SecurityLoginProvider implements UserDetailsService  {
	private final MemberDao dao;
	private final SqlSession session;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException { //객체 가져오는 로직은 너가 알아서 해라
		Member loginMember=dao.selectMemberById(session,username); //아이디 가져오기
		
		return loginMember; //UserDetails -> interface객체 로 반환해야하니까 loginMember가 UserDetails를 구현해야함(멤버를 구현체로 만들면 반환이 가능해짐)
	}
	
}
