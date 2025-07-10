package com.example.health.controller;

import com.example.health.model.Tip;
import com.example.health.repository.MeasurementRepository;
import com.example.health.repository.TipRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/tips")
@CrossOrigin(origins = "*")
public class TipController {

    private final TipRepository tipRepo;
    private final MeasurementRepository measureRepo;

    public TipController(TipRepository tipRepo, MeasurementRepository measureRepo) {
        this.tipRepo = tipRepo;
        this.measureRepo = measureRepo;
    }

    @GetMapping("/{username}")
    public List<Tip> getTipsForUser(@PathVariable String username) {
        var all = measureRepo.findByUsername(username);
        if (all.isEmpty()) return List.of();
        var latest = all.get(all.size() - 1);
        return tipRepo.findByLevel(latest.getRiskLevel());
    }
}
