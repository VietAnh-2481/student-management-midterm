package com.vietanh.backend.service;

import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.vietanh.backend.entity.Studententity;
import com.vietanh.backend.repository.StudentRepository;

@Service
public class StudentService {

    private final StudentRepository repository;

    public StudentService(StudentRepository repository) {
        this.repository = repository;
    }

    // GET all
    public List<Studententity> getAllStudents() {
        return repository.findAll();
    }

    // GET by id
    public Studententity getStudentById(UUID id) {
        return repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Student not found with id " + id));
    }

    // CREATE
    public Studententity createStudent(Studententity student) {
        return repository.save(student);
    }

    // UPDATE
    public Studententity updateStudent(UUID id, Studententity updatedStudent) {
        Studententity student = getStudentById(id);
        student.setName(updatedStudent.getName());
        student.setAge(updatedStudent.getAge());
        student.setEmail(updatedStudent.getEmail());
        student.setPhoneNumber(updatedStudent.getPhoneNumber());
        student.setAddress(updatedStudent.getAddress());
        student.setClassName(updatedStudent.getClassName());
        return repository.save(student);
    }

    // DELETE
    public void deleteStudent(UUID id) {
        repository.deleteById(id);
    }
    //Search by name
    public List<Studententity>getStudentsByName(String name){
        return repository.findByName(name);
    }
}
