/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author Esteban
 */
public class Ej04Personac {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        GeneradorAleatorio.iniciar();
        
        int F = 8; // cantPersonas
        int C = 5; // maxDias
        
        int fAct; // cantPersonas
        int cAct = 0; // diaactual
        
        int [] dia = new int[C];
        
        for (int i= 0; i < C; i++)
            dia[i] = 0;
        
        Persona p1;  
        p1 = new Persona();
        Persona[][] tabla = new Persona[F][C];

        
        p1.setNombre(GeneradorAleatorio.generarString(3));
        p1.setDNI(GeneradorAleatorio.generarInt(8) + 1);
        p1.setEdad(GeneradorAleatorio.generarInt(8));
        
        System.out.println("");
        
        System.out.println("Nombre: " + p1.getNombre());
        System.out.println("DNI: " + p1.getDNI());
        System.out.println("Edad: " + p1.getEdad());
        
        while (cAct < C && p1.getNombre() != "ZZZ") {
            fAct = 0;
            while (fAct < F && p1.getNombre() != "ZZZ")  {
                tabla[fAct][cAct] = p1;
                fAct++;
                dia[cAct]++;
                
                System.out.println("");
            
                p1 = new Persona();
                p1.setNombre(GeneradorAleatorio.generarString(3));
                p1.setDNI(GeneradorAleatorio.generarInt(8) + 1);
                p1.setEdad(GeneradorAleatorio.generarInt(8));

                System.out.println("");

                System.out.println("Nombre: " + p1.getNombre());
                System.out.println("DNI: " + p1.getDNI());
                System.out.println("Edad: " + p1.getEdad());
                
                if (cAct == 3 && fAct == 5)
                    p1.setNombre("ZZZ") ;
            }   
            cAct++;
        }
        //fAct--;

        //F = fAct;
        //C = cAct;
        
        
        System.out.println("Elementos de la matriz numeros: ");
        
        cAct = 0;
        while (cAct < C){
            fAct = 0;
            while (fAct < dia[cAct]){
                System.out.println("DÍA " + cAct + " Persona: " + fAct + tabla[fAct][cAct].getNombre());   
                fAct++;
            }
            System.out.println("");
            cAct++;
        }
        
        
        /*for (cAct = 0; cAct < C; cAct++) {
          for (fAct = 0; fAct < F; fAct++) {
              System.out.println("DÍA " + cAct + " Persona: " + fAct + tabla[fAct][cAct].getNombre());
              //System.out.print(tabla[fAct][cAct].toString() + " ");
          }
          System.out.println();
        }*/
        
    }
    
}
