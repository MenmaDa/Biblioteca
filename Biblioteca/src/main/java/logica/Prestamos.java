/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

/**
 *
 * @author Dani
 */
@Entity
public class Prestamos implements Serializable {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_prestamos;
    private String fecha_prestamo;
    private String fecha_devolucion;
    private String estado;

    @OneToOne
    @JoinColumn(name="id_libro")
    private Libros id_libro;
    
    @OneToOne
    private Usuario unUsuario;

    public Prestamos() {
    }

    public Prestamos(int id_prestamos, String fecha_prestamo, String fecha_devolucion, String estado, Libros id_libro, Usuario unUsuario) {
        this.id_prestamos = id_prestamos;
        this.fecha_prestamo = fecha_prestamo;
        this.fecha_devolucion = fecha_devolucion;
        this.estado = estado;
        this.id_libro = id_libro;
        this.unUsuario = unUsuario;
    }

    public int getId_prestamos() {
        return id_prestamos;
    }

    public String getFecha_prestamo() {
        return fecha_prestamo;
    }

    public String getFecha_devolucion() {
        return fecha_devolucion;
    }

    public String getEstado() {
        return estado;
    }

    public Libros getId_libro() {
        return id_libro;
    }

    public Usuario getUnUsuario() {
        return unUsuario;
    }

    public void setId_prestamos(int id_prestamos) {
        this.id_prestamos = id_prestamos;
    }

    public void setFecha_prestamo(String fecha_prestamo) {
        this.fecha_prestamo = fecha_prestamo;
    }

    public void setFecha_devolucion(String fecha_devolucion) {
        this.fecha_devolucion = fecha_devolucion;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public void setId_libro(Libros id_libro) {
        this.id_libro = id_libro;
    }

    public void setUnUsuario(Usuario unUsuario) {
        this.unUsuario = unUsuario;
    }

    
    
    
}
