package com.project.npnc.external.service;

import com.project.npnc.external.dto.ExternalDto;
import java.util.List;

public interface ExternalService {
    List<ExternalDto> getAllContacts();
    ExternalDto getContactById(int AB_EXTERNAL_KEY);
    void addContact(ExternalDto externalDto);
    void editContact(ExternalDto externalDto);
    void removeContact(int AB_EXTERNAL_KEY);
}
