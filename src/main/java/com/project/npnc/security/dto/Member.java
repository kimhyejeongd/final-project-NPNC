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
    private int MEMBER_KEY;
    private int DEPARTMENT_KEY;
    private int JOB_KEY;
    
    @NotBlank(message = "아이디는 필수 입력 값입니다.")
    private String MEMBER_ID;
    
    @NotBlank(message = "비밀번호는 필수 입력 값입니다.")
    @Pattern(regexp = "(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,16}", message = "비밀번호는 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.")
    private String MEMBER_PW;
    
    private String MEMBER_PHONE;
    private String MEMBER_EMAIL;
    private String MEMBER_MASSAGE;
    private Date MEMBER_ENROLL_DATE;
    private Date MEMBER_LEAVE_DATE;
    private String MEMBER_TELL;
    private String MEMBER_ADDRESS;
    private int ACCESS_KEY;
    private String MEMBER_NAME;
    private String MEMBER_GENDER;
    private String MEMBER_STATE;
    private Date MEMBER_BIRTHDATE;
    private String MEMBER_PROFILE_IMAGE; // 프로필 이미지 URL 또는 파일 경로 필드 추가

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Set<GrantedAuthority> auth = new HashSet<>();
        if(MEMBER_ID.equals("admin")) {
            auth.add(new SimpleGrantedAuthority(MyAuthority.ADMIN.name()));
        }
        auth.add(new SimpleGrantedAuthority(MyAuthority.USER.name()));
        return auth;
    }

    @Override
    public String getUsername() {
        return this.MEMBER_ID;
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
        return this.MEMBER_PW;
    }
}
