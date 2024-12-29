import { useState } from "react";
import { useStudentCourseFieldContext } from "../../context/StudentCourseContext";

function StudentCourseField({ id, studentCourse }) {
  const { updateFieldsValue } = useStudentCourseFieldContext();
  const [fields, setFields] = useState({
    nota_final: 0,
    aprobado: 0,
    observaciones: "",
  });

  const handleChange = (e) => {
    console.log(e)
    const { name, value } = e.target;
    const updatedFields = { ...fields, [name]: value };
    setFields(updatedFields);
    updateFieldsValue(id, updatedFields)
  };


  return (
    <div className="grid grid-cols-4 gap-2 m-4">
        <p>{studentCourse.primer_nombre + ' ' + studentCourse.primer_apellido}</p>
      <label>
        Nota final
        <input
        className="text-center"
          type="text"
          name="nota_final"
          placeholder="Nota"
          onChange={handleChange}
        />
      </label>
      <label>
        Aprobado
        <input
        className="ml-4"
          type="text"
          name="aprobado"
          onChange={handleChange}
        />
      </label>
        <textarea
          placeholder="Escribir las observaciones"
          name="observaciones"
          onChange={handleChange}
        />
    </div>
  );
}

export default StudentCourseField;
