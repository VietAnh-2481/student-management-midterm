package com.example.backend.repository;

import java.math.BigDecimal;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.backend.entity.GradeScale;

public interface GradeScaleRepository extends JpaRepository<GradeScale, UUID> {
    
    @Query("SELECT g FROM GradeScale g WHERE :score >= g.minScore AND :score < g.maxScore AND g.isActive = true")
    Optional<GradeScale> findScaleForScore(BigDecimal score);
}