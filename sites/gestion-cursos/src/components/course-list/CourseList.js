import { UseGetAllCourses } from "../../hooks/use-get-all-courses/GetAllCourses";
import CourseCard from "../course-card/CourseCard";

function CourseList() {
  const courses  = UseGetAllCourses();

  return (
    <div className="grid grid-cols-3 gap-2 w-full">
      {courses.map((course, index) => (
        <CourseCard courseInfo={course} key={index}/>
      ))}
    </div>
  );
}

export default CourseList;
