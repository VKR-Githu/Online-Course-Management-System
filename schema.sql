-- Create database
CREATE DATABASE IF NOT EXISTS course_management;
USE course_management;

-- Departments table
CREATE TABLE IF NOT EXISTS Departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    UNIQUE KEY (name)
) ENGINE=InnoDB;

-- Instructors table
CREATE TABLE IF NOT EXISTS Instructors (
    inst_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    department VARCHAR(100),
    hire_date DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Students table
CREATE TABLE IF NOT EXISTS Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    enrollment_date DATE DEFAULT (CURRENT_DATE),
    major VARCHAR(100)
) ENGINE=InnoDB;

-- Courses table
CREATE TABLE IF NOT EXISTS Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    credits INT NOT NULL,
    inst_id INT NOT NULL,
    start_date DATE,
    end_date DATE,
    dept_id INT,
    FOREIGN KEY (inst_id) REFERENCES Instructors(inst_id) ON DELETE CASCADE,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Enrollments table
CREATE TABLE IF NOT EXISTS Enrollments (
    enroll_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    student_id INT NOT NULL,
    enrollment_date DATE DEFAULT (CURRENT_DATE),
    grade DECIMAL(5,2),
    status ENUM('active', 'completed', 'dropped') DEFAULT 'active',
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    UNIQUE KEY (course_id, student_id)
) ENGINE=InnoDB;

-- Assignments table
CREATE TABLE IF NOT EXISTS Assignments (
    assgn_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    due_date DATETIME NOT NULL,
    max_score INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Submissions table
CREATE TABLE IF NOT EXISTS Submissions (
    subm_id INT AUTO_INCREMENT PRIMARY KEY,
    enroll_id INT NOT NULL,
    assgn_id INT NOT NULL,
    submission_date DATETIME DEFAULT (CURRENT_TIMESTAMP),
    file_path VARCHAR(255) NOT NULL,
    score DECIMAL(5,2),
    feedback TEXT,
    FOREIGN KEY (enroll_id) REFERENCES Enrollments(enroll_id) ON DELETE CASCADE,
    FOREIGN KEY (assgn_id) REFERENCES Assignments(assgn_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Users table for authentication
CREATE TABLE IF NOT EXISTS Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('admin', 'instructor', 'student') NOT NULL,
    inst_id INT,
    student_id INT,
    FOREIGN KEY (inst_id) REFERENCES Instructors(inst_id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Create indexes for performance
CREATE INDEX idx_courses_instructor ON Courses(inst_id);
CREATE INDEX idx_enrollments_course ON Enrollments(course_id);
CREATE INDEX idx_enrollments_student ON Enrollments(student_id);
CREATE INDEX idx_assignments_course ON Assignments(course_id);
CREATE INDEX idx_submissions_assignment ON Submissions(assgn_id);
CREATE INDEX idx_submissions_enrollment ON Submissions(enroll_id);
