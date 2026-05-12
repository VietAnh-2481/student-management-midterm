package com.example.backend.service;

import com.example.backend.entity.GradeScale;
import com.example.backend.repository.GradeScaleRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.UUID;

@Service
public class GradeScaleService {
    private final GradeScaleRepository repository;

    public GradeScaleService(GradeScaleRepository repository) {
        this.repository = repository;
    }

    public List<GradeScale> getAllActiveScalies() {
        return repository.findAll().stream()
                .filter(gradeScale -> gradeScale.getIsActive() != null && gradeScale.getIsActive())
                .toList();
    }

    public GradeScale createScale(GradeScale scale) {
        return repository.save(scale);
    }

    public void deleteScale(UUID id) {
        repository.findById(id).ifPresent(scale -> {
            scale.setIsActive(false); 
            repository.save(scale);
        });
    }
}