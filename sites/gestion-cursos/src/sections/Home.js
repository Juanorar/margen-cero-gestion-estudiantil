import CourseList from "../components/course-list/CourseList";
import DefaultLayout from "../layouts/DefaultLayout";

function Home() {
  return (
    <DefaultLayout>
      <div className="home">
        <div className="header py-6 shadow-sm bg-gray-500 mb-4">
          <p>Listado de cursos disponibles</p>
        </div>
        <div>
          <CourseList />
        </div>
      </div>
    </DefaultLayout>
  );
}

export default Home;
