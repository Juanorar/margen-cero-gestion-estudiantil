
function CourseCard({courseInfo}) {
  return (
    <div className="shadow-md bg-gray-200">
        <div className="w-full font-bold">
            { courseInfo.nombre }
        </div>
        <div className="shadow-md">
            { courseInfo.descripcion }
        </div>
    </div>
  );
}

export default CourseCard;
