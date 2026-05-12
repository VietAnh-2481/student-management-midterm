package com.example.backend.repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.backend.entity.Student;

public interface StudentRepository extends JpaRepository<Student, UUID> {

  List<Student> findByNameContainingIgnoreCase(String name);

  Optional<Student> findByEmail(String email);
}