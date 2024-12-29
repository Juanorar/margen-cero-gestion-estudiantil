import "./App.css";
import "primereact/resources/themes/lara-light-cyan/theme.css";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Home from "./sections/Home";
import { PrimeReactProvider } from "primereact/api";
import CloseCourse from "./sections/CloseCourse";

function App() {
  return (
    <PrimeReactProvider>
      <Router>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/cerrar-ciclo-curso" element={<CloseCourse />} />
        </Routes>
      </Router>
    </PrimeReactProvider>
  );
}

export default App;
