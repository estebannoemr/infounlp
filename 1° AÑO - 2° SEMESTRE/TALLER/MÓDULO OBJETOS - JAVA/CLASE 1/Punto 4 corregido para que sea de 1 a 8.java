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
public class Ej04Mejor {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        int [][]m = new int [8][4];
        for (int i = 0; i < m.length; i++) {
            for (int j = 0; j < m[i].length; j++) {
                m[i][j]=0;
            }
        }
        int piso = 0;
        int oficina;
        while (piso != 9){
            System.out.println("Introduzca un piso (1 a 8, y 9 para cortar lectura)");
            piso = Lector.leerInt();
            if (piso != 9){
                System.out.println("Introduzca una oficina (1 a 4)");
                oficina = Lector.leerInt();
                m[piso-1][oficina-1]++;
            }
        }
        int total=0;
        System.out.println("Matriz:");
        for (int i = 0; i < m.length; i++) {
            System.out.println("Piso:"+(i+1));
            for (int j = 0; j < m[i].length; j++) {
                System.out.print("Oficina "+(j+1)+":");
                System.out.print("");
                System.out.print(m[i][j]);
                System.out.println("");
            }
            System.out.println(""); 
        }
        
        
        
    }
    
}
