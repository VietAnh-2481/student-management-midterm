package com.vietanh.backend.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vietanh.backend.entity.Studententity;

public interface StudentRepository extends JpaRepository<Studententity, UUID> {
  List<Studententity>findByName(String name);
}
