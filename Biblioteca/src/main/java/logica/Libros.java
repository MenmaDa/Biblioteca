/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.io.Serializable;
import java.util.List;
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

public class Libros implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_libro;
    private String titulo;
    private String autor;
    private String year;
    private String ISBN;
    private String genero;
    private boolean disponibilidad;
    

    public Libros() {
    }

    public Libros(int id_libro, String titulo, String autor, String year, String ISBN, String genero, boolean disponibilidad) {
        this.id_libro = id_libro;
        this.titulo = titulo;
        this.autor = autor;
        this.year = year;
        this.ISBN = ISBN;
        this.genero = genero;
        this.disponibilidad = disponibilidad;
    }

    public int getId_libro() {
        return id_libro;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getAutor() {
        return autor;
    }

    public String getYear() {
        return year;
    }

    public String getISBN() {
        return ISBN;
    }

    public String getGenero() {
        return genero;
    }

    public boolean isDisponibilidad() {
        return disponibilidad;
    }

    public void setId_libro(int id_libro) {
        this.id_libro = id_libro;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public void setDisponibilidad(boolean disponibilidad) {
        this.disponibilidad = disponibilidad;
    }
    
}
