package com.project.npnc.security.common.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.project.npnc.security.dto.Member;

@Mapper
public interface MemberMapper {
    
    @Select("SELECT * FROM MEMBER")
    @Results({
        @Result(property = "memberKey", column = "MEMBER_KEY"),
        @Result(property = "departmentKey", column = "DEPARTMENT_KEY"),
        @Result(property = "jobKey", column = "JOB_KEY"),
        @Result(property = "memberId", column = "MEMBER_ID"),
        @Result(property = "memberPw", column = "MEMBER_PW"),
        @Result(property = "memberPhone", column = "MEMBER_PHONE"),
        @Result(property = "memberEmail", column = "MEMBER_EMAIL"),
        @Result(property = "memberMessage", column = "MEMBER_MESSAGE"),
        @Result(property = "memberEnrollDate", column = "MEMBER_ENROLL_DATE"),
        @Result(property = "memberLeaveDate", column = "MEMBER_LEAVE_DATE"),
        @Result(property = "memberTell", column = "MEMBER_TELL"),
        @Result(property = "memberAddress", column = "MEMBER_ADDRESS"),
        @Result(property = "accessKey", column = "ACCESS_KEY"),
        @Result(property = "memberName", column = "MEMBER_NAME"),
        @Result(property = "memberGender", column = "MEMBER_GENDER"),
        @Result(property = "memberState", column = "MEMBER_STATE"),
        @Result(property = "memberBirthdate", column = "MEMBER_BIRTHDATE"),
        @Result(property = "departmentName", column = "DAPARTMENTNAME")
    })
    List<Member> selectMemberAll();
    
//  @Select("SELECT * FROM MEMBER WHERE MEMBER_ID=#{userId}")
    @Select("SELECT M.*, D.DEPARTMENT_NAME, J.JOB_NAME " +
            "FROM MEMBER M " +
            "JOIN DEPARTMENT D ON M.DEPARTMENT_KEY = D.DEPARTMENT_KEY " +
            "JOIN JOB J ON M.JOB_KEY = J.JOB_KEY " +
            "WHERE M.MEMBER_ID = #{userId}")
    @Results({
        @Result(property = "memberKey", column = "MEMBER_KEY"),
        @Result(property = "departmentKey", column = "DEPARTMENT_KEY"),
        @Result(property = "jobKey", column = "JOB_KEY"),
        @Result(property = "memberId", column = "MEMBER_ID"),
        @Result(property = "memberPw", column = "MEMBER_PW"),
        @Result(property = "memberPhone", column = "MEMBER_PHONE"),
        @Result(property = "memberEmail", column = "MEMBER_EMAIL"),
        @Result(property = "memberMessage", column = "MEMBER_MESSAGE"),
        @Result(property = "memberEnrollDate", column = "MEMBER_ENROLL_DATE"),
        @Result(property = "memberLeaveDate", column = "MEMBER_LEAVE_DATE"),
        @Result(property = "memberTell", column = "MEMBER_TELL"),
        @Result(property = "memberAddress", column = "MEMBER_ADDRESS"),
        @Result(property = "accessKey", column = "ACCESS_KEY"),
        @Result(property = "memberName", column = "MEMBER_NAME"),
        @Result(property = "memberGender", column = "MEMBER_GENDER"),
        @Result(property = "memberState", column = "MEMBER_STATE"),
        @Result(property = "memberBirthdate", column = "MEMBER_BIRTHDATE"),
        @Result(property = "departmentName", column = "DEPARTMENT_NAME"),
        @Result(property = "jobName", column = "JOB_NAME")

    })
    Member selectMemberById(String userId);
    
//    @Insert("INSERT INTO MEMBER(MEMBER_ID, MEMBER_PW) VALUES (#{userId}, #{password})")
//    int insertMember(Member m);
    
	/*
	 * @SelectProvider(type=MemberMapperBuilder.class, method="selectMember") public
	 * List<Member> selectMemberByWhere(Map<String,Object> param);
	 */
}
