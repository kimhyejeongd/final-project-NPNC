package com.project.npnc.security.dto;

import java.sql.Date;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.project.npnc.security.common.MyAuthority;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member implements UserDetails {


  private static final long serialVersionUID = 2753929692689331304L;


	private int memberKey;
	private String departmentKey;
	private String jobKey;
	private String departmentName;
	private String jobName;

	@NotBlank(message = "아이디는 필수 입력 값입니다.")
	private String memberId;

	@NotBlank(message = "비밀번호는 필수 입력 값입니다.")
	@Pattern(regexp = "(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,16}", message = "비밀번호는 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.")
	private String memberPw;

	private String memberPhone;
	private String memberEmail;
	private String memberMessage;
	private Date memberEnrollDate;
	private Date memberLeaveDate;
	private String memberTell;
	private String memberAddress;
	private int accessKey;
	private String memberName;
	private String memberGender;
	private String memberState;
	private Date memberBirthdate;
	private String memberProfileImage;


	/* 권한 설정 */
	 @Override public Collection<? extends GrantedAuthority> getAuthorities() {
	 Set<GrantedAuthority> auth=new HashSet();
	 if(memberId.equals("admin")) {
	 auth.add(new SimpleGrantedAuthority(MyAuthority.ADMIN.name())); }
	 auth.add(new SimpleGrantedAuthority(MyAuthority.USER.name())); return auth; }
	 

	@Override
	public String getUsername() { // 사용자 아이디 반환
		// TODO Auto-generated method stub
		return this.memberId;
	}

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }



	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return this.memberPw;
	}

}
