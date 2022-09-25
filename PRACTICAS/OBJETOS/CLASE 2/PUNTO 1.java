/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.Lector;

/**
 *
 * @author Esteban
 */
public class Ej01Persona {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Persona p1;  
        p1 = new Persona();
        
        System.out.println("Ingrese su NOMBRE: ");
        p1.setNombre(Lector.leerString());
        System.out.println("Ingrese su DNI: ");
        p1.setDNI(Lector.leerInt());
        System.out.println("Ingrese su EDAD: ");
        p1.setEdad(Lector.leerInt());
        
        System.out.println(p1.toString());
        
    }
    
}
