package com.example.health.controller;

import com.example.health.model.Measurement;
import com.example.health.repository.MeasurementRepository;
import com.example.health.service.MeasurementService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/measurements")
@CrossOrigin(origins = "*")
public class MeasurementController {

    private final MeasurementService service;
    private final MeasurementRepository repo;

    public MeasurementController(MeasurementService service, MeasurementRepository repo) {
        this.service = service;
        this.repo = repo;
    }

    @PostMapping
    public Measurement add(@RequestBody Measurement m) {
        return service.saveMeasurement(m);
    }

    @GetMapping("/{username}")
    public List<Measurement> getByUser(@PathVariable String username) {
        return repo.findByUsername(username);
    }
}
