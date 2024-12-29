import { useState, useEffect } from "react";
import { StudentCourseService } from "../../services/student-course-service/StudentCourseService";

export function UseGetAllStudentCourses() {
  const [studentCourses, setStudentCourses] = useState([]);

  useEffect(() => {
    const loadStudentCourses = async () => {
      const studentCoursesResponse = await StudentCourseService.getAllStudentCourses();
      setStudentCourses(studentCoursesResponse);
    };

    loadStudentCourses();
  }, []);

  return studentCourses;
}
