package com.project.npnc.external.dao;

import com.project.npnc.external.dto.ExternalDto;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;


public interface ExternalDao {
    List<ExternalDto> getAllContacts();
    ExternalDto getContactById(int AB_EXTERNAL_KEY);
    void addContact(ExternalDto externalDto);
    void updateContact(ExternalDto externalDto);
    void deleteContact(int AB_EXTERNAL_KEY);
}
