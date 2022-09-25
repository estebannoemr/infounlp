        GeneradorAleatorio.iniciar();
        Persona aux = new Persona();
        Persona [] v = new Persona [15];
        
        int dl = 0;
        
        aux.setEdad(GeneradorAleatorio.generarInt(100));
        while (aux.getEdad() != 0 && dl <= 14){
            aux.setDNI(GeneradorAleatorio.generarInt(10000));
            aux.setNombre(GeneradorAleatorio.generarString(20));
            v[dl]=new Persona(aux.getNombre(), aux.getDNI(), aux.getEdad());
            dl++;
            aux.setEdad(GeneradorAleatorio.generarInt(100));
        }
        
        aux.setDNI(99999);
        int mayores = 0;
        for (int i = 0; i < dl; i++) {
            if (v[i].getEdad() > 75) {
                mayores++;
            }
            if (v[i].getDNI() < aux.getDNI()) {
                aux=v[i];
            }
        }
        System.out.println("Las personas mayores a 75 son:"+ mayores);
        System.out.println("La persona con menor dni: ");
        System.out.print(aux.toString());
