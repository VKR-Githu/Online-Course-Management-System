USE course_management;

-- Insert departments
INSERT INTO Departments (name, location) VALUES
('Computer Science', 'Building A, Room 101'),
('Mathematics', 'Building B, Room 205'),
('Physics', 'Building C, Room 310');

-- Insert instructors
INSERT INTO Instructors (name, email, department, hire_date, dept_id) VALUES
('Dr. Smith', 'smith@university.edu', 'Computer Science', '2015-08-15', 1),
('Prof. Johnson', 'johnson@university.edu', 'Mathematics', '2010-05-20', 2),
('Dr. Williams', 'williams@university.edu', 'Physics', '2018-01-10', 3);

-- Insert students
INSERT INTO Students (name, email, enrollment_date, major) VALUES
('Alice Brown', 'alice@student.edu', '2022-09-01', 'Computer Science'),
('Bob Davis', 'bob@student.edu', '2022-09-01', 'Mathematics'),
('Charlie Wilson', 'charlie@student.edu', '2023-01-15', 'Physics'),
('Diana Moore', 'diana@student.edu', '2021-09-01', 'Computer Science');

-- Insert courses
INSERT INTO Courses (title, description, credits, inst_id, start_date, end_date, dept_id) VALUES
('Introduction to Programming', 'Basic programming concepts using Python', 3, 1, '2023-09-05', '2023-12-15', 1),
('Calculus I', 'Differential and integral calculus', 4, 2, '2023-09-05', '2023-12-15', 2),
('Classical Mechanics', 'Newtonian mechanics and kinematics', 3, 3, '2023-09-05', '2023-12-15', 3),
('Database Systems', 'Relational database design and SQL', 3, 1, '2024-01-10', '2024-04-20', 1);

-- Insert enrollments
INSERT INTO Enrollments (course_id, student_id, enrollment_date, status) VALUES
(1, 1, '2023-09-01', 'active'),
(1, 4, '2023-09-01', 'active'),
(2, 2, '2023-09-01', 'active'),
(3, 3, '2023-09-01', 'active'),
(1, 2, '2023-09-01', 'active'),
(2, 1, '2023-09-01', 'active');

-- Insert assignments
INSERT INTO Assignments (course_id, title, description, due_date, max_score) VALUES
(1, 'Python Basics', 'Complete the Python exercises', '2023-09-20 23:59:59', 100),
(1, 'Functions and Loops', 'Implement various functions', '2023-10-05 23:59:59', 100),
(2, 'Limits and Continuity', 'Solve the problems', '2023-09-25 23:59:59', 100),
(3, 'Newtonian Mechanics', 'Problem set on Newton\'s laws', '2023-09-30 23:59:59', 100);

-- Insert submissions
INSERT INTO Submissions (enroll_id, assgn_id, file_path, score, feedback) VALUES
(1, 1, '/submissions/1_1.py', 95, 'Excellent work!'),
(2, 1, '/submissions/4_1.py', 88, 'Good job, but needs more comments'),
(3, 3, '/submissions/2_3.pdf', 92, 'Well done'),
(4, 4, '/submissions/3_4.pdf', 85, 'Check your calculations on problem 3');

-- Create user accounts
INSERT INTO Users (username, email, password_hash, role, inst_id, student_id) VALUES
-- Admin
('admin', 'admin@university.edu', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrYV8X6U29JXH8r6vTMS7dRj1l1qF0a', 'admin', NULL, NULL),
-- Instructors
('smith', 'smith@university.edu', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrYV8X6U29JXH8r6vTMS7dRj1l1qF0a', 'instructor', 1, NULL),
('johnson', 'johnson@university.edu', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrYV8X6U29JXH8r6vTMS7dRj1l1qF0a', 'instructor', 2, NULL),
('williams', 'williams@university.edu', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrYV8X6U29JXH8r6vTMS7dRj1l1qF0a', 'instructor', 3, NULL),
-- Students
('alice', 'alice@student.edu', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrYV8X6U29JXH8r6vTMS7dRj1l1qF0a', 'student', NULL, 1),
('bob', 'bob@student.edu', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrYV8X6U29JXH8r6vTMS7dRj1l1qF0a', 'student', NULL, 2),
('charlie', 'charlie@student.edu', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrYV8X6U29JXH8r6vTMS7dRj1l1qF0a', 'student', NULL, 3),
('diana', 'diana@student.edu', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrYV8X6U29JXH8r6vTMS7dRj1l1qF0a', 'student', NULL, 4);
