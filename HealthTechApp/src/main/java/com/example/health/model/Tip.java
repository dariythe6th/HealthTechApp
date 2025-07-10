package com.example.health.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class Tip {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String level;
    private String message;
}
