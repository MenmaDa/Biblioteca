/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
//import logica.Datos;
import logica.Libros;
import logica.Prestamos;
//import logica.TiposEspacios;
import logica.Usuario;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author agude
 */
public class ControladoraPersistencia {
    UsuarioJpaController usuJPA = new UsuarioJpaController();
    LibrosJpaController libJPA = new LibrosJpaController();
    PrestamosJpaController preJPA = new PrestamosJpaController();
//    DatosJpaController datJPA = new DatosJpaController();
//    TiposEspaciosJpaController tipespJPA= new TiposEspaciosJpaController();
    
    public List<Usuario> getUsuario() {
        return usuJPA.findUsuarioEntities();
    }
    
    
    public void crearUsuario(Usuario usu) {
        String tmp = encriptarpassword(usu.getContrasenia_encript());
        usu.setContrasenia_encript(tmp);
        usuJPA.create(usu);
    }
    
    public void editarUsuario(Usuario usu) {
        String tmp = encriptarpassword(usu.getContrasenia_encript());
        usu.setContrasenia_encript(tmp);
        try {
            usuJPA.edit(usu);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex );
        }
    }
    public void borrarUsuario(int id) {
        try {
            usuJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex );
        }
    }     
    
    public Usuario traerUsuario(int id) {
        Usuario usuEnviar= usuJPA.findUsuario(id);
        String tmp = desencriptarpassword(usuEnviar.getContrasenia_encript());
        usuEnviar.setContrasenia_encript(tmp);
        return usuEnviar;
    }

    public List<Libros> getLibro() {
        return libJPA.findLibrosEntities();
    }

    public void crearLibro(Libros lib) {
        libJPA.create(lib);
    }

    public Libros traerLibro(int id) {
        return libJPA.findLibros(id);
    }

    public void editarLibro(Libros lib) {
        try {
            libJPA.edit(lib);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarLibro(int id) {
        try {
            libJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Prestamos> getPrestamo() {
        return preJPA.findPrestamosEntities();
    }

    public void crearPrestamo(Prestamos pre) {
        preJPA.create(pre);
    }

    public void borrarPrestamo(int id) {
        try {
            preJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Prestamos traerPrestamo(int id) {
        return preJPA.findPrestamos(id);
    }

//    public Datos traerDatos(int id) {
//        return datJPA.findDatos(id);
//    }
//
//    public List<Datos> getDatos() {
//        return datJPA.findDatosEntities();
//    }

    private String encriptarpassword(String contrasenia_encript) {
       String codigo = Base64.getEncoder().encodeToString(contrasenia_encript.getBytes());
       return codigo;
    }

    private String desencriptarpassword(String contrasenia_encript) {
        byte[] arregloByteDecodificado = Base64.getDecoder().decode(contrasenia_encript);
        String textoDecodificado = new String(arregloByteDecodificado);
        return textoDecodificado;
    }

//    public TiposEspacios traerTipoEspacio(int idTipo) {
//        return tipespJPA.findTiposEspacios(idTipo);
//    }

    public void editarPrestamos(Prestamos pre) {
        try {
            preJPA.edit(pre);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
