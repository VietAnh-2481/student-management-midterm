package com.example.backend.entity;

import java.time.LocalDateTime;
import java.util.UUID;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "students")
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(columnDefinition = "uniqueidentifier")
    private UUID id;

    // Hỗ trợ tiếng Việt cho cột Name
    @Column(nullable = false, columnDefinition = "nvarchar(255)")
    private String name;

    // Hỗ trợ tiếng Việt cho cột Full Name
    @Column(name = "full_name", columnDefinition = "nvarchar(255)")
    private String fullName;

    @Column(nullable = false)
    private Integer age;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(name = "phone_number")
    private String phoneNumber;

    // Hỗ trợ tiếng Việt cho cột Address
    @Column(columnDefinition = "nvarchar(500)")
    private String address;

    // Hỗ trợ tiếng Việt cho cột Class Name
    @Column(name = "class_name", columnDefinition = "nvarchar(255)")
    private String className;

    @Column(length = 50)
    private String code;

    @Column(columnDefinition = "nvarchar(100)")
    private String status;

    @Column(name = "is_active")
    private Boolean isActive = true;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    // Các cột khóa ngoại (UUID) khớp chính xác với SQL của bạn
    @Column(name = "academic_year_year")
    private UUID academicYearYear;

    @Column(name = "department_id")
    private UUID departmentId;

    @Column(name = "major_id")
    private UUID majorId;

    @Column(name = "student_classe_id")
    private UUID studentClasseId;

    @Column(name = "training_program_id")
    private UUID trainingProgramId;

    @Column(name = "user_id")
    private UUID userId;

    public Student() {
        this.createdAt = LocalDateTime.now();
    }

    // ================= GETTER & SETTER =================
    // Lưu ý: Đảm bảo tên Getter/Setter khớp chính xác để Service không bị lỗi đỏ

    public UUID getId() { return id; }
    public void setId(UUID id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public Integer getAge() { return age; }
    public void setAge(Integer age) { this.age = age; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getClassName() { return className; }
    public void setClassName(String className) { this.className = className; }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Boolean getIsActive() { return isActive; }
    public void setIsActive(Boolean isActive) { this.isActive = isActive; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public UUID getAcademicYearYear() { return academicYearYear; }
    public void setAcademicYearYear(UUID academicYearYear) { this.academicYearYear = academicYearYear; }

    public UUID getDepartmentId() { return departmentId; }
    public void setDepartmentId(UUID departmentId) { this.departmentId = departmentId; }

    public UUID getMajorId() { return majorId; }
    public void setMajorId(UUID majorId) { this.majorId = majorId; }

    public UUID getStudentClasseId() { return studentClasseId; }
    public void setStudentClasseId(UUID studentClasseId) { this.studentClasseId = studentClasseId; }

    public UUID getTrainingProgramId() { return trainingProgramId; }
    public void setTrainingProgramId(UUID trainingProgramId) { this.trainingProgramId = trainingProgramId; }

    public UUID getUserId() { return userId; }
    public void setUserId(UUID userId) { this.userId = userId; }
}