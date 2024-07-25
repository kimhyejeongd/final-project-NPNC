package com.project.npnc.external.service;

import com.project.npnc.external.dao.ExternalDao;
import com.project.npnc.external.dto.ExternalDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExternalServiceImpl implements ExternalService {

    private final ExternalDao externalDao;

    @Autowired
    public ExternalServiceImpl(ExternalDao externalDao) {
        this.externalDao = externalDao;
    }

    @Override
    public List<ExternalDto> getAllContacts() {
        return externalDao.getAllContacts();
    }

    @Override
    public ExternalDto getContactById(int AB_EXTERNAL_KEY) {
        return externalDao.getContactById(AB_EXTERNAL_KEY);
    }

    @Override
    public void addContact(ExternalDto externalDto) {
        externalDao.addContact(externalDto);
    }

    @Override
    public void editContact(ExternalDto externalDto) {
        externalDao.updateContact(externalDto);
    }

    @Override
    public void removeContact(int AB_EXTERNAL_KEY) {
        externalDao.deleteContact(AB_EXTERNAL_KEY);
    }
}
