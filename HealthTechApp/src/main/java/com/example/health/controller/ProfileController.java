package com.example.health.controller;

import com.example.health.model.Measurement;
import com.example.health.model.UserProfileDTO;
import com.example.health.repository.MeasurementRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/profile")
@CrossOrigin(origins = "*")
public class ProfileController {

    private final MeasurementRepository measureRepo;

    public ProfileController(MeasurementRepository measureRepo) {
        this.measureRepo = measureRepo;
    }

    @GetMapping("/{username}")
    public UserProfileDTO getProfile(@PathVariable String username) {
        List<Measurement> list = measureRepo.findByUsername(username);

        UserProfileDTO dto = new UserProfileDTO();
        dto.setUsername(username);
        dto.setTotalMeasurements(list.size());

        if (!list.isEmpty()) {
            int totalRisk = list.stream().mapToInt(Measurement::getRiskPercent).sum();
            double avg = (double) totalRisk / list.size();
            dto.setAverageRiskPercent(Math.round(avg * 10.0) / 10.0);
            dto.setAverageRiskLevel(riskLevelFromAvg(avg));
        } else {
            dto.setAverageRiskPercent(0);
            dto.setAverageRiskLevel("none");
        }

        return dto;
    }

    private String riskLevelFromAvg(double avg) {
        if (avg <= 33) return "low";
        else if (avg <= 66) return "medium";
        else return "high";
    }
}
