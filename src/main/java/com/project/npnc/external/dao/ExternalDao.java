package com.project.npnc.external.dao;

import java.util.List;
import java.util.Map;

import com.project.npnc.external.dto.ExternalDto;

public interface ExternalDao {
    List<ExternalDto> getAllContacts();
    ExternalDto getContactById(int id);
    void addContact(ExternalDto externalDto);
    void updateContact(ExternalDto externalDto);
    void deleteContact(int id);
    void toggleFavorite(int id);
    List<ExternalDto> searchContacts(String query);
}
