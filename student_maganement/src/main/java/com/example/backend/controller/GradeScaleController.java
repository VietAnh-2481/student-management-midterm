package com.example.backend.controller;

import com.example.backend.entity.GradeScale;
import com.example.backend.service.GradeScaleService;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/grade-scales")
public class GradeScaleController {

    private final GradeScaleService service;

    public GradeScaleController(GradeScaleService service) {
        this.service = service;
    }

    @GetMapping
    public List<GradeScale> getAll() {
        return service.getAllActiveScalies();
    }

    @PostMapping
    public ResponseEntity<GradeScale> create(@RequestBody GradeScale scale) {
        return ResponseEntity.ok(service.createScale(scale));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable UUID id) {
        service.deleteScale(id);
        return ResponseEntity.noContent().build();
    }
}