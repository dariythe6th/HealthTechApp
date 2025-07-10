package com.example.health.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Entity
@Data
public class Measurement {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String type; // pulse, pressure, glucose
    private double value;

    private int riskPercent;
    private String riskLevel;

    private LocalDateTime timestamp = LocalDateTime.now();

    private String username;
}
