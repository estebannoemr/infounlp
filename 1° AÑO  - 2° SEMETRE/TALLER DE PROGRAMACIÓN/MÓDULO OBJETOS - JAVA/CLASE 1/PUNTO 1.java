public class Ej01Tabla2 {

    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        int DF = 11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;
        for (i=0;i<DF;i++) 
            tabla2[i]=2*i;
        System.out.println("2x" + "5" + "="+ tabla2[5]);

        GeneradorAleatorio.iniciar();
        
        
        int x; //= (GeneradorAleatorio.generarInt(12));
        x = (GeneradorAleatorio.generarInt(12));
        
        while (x != 11) {
            System.out.println(x);
            System.out.println(x + " x 2 = " + tabla2[x]);
            //System.out.println(x);
            x = (GeneradorAleatorio.generarInt(12));
            System.out.println("");
        }
    }
    
}
