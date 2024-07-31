package com.project.npnc.external.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.npnc.external.dto.ExternalDto;
import com.project.npnc.external.service.ExternalService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/external")
public class ExternalController {

    @Autowired
    private ExternalService externalService;

    @GetMapping("/list")
    public String listContacts(HttpServletRequest request) {
        List<ExternalDto> contacts = externalService.getAllContacts();
        request.setAttribute("contacts", contacts);
        return "external/externalList";
    }

    @PostMapping("/add")
    public String addContact(ExternalDto externalDto) {
        externalService.addContact(externalDto);
        return "redirect:/external/list";
    }

    @PostMapping("/edit")
    public String editContact(ExternalDto externalDto) {
        externalService.updateContact(externalDto);
        return "redirect:/external/list";
    }

    @PostMapping("/delete")
    public String deleteContact(@RequestParam("AB_EXTERNAL_KEY") int id) {
        externalService.deleteContact(id);
        return "redirect:/external/list";
    }

    @PostMapping("/toggleFavorite")
    @ResponseBody
    public String toggleFavorite(ExternalDto externalDto) {
        try {
            //externalService.updateContact(externalDto);
            return "success";
        } catch (Exception e) {
            return "error";
        }
    }

    @GetMapping("/get/{id}")
    @ResponseBody
    public ExternalDto getContactById(@PathVariable("id") int id) {
        return externalService.getContactById(id);
    }
}
