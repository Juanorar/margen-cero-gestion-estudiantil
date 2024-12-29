import { Menubar } from "primereact/menubar";

function DefaultLayout({children}){
    const items = [
        {
          label: "Home",
          url: "/",
        },
        {
          label: "Cerrar ciclo de curso",
          url: "/cerrar-ciclo-curso",
        },
      ];

    return (
        <div>
            <h1 className="font-bold text-xl ml-6">Gestion Cursos</h1>
            <div className="w-full flex">
              <Menubar model={items} />
            </div>
            <section className="p-12 shadow-lg">
                {children}
                </section>
        </div>
    )
}

export default DefaultLayout;