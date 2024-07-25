package com.project.npnc.external.controller;

import com.project.npnc.external.dto.ExternalDto;
import com.project.npnc.external.service.ExternalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/external")
public class ExternalController {

    private final ExternalService externalService;

    @Autowired
    public ExternalController(ExternalService externalService) {
        this.externalService = externalService;
    }

    @GetMapping("/list")
    public String listContacts(Model model) {
        model.addAttribute("contacts", externalService.getAllContacts());
        return "external/externalList";
    }

    @PostMapping("/add")
    public String addContact(@ModelAttribute ExternalDto externalDto) {
        externalService.addContact(externalDto);
        return "redirect:/external/list";
    }

    @PostMapping("/edit")
    public String editContact(@ModelAttribute ExternalDto externalDto) {
        externalService.editContact(externalDto);
        return "redirect:/external/list";
    }

    @PostMapping("/delete")
    public String deleteContact(@RequestParam int AB_EXTERNAL_KEY) {
        externalService.removeContact(AB_EXTERNAL_KEY);
        return "redirect:/external/list";
    }
}
