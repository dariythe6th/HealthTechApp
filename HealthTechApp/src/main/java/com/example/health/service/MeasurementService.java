package com.example.health.service;

import com.example.health.model.Measurement;
import com.example.health.repository.MeasurementRepository;
import org.springframework.stereotype.Service;

@Service
public class MeasurementService {

    private final MeasurementRepository repo;

    public MeasurementService(MeasurementRepository repo) {
        this.repo = repo;
    }

    public Measurement saveMeasurement(Measurement m) {
        int riskPercent = calculateRiskPercentage(m.getType(), m.getValue());
        m.setRiskPercent(riskPercent);
        m.setRiskLevel(getRiskLevelFromPercent(riskPercent));
        return repo.save(m);
    }

    private int calculateRiskPercentage(String type, double value) {
        return switch (type.toLowerCase()) {
            case "pulse" -> {
                if (value < 50) yield 80;
                else if (value < 60) yield 40;
                else if (value <= 100) yield 20;
                else if (value <= 120) yield 60;
                else yield 90;
            }
            case "pressure" -> {
                if (value < 90) yield 70;
                else if (value <= 120) yield 20;
                else if (value <= 140) yield 50;
                else yield 85;
            }
            case "glucose" -> {
                if (value < 3.9) yield 75;
                else if (value <= 7.8) yield 25;
                else if (value <= 11.0) yield 60;
                else yield 95;
            }
            default -> 50;
        };
    }

    private String getRiskLevelFromPercent(int percent) {
        if (percent <= 33) return "low";
        else if (percent <= 66) return "medium";
        else return "high";
    }
}
