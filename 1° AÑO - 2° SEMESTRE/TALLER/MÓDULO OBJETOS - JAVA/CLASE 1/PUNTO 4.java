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
public class Ej04Matrices {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        GeneradorAleatorio.iniciar();
        
        int F = 8;
        int C = 4;
        
        int[][] tabla = new int[F][C];
        int i, j;
        
        for (i=0;i<F;i++)
            for(j=0;j<C;j++)
                tabla[i][j] = 0;
        
        
        
        int fila, columna;
        
        System.out.println("Ingrese número de piso: ");
        fila = Lector.leerInt();
        
        while (fila != 9) {
            if (fila != 9) { 
                System.out.println("Ingrese oficina del piso: ");
                columna = Lector.leerInt();
            
                tabla[fila][columna] = tabla[fila][columna] + 1;
                
            }
            System.out.println();
            
            System.out.println("Ingrese número de piso: ");
            fila = Lector.leerInt();
            
        }
        
        
        
        System.out.println("Elementos de la matriz numeros: ");
        for (i = 0; i < F; i++) {
          for (j = 0; j < C; j++) {
            System.out.print(tabla[i][j] + " ");
          }
          System.out.println();
        }
        
        
    }
    
}
