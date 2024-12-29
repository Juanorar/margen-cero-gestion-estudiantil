import { useStudentCourseFieldContext } from "../../context/StudentCourseContext";
import { StudentCourseService } from "../../services/student-course-service/StudentCourseService";

function EndCicleButton() {
  const { fieldsData } = useStudentCourseFieldContext();

  const handleEndCicle = () => {
    StudentCourseService.bulkUpdateClose(fieldsData);
  }
  return (
    <div className="flex justify-end">
      <button
        type="button"
        className="bg-gray-100 p-4"
        onClick={handleEndCicle}
      >
        Cerrar ciclo
      </button>
    </div>
  );
}

export default EndCicleButton;
