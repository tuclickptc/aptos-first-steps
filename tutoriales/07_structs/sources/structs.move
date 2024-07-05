module aptosz3::cadenas {
    use std::debug::print;
    use std::string_utils::debug_string;
    use std::string::{String,utf8};
    use std::option::{Option, some};

    // Haz una nota mental de `has drop`. Lo veremos mas adelante. Por lo pronto no es necesario que lo entiendas.
    struct Autor has drop { // Declaramos un struct. Es un tipo personalizado que podemos usar en el resto de nuestro codigo.
        nombre: String, // Este tipo solo tiene un campo.
    }

    struct Libro { // Ahora creamos un tipo con mas campos.
        titulo: String,
        autor: Autor, // Nota que usamos el tipo que declaramos arriba.
        publicado: u16,
        tiene_audiolibro: bool,
        edicion: Option<u16>, // Que es esto?
    } // Nota que no cerramos con ;

    // Crea un `struct` de una Persona con los campos que gustes. Al menos 3. 
    struct Persona has drop {
        nombre: String,
        apellido: String,
        edad: u16,
    }

    // Crea un `struct` de una Clase (una clase de una escuela) con los campos que gustes.
    // Debe incluir el `struct` Persona en alguno de los campos. Por ejemplo en un campo llamado maestro
    struct Clase has drop {
        materia: String,
        profesor: Persona,
        activa: bool
    }

    // Crea un `struct` de una Escuela con los campos que gustes.
    // Debe incluir un `vector` de Clases.
    // Usa esos `struct` de manera que tengas una Escuela con un `vector` de Clases, el cual incluya al menos 2 clases de 2 diferentes maestros.
    struct Escuela has drop {
    nombre: String,
    tipo: String,
        clases: vector<Clase>,
        fundacion: u16,
    }

    fun practica() {
        
        let autor = Autor { nombre: utf8(b"Paulo Cohelo") };
        print(&debug_string(&autor)); // Nota que usamos debug_string de la leccion anterior para imprimir el struct completo.
        // Resultado:
        // [debug] "0x5a6f6e612054726573::cadenas::Autor {
        //   nombre: \"Paulo Cohelo\"
        // }"

        let libro = Libro {
            titulo: utf8(b"El Alquimista"), // Usamos , similar a cuando declaramos un objeto en otros lenguajes.
            autor, // Como la variable que declaramos arriba tiene el mismo nombre que la propiedad, no es necesario poner algo como autor: autor,
            publicado: 1988u16, // Recuerda que podemos especificar el tipo del numero literalmente
            tiene_audiolibro: true,
            edicion: some(1), // O dejar que el compilador lo infiera
        }; // Tenemos que cerrar el bloque aqui.

        print(&debug_string(&libro)); // Nota la impresion del campo Autor.
        //[debug] "0x5a6f6e612054726573::cadenas::Libro {
        //  titulo: \"El Alquimista\",
        //  autor: 0x5a6f6e612054726573::cadenas::Autor {
        //    nombre: \"Paulo Cohelo\"
        //  },
        //  publicado: 1988,
        //  tiene_audiolibro: true,
        //  edicion: Some(1)
        //}"

        // Podemos acceder a valores especificos de la estructura.
        print(&libro.titulo); 
        print(&libro.autor.nombre);

        // Tambien podemos desestructurar un struct.
        let Libro { titulo: _, autor: _ , publicado, tiene_audiolibro, edicion:_ } = libro; 
        // Basicamente tomamos un struct y lo descomponemos en variables, para que puedan ser usadas despues, por ejemplo:
        print(&publicado); // Resultado: [debug] 1988
        print(&tiene_audiolibro); // Resultado: [debug] true

        // Nota que estamos ignorando ciertos valores de esta forma: titulo: _, para que no se creen variables para ellos.
        // Lo que significa, que este codig fallaria: print(&titulo);
        // Dado a que no creamos una varable para ese valor, simplemente lo ignoramos.

        let autor = Autor { nombre: utf8(b"J. K. Rowling") }; // Shadowing de la variable autor.
        let Autor { nombre: otro_nombre } = autor; // Al desestructurar puedes cambiar el nombre de la variable.
        print(&otro_nombre); // Resultado: [debug] "J. K. Rowling"

        let Autor { nombre } = Autor { nombre: utf8(b"John Green") }; // Podemos incluso asignar valores y desestructurarlos al mismo tiempo:
        print(&nombre); // Resultado: [debug] "John Green"

        // O crear nuevas referencias:
        let autor = Autor { nombre: utf8(b"Octavio Paz") };
        let Autor { nombre } = &autor; // Referencia inmutable
        print(nombre); // Ahora nombre es un tipo referenciado. Resultado: [debug] "Octavio Paz"

        let autor = Autor { nombre: utf8(b"Carlos Fuentes") };
        let Autor { nombre } = &mut autor; // Creamos una referencia mutable
        print(nombre); // Resultado: [debug] "Carlos Fuentes"
        *nombre = utf8(b"Edgar Allan Poe"); // Como es mutable podemos modificar el valor
        print(nombre); // Resultado: [debug] "Edgar Allan Poe"

        // Referencias
        let autor = Autor { nombre: utf8(b"George Orwell") };
        let autor_ref = &autor;

        let lectura = autor_ref.nombre; // Podemos leer un valor a traves de la referencia.
        print(&lectura); // Resultado: [debug] "George Orwell"

        let modificable = &mut autor.nombre;
        *modificable = utf8(b"Charles Dickens"); // Y podemos modificarla
        print(modificable); // Resultado: [debug] "Charles Dickens"
        print(&debug_string(&autor)); // Estamos haciendo una referencia al valor directamente, por lo que:
        // Resultado:
        // [debug] "0x5a6f6e612054726573::cadenas::Autor {
        //   nombre: \"Charles Dickens\"
        // }"

        // Recuerda que puedes obtener informacion sobre las demos operaciones en:
        // https://move-language.github.io/move/structs-and-resources.html

        print(&utf8(b"** RETO **"));

        //* Imprime la variable que crees de la Escuela en consola usando `debug_string`. Debera de imprimir todas los campos.
        let profesor1 = Persona {
            nombre: utf8(b"Jorge"),
            apellido: utf8(b"Ortega"),
            edad: 46u16
        };

        let profesor2 = Persona {
            nombre: utf8(b"Dulce"),
            apellido: utf8(b"Martinez"),
            edad: 36u16
        };

        let clase1 = Clase {
            materia: utf8(b"Literatura"),
            profesor: profesor1,
            activa: false
        };

        let clase2 = Clase {
            materia: utf8(b"Historia"),
            profesor: profesor2,
            activa: true
        };

        let escuela = Escuela {
            nombre: utf8(b"Escuela los milagros"),
            tipo: utf8(b"Primaria"),
            clases: vector[clase1, clase2],
            fundacion: 1910u16
        };

        print(&debug_string(&escuela));
    }

    #[test]
    fun prueba() {
        practica();
    }
}
