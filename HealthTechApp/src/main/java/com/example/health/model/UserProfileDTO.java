package com.example.health.model;

import lombok.Data;

@Data
public class UserProfileDTO {
    private String username;
    private int totalMeasurements;
    private double averageRiskPercent;
    private String averageRiskLevel;
}
