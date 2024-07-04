module aptosz3::referencias {
    use std::debug::print;
    use std::string::utf8;

    // Declara 1 valor entero constante con cualquier valor que quieras.
    const Entero1: u8 = 15;
    fun practica() {
        // Tipo no referenciado:
        let a = 1;
        print(&a); // Para imprimir un tipo no referenciado necesitamos agregar la referencia al valor.

        // Tipo referenciado:
        let b = 7;
        let c : &u64 = &b;
        print(c); // Dado a que c ya fue declarado como tipo referenciado, no es necesario especificar la referencia.
    
        // Inmutable
        let original: u64 = 1;
        let copia_de_original = original; // Nota que no estamos pasando la referencia aqui.
        print(&copia_de_original); // Pero aqui si.

        let otra_copia = &original;
        print(otra_copia);

        // Mutable
        let copia_mutable = &mut original; 
        print(copia_mutable); // De nuevo, no es necesario pasar la referencia.

        *copia_mutable = 20;
        print(copia_mutable);
        print(&original); // Porque ahora el original es 20 si lo que modificamos fue la copia mutable? 

        // reto
        print(&utf8(b"** RETOS **"));

        // Declara 1 variable entera con cualquier valor que quieras.
        let entero2 = 46;

        // Imprime ambos numeros.
        print(&Entero1);
        print(&entero2);

        // Declara una variable que compare si estos numeros son iguales.
        let comparacion1 = Entero1 == entero2;

        // Declara una variable que compare si el 1er numero es mayor que el segundo.
        let comparacion2 = Entero1 > entero2;

        // Declara una variable que compare si las 2 comparaciones anteriores son verdaderas.
        let comparacion3 = comparacion1 && comparacion2;

        // Imprime el resultado de esta ultima variable.
        print(&comparacion3);
    }

    #[test]
    fun prueba() {
        practica();
    }
}

