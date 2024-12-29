import { useState, useEffect } from "react";
import { CourseService } from "../../services/course-service/CourseService";

export function UseGetAllCourses() {
  const [courses, setCourses] = useState([]);

  useEffect(() => {
    const loadCourses = async () => {
      const coursesResponse = await CourseService.getAllCourses();
      setCourses(coursesResponse);
    };

    loadCourses();
  }, []);

  return courses;
}
