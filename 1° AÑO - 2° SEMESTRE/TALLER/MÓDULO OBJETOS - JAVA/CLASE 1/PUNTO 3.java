/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
	//Paso 2. iniciar el generador aleatorio     
        GeneradorAleatorio.iniciar();  
        
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int F = 5;
        int C = 5;
        
        int[][] tabla = new int[F][C];
        int i, j;
    
        for (i=0;i<F;i++)
            for(j=0;j<C;j++)
                tabla[i][j] = GeneradorAleatorio.generarInt(30);
        
        
        //Paso 4. mostrar el contenido de la matriz en consola
        System.out.println("Elementos de la matriz numeros: ");
        for (i = 0; i < F; i++) {
          for (j = 0; j < C; j++) {
            System.out.print(tabla[i][j] + " ");
          }
          System.out.println();
        }
        
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int fila = 1;
        int suma= 0;
        for (j=0;j<C;j++)
            suma = suma + tabla[fila][j]; 
        
        System.out.print("La suma de la fila " + fila + " es: " + suma); // tener en cuenta que sería LA FILA 2 DE ARRIBA PARA ABAJO
        
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los
        // elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        
        int [] v = new int[C];
           
        
        for (j=0;j<C;j++) {
            suma = 0;
            for (i = 0; i < F; i++)
                suma = suma + tabla[i][j];
            v[j] = suma;
        }
        
        System.out.println();
        
        for (j=0; j < C; j++)
            System.out.println("La pos: " + j + " tiene " + v[j]);
        
        
        
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz.
        // En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        
        System.out.println("Ingrese un número a buscar");
        int valor = Lector.leerInt();
        
        int fencontrada = 0; 
        int cencontrada = 0;
        
        boolean encontre = false;
        
        i = 0;
        
        while (!encontre && i < F){
            j = 0;
            while (!encontre && j < C){
                System.out.println("Fila: " + i + " Columna: " + j + " Valor en la tabla: " + tabla[i][j]);
                if (valor == tabla[i][j]){
                    fencontrada = i;
                    cencontrada = j;
                    encontre = true;
                }
                j++;
             }
             i++;
        }
        
        // EL SIGUIENTE ESTA MAL PORQUE RECORRE TODO LA MATRIZ
        /*for (i=0;i<F;i++)
            for(j=0;j<C;j++)
                if (x == tabla[i][j]){
                    fencontrada = i;
                    cencontrada = j;
                    }
        */
        
        if (encontre){
            System.out.println("Ubicación: ");
            System.out.println("Fila: " + fencontrada);
            System.out.println("Columna: " + cencontrada);
        }
        else
            System.out.println("No se encontró el elemento");
        
        System.out.println();
        
    }
}
