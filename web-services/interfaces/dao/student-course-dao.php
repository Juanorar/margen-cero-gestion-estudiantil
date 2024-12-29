<?php 

interface StudentCourseDAO {
    public function getAllStudentCourses();
    public function bulkUpdateStudentCourses($studentCourses);
}