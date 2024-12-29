import EndCicleButton from "../components/end-cicle-button/EndCicleButton";
import StudentCourseField from "../components/student-course-field/StudentCourseField";
import { StudentFieldProvider } from "../context/StudentCourseContext";
import { UseGetAllStudentCourses } from "../hooks/use-get-all-student-courses/GetAllStudentCourses";
import DefaultLayout from "../layouts/DefaultLayout";

function CloseCourse() {
  const studentCourses = UseGetAllStudentCourses();

  return (
    <StudentFieldProvider>
      <DefaultLayout>
        <div className="flex flex-col">
          {studentCourses.map((stc) => (
            <StudentCourseField key={stc.id} id={stc.id} studentCourse={stc} />
          ))}
        </div>
       <EndCicleButton />
      </DefaultLayout>
    </StudentFieldProvider>
  );
}

export default CloseCourse;
