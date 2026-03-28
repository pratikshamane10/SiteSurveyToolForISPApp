package com.sstapp.controller;

import com.sstapp.entity.Property;
import com.sstapp.repository.PropertyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class PropertyController {

    @Autowired
    private PropertyRepository propertyRepository;

    @GetMapping("/property")
    public String showPropertyPage(Model model) {
        model.addAttribute("properties", propertyRepository.findAll());
        return "property";
    }

    @PostMapping("/property/add")
    public String addProperty(@ModelAttribute Property property) {
        propertyRepository.save(property);
        return "redirect:/property";
    }
}
