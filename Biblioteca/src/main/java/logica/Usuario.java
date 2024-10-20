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

/**
 *
 * @author Dani
 */
@Entity
public class Usuario implements Serializable {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_usuario;
    private String nombre;
    private String apellido;
    private String email;
    private String contrasenia_encript;
    private String rol;

    public Usuario() {
    }

    public Usuario(int id_usuario, String nombre, String apellido, String email, String contrasenia_encript, String rol) {
        this.id_usuario = id_usuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.contrasenia_encript = contrasenia_encript;
        this.rol = rol;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public String getEmail() {
        return email;
    }

    public String getContrasenia_encript() {
        return contrasenia_encript;
    }

    public String getRol() {
        return rol;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setContrasenia_encript(String contrasenia_encript) {
        this.contrasenia_encript = contrasenia_encript;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

}
