import React, { createContext, useState, useContext } from "react";

const StudentFieldContext = createContext();

export const StudentFieldProvider = ({ children }) => {
  const [fieldsData, setFieldsData] = useState({});

  const updateFieldsValue = (id, values) => {
    setFieldsData((prev) => ({
      ...prev,
      [id]: values,
    }));
  };

  return (
    <StudentFieldContext.Provider value={{ fieldsData, updateFieldsValue }}>
      {children}
    </StudentFieldContext.Provider>
  );
};

export const useStudentCourseFieldContext = () => {
  return useContext(StudentFieldContext);
};
