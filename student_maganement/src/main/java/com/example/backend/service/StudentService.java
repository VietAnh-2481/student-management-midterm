package com.example.backend.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.example.backend.entity.Student;
import com.example.backend.repository.StudentRepository;

@Service
public class StudentService {

    private final StudentRepository repository;

    public StudentService(StudentRepository repository) {
        this.repository = repository;
    }

    // GET ALL
    public List<Student> getAllStudents() {
        return repository.findAll();
    }

    // SEARCH
    public List<Student> getStudentsByName(String name) {

        if (name == null || name.trim().isEmpty()) {
            return repository.findAll();
        }

        return repository.findByNameContainingIgnoreCase(name);
    }

    // GET BY ID
    public Student getStudentById(UUID id) {

        return repository.findById(id)
                .orElseThrow(() -> new RuntimeException(
                        "Không tìm thấy sinh viên với ID: " + id));
    }

    // CREATE
    public Student createStudent(Student student) {

        validateStudent(student);

        // CHECK EMAIL
        if (repository.findByEmail(student.getEmail()).isPresent()) {
            throw new RuntimeException("Email đã tồn tại!");
        }

        student.setCreatedAt(LocalDateTime.now());

        return repository.save(student);
    }

    // UPDATE
    public Student updateStudent(UUID id, Student updatedStudent) {

        validateStudent(updatedStudent);

        Student student = getStudentById(id);

        student.setName(updatedStudent.getName());
        student.setAge(updatedStudent.getAge());
        student.setEmail(updatedStudent.getEmail());
        student.setPhoneNumber(updatedStudent.getPhoneNumber());
        student.setAddress(updatedStudent.getAddress());
        student.setClassName(updatedStudent.getClassName());
        student.setFullName(updatedStudent.getFullName());
        student.setCode(updatedStudent.getCode());
        student.setStatus(updatedStudent.getStatus());
        student.setIsActive(updatedStudent.getIsActive());

        return repository.save(student);
    }

    // DELETE
    public void deleteStudent(UUID id) {

        Student student = getStudentById(id);

        repository.delete(student);
    }

    // VALIDATION
    private void validateStudent(Student student) {

        if (student.getName() == null ||
                student.getName().trim().isEmpty()) {

            throw new RuntimeException("Tên không được để trống");
        }

        if (student.getEmail() == null ||
                student.getEmail().trim().isEmpty()) {

            throw new RuntimeException("Email không được để trống");
        }

        if (student.getAge() == null ||
                student.getAge() <= 0) {

            throw new RuntimeException("Tuổi phải lớn hơn 0");
        }
    }
}