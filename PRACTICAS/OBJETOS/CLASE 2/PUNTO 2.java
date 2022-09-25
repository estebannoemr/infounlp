/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author Esteban
 */
public class Ej02Persona {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        GeneradorAleatorio.iniciar();
        
        
        int DF = 15;
        int DL = 0;
        
        Persona p1;  
        p1 = new Persona();
        
        Persona [] v = new Persona[DF];
        
        p1.setNombre(GeneradorAleatorio.generarString(10));
        p1.setDNI(GeneradorAleatorio.generarInt(8) + 1);
        p1.setEdad(GeneradorAleatorio.generarInt(8));
        
        System.out.println("");
        
        System.out.println("Nombre: " + p1.getNombre());
        System.out.println("DNI: " + p1.getDNI());
        System.out.println("Edad: " + p1.getEdad());
        
        while (DL < DF && p1.getEdad() != 0) {      
            v[DL] = p1;
            DL++;
            
            System.out.println("");
            
            p1 = new Persona();
            p1.setNombre(GeneradorAleatorio.generarString(15));
            p1.setDNI(GeneradorAleatorio.generarInt(8) + 1);
            p1.setEdad(GeneradorAleatorio.generarInt(8));

            System.out.println("");

            System.out.println("Nombre: " + p1.getNombre());
            System.out.println("DNI: " + p1.getDNI());
            System.out.println("Edad: " + p1.getEdad());
        }
        DL--;
        
        int i;
        for (i=0; i<=DL; i++) 
            System.out.println(v[i].toString());
        
        System.out.println("");
        
        //MODULO B
        int cant = 0;
        for (i=0; i<=DL; i++) 
            if (v[i].getEdad() > 5) //if (v[i].getEdad() > 65)
                cant++;
        
        //System.out.println("Cantidad de personas mayores a 65 años: " + cant);
        System.out.println("Cantidad de personas mayores a 5 años: " + cant);
        
        System.out.println("");
        
        //MODULO C}
        Persona p2;
        p2 = new Persona();
        
        int MinDNI = 9999;
        for (i=0; i<=DL; i++) 
            if (v[i].getDNI() < MinDNI){
                MinDNI = v[i].getDNI();
                p2 = v[i];
            }
        
        System.out.println("Persona con Menor DNI: " + p2.toString());
    }
    
}




/*System.out.println("Ingrese su NOMBRE: ");
System.out.println("Ingrese su DNI: ");
System.out.println("Ingrese su EDAD: ");


*/
