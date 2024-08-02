package com.project.npnc.external.service;

import java.util.List;
import java.util.Map;

import com.project.npnc.external.dto.ExternalDto;

public interface ExternalService {
    List<ExternalDto> getAllContacts();
    ExternalDto getContactById(int id);
    void addContact(ExternalDto externalDto);
    void updateContact(ExternalDto externalDto);
    void deleteContact(int id);
    void toggleFavorite(int id); // 추가된 메서드
    List<ExternalDto> searchContacts(String query);
}
