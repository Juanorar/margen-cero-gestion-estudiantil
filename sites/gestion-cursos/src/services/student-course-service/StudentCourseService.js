export const StudentCourseService = {
  getAllStudentCourses() {
    return fetch("http://localhost:8000/student-courses").then((response) =>
      response.json()
    );
  },

  bulkUpdateClose(studentCourses){
    const updates = Object.entries(studentCourses).map(stdc => ({id: stdc[0], nota_final: parseFloat(stdc[1].nota_final), aprobado: stdc[1].aprobado, observaciones: stdc[1].observaciones}))

    return fetch("http://localhost:8000/student-courses", {
      method: 'PUT',
      body: JSON.stringify(updates)
    }).then((response) =>
      response.json()
    );
  }
};
