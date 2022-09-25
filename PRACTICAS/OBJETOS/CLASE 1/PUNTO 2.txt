
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        int DF = 5;
        
        //Paso 3: Crear el vector para 15 double 
        double [] vector = new double[DF];
        
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i;
        int cant = 0;
        double suma = 0;
        double promedio;
        
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i = 0; i < DF; i++) {
            System.out.println("Ingrese altura");
            vector[i] = Lector.leerDouble();
            suma = suma + vector[i];
            System.out.println("");
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        promedio = suma / DF;
        
        System.out.println("Promedio = " + promedio);
        
        //Paso 8: Recorrer el vector calc5ulando lo pedido (cant. alturas que están por encima del promedio)
        for (i = 0; i < DF; i++)
            if (vector[i] > promedio) {
                cant = cant + 1;
            }
        
        
        //Paso 9: Informar la cantidad.
        System.out.println("Cantidad de jugadores que superan la altura promedio = " + cant);
        
    }
    
}
