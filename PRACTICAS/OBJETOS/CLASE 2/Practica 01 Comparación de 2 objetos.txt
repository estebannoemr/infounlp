
package tema2;

/**
 *
 * @author vsanz
 */
public class Ej03QueImprimeA {
    public static void main(String[] args) {
        String saludo1= new String("hola");
        String saludo2= new String("hola");
        System.out.println(saludo1 == saludo2); // da FALSE porque está comparando si una instancia es = a otra instancia
        System.out.println(saludo1 != saludo2); // (referenciando otro objeto)
        System.out.println(saludo1.equals(saludo2)); // da TRUE porque está comparando el ESTADO INTERNO
    } 
}
