package com.example.health.repository;

import com.example.health.model.Tip;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TipRepository extends JpaRepository<Tip, Long> {
    List<Tip> findByLevel(String level);
}
