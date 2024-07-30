package com.project.npnc.external.dao;

import com.project.npnc.external.dto.ExternalDto;
import java.util.List;

public interface ExternalDao {
    List<ExternalDto> getAllContacts();
    ExternalDto getContactById(int id);
    void addContact(ExternalDto externalDto);
    void updateContact(ExternalDto externalDto);
    void deleteContact(int id);
}
