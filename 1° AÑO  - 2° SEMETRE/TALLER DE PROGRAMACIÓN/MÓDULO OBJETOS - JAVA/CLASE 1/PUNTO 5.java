/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;


/**
 *
 * @author Esteban
 */
public class Ej05Matrices {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        GeneradorAleatorio.iniciar();
        
        int F = 3; // MAX CLIENTE
        int C = 4;
        
        int[][] tabla = new int[F][C];
        int i, j;
        
        int puntaje;
        
        for (i = 0; i < F; i++){
                System.out.println("Ingrese el puntaje de ATENCION AL CLIENTE: ");
                puntaje = Lector.leerInt();
                tabla[i][0] = puntaje;
                
                System.out.println("Ingrese el puntaje de CALIDAD DE LA COMIDA: ");
                puntaje = Lector.leerInt();
                tabla[i][1] = puntaje;
                
                System.out.println("Ingrese el puntaje de PRECIO: ");
                puntaje = Lector.leerInt();
                tabla[i][2] = puntaje;
                
                System.out.println("Ingrese el puntaje de AMBIENTE: ");
                puntaje = Lector.leerInt();
                tabla[i][3] = puntaje;
                
            }
        
        
        System.out.println("Elementos de la matriz numeros: ");
        for (i = 0; i < F; i++) {
          for (j = 0; j < C; j++) {
            System.out.print(tabla[i][j] + " ");
          }
          System.out.println();
        }
        
        
        double promedio;
        int suma;
        
        for (j=0;j<C;j++) {
            suma = 0;
            for (i = 0; i < F; i++)
                suma = suma + tabla[i][j]; 
        
            System.out.println("La suma del aspecto " + j + " es: " + suma);
        
            promedio = (double) suma / (F);
            
            System.out.println("Promedio del aspecto " + j + " es: " + promedio);
            System.out.println("");
        }
    }
    
}
