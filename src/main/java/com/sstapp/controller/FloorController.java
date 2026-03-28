package com.sstapp.controller;

import com.sstapp.entity.Floor;
import com.sstapp.repository.FloorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
public class FloorController {

    @Autowired
    private FloorRepository floorRepository;

    private final String UPLOAD_DIR = "uploads/floors/";

    @GetMapping("/floor")
    public String showFloorPage(Model model) {
        model.addAttribute("floors", floorRepository.findAll());
        return "floor";
    }

    @PostMapping("/floor/upload")
    public String uploadFloor(@RequestParam("file") MultipartFile file) {
        if (!file.isEmpty()) {
            try {
                Path uploadPath = Paths.get(UPLOAD_DIR);
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                Path filePath = uploadPath.resolve(fileName);
                Files.copy(file.getInputStream(), filePath);

                Floor floor = new Floor();
                floor.setFileName(file.getOriginalFilename());
                floor.setFilePath(filePath.toString());
                floorRepository.save(floor);

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "redirect:/floor";
    }
}
