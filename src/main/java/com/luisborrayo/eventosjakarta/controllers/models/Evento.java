package com.luisborrayo.eventosjakarta.controllers.models;

import java.time.LocalDate;

public class Evento {
    private final int id;
    private final String nombre;
    private final LocalDate fecha;
    private final String ubicacion;

    public Evento(int id, String nombre, LocalDate fecha, String ubicacion) {
        this.id = id;
        this.nombre = nombre;
        this.fecha = fecha;
        this.ubicacion = ubicacion;
    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public String getUbicacion() {
        return ubicacion;
    }
}
