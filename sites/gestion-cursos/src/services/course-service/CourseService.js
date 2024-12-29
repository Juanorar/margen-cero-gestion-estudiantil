export const CourseService = {
  async getAllCourses() {
    return fetch('http://localhost:8000/courses').then(response => response.json());
  },
};
