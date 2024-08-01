package com.project.npnc.external.service;

import com.project.npnc.external.dao.ExternalDao;
import com.project.npnc.external.dto.ExternalDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExternalServiceImpl implements ExternalService {

    @Autowired
    private ExternalDao externalDao;

    @Override
    public List<ExternalDto> getAllContacts() {
        return externalDao.getAllContacts();
    }

    @Override
    public ExternalDto getContactById(int id) {
        return externalDao.getContactById(id);
    }

    @Override
    public void addContact(ExternalDto externalDto) {
        externalDao.addContact(externalDto);
    }

    @Override
    public void updateContact(ExternalDto externalDto) {
        externalDao.updateContact(externalDto);
    }

    @Override
    public void deleteContact(int id) {
        externalDao.deleteContact(id);
    }
    
    @Override
    public void toggleFavorite(int id) {
        ExternalDto externalDto = externalDao.getContactById(id);
        if (externalDto != null) {
            String currentStatus = externalDto.getAB_EXTERNAL_BOOKMARK();
            String newStatus = "Y".equals(currentStatus) ? "N" : "Y";
            externalDto.setAB_EXTERNAL_BOOKMARK(newStatus);
            externalDao.updateContact(externalDto);
        }
}
}