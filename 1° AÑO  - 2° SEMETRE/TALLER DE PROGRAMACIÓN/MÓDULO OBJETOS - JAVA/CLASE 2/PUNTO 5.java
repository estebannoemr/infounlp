/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author Esteban
 */
public class Ej05Partido {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        GeneradorAleatorio.iniciar();
        
        
        int DF = 3;
        int DL = 0;
        
        Partido p;  
        p = new Partido();
        
        Partido [] v = new Partido[DF];
        
        System.out.println("Ingrese equipo LOCAL: ");
        p.setLocal(Lector.leerString());
        System.out.println("Ingrese equipo VISITANTE: ");
        p.setVisitante(Lector.leerString());
        p.setGolesLocal(GeneradorAleatorio.generarInt(7)+1);
        p.setGolesVisitante(GeneradorAleatorio.generarInt(5)+1);
            
        System.out.println("");
        
        System.out.println("Local: " + p.getLocal());
        System.out.println("Visitante: " + p.getVisitante());
        System.out.println("Goles local: " + p.getGolesLocal());
        System.out.println("Goles visitante: " + p.getGolesVisitante());
        System.out.println("GANADOR: " + p.getGanador());
        
        
        while ((DL < DF) && (!"ZZZ".equals(p.getVisitante()))) {
            v[DL] = p;
            DL++;
            
            System.out.println("");
            
            if (DL < DF) {
                p = new Partido();
                System.out.println("Ingrese equipo LOCAL: ");
                p.setLocal(Lector.leerString());
                System.out.println("Ingrese equipo VISITANTE: ");
                p.setVisitante(Lector.leerString());
                p.setGolesLocal(GeneradorAleatorio.generarInt(7)+1);
                p.setGolesVisitante(GeneradorAleatorio.generarInt(5)+1);

                System.out.println("");

                System.out.println("Local: " + p.getLocal());
                System.out.println("Visitante: " + p.getVisitante());
                System.out.println("Goles local: " + p.getGolesLocal());
                System.out.println("Goles visitante: " + p.getGolesVisitante());
                System.out.println("GANADOR: " + p.getGanador());
            }
        }
        DL--;
        
        System.out.println("");
        
        int i;
        for (i=0; i <= DL; i++) {
            System.out.println(v[i].getLocal() + ": " + v[i].getGolesLocal() + "  VS  " + v[i].getVisitante() + ": " + v[i].getGolesVisitante());
            System.out.println("");
        }
        
        int cantRiver = 0;
        int cantGolesBoca = 0;
        for (i=0; i<= DL; i++){
            if ("River".equals(v[i].getGanador()))
                cantRiver++;
            if ("Boca".equals(v[i].getLocal()))
                cantGolesBoca = cantGolesBoca + v[i].getGolesLocal();
        }
        
        System.out.println("Cantidad de partidos que ganó River: " + cantRiver);
        
        System.out.println("Cantidad total de goles que realizó Boca jugando de local: " + cantGolesBoca);
        
    }
    
}


/*

        p.setLocal(GeneradorAleatorio.generarString(10));
        p.setVisitante(GeneradorAleatorio.generarString(10));
        p.setGolesLocal(GeneradorAleatorio.generarInt(8));
        p.setGolesVisitante(GeneradorAleatorio.generarInt(5));
        
        System.out.println(p.getGanador());
                
        System.out.println("");
        
        System.out.println(p.getLocal());
        System.out.println(p.getVisitante());
        System.out.println(p.getGolesLocal());
        System.out.println(p.getGolesVisitante());


*/
