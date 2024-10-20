/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import persistencia.ControladoraPersistencia;
/**
 *
 * @author agude
 */
public class Controladora {

    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    public List<Usuario> getUsuario() {
        return controlPersis.getUsuario();
    }

    public void borrarUsuario(int id){
    controlPersis.borrarUsuario(id);
    }
    
    public void editarUsuario(Usuario usu) {
        controlPersis.editarUsuario(usu);
    }

    public boolean comprobarAcceso(String usuario, String contrasenia) {
       List<Usuario> listaUsuario = new ArrayList<Usuario>();
       listaUsuario = controlPersis.getUsuario();
        for (Usuario usu:listaUsuario) {
            if (usu.getEmail().equals(usuario)) {
                if (desencriptarpassword(usu.getContrasenia_encript()).equals(contrasenia)) {
                    return true;
                }
            }
        }
        return false;
    }
    private String desencriptarpassword(String contrasenia_encript) {
        byte[] arregloByteDecodificado = Base64.getDecoder().decode(contrasenia_encript);
        String textoDecodificado = new String(arregloByteDecodificado);
        return textoDecodificado;
    }
    public String comprobarRol(String usuario, String contrasenia) {
       List<Usuario> listaUsuario = new ArrayList<Usuario>();
       listaUsuario = controlPersis.getUsuario();
        for (Usuario usu:listaUsuario) {
            if (usu.getEmail().equals(usuario)) {
                if (desencriptarpassword(usu.getContrasenia_encript()).equals(contrasenia)) {
                    return usu.getRol();
                }
            }
        }
        return "";
    }
    public Usuario traerUsuario(int id) {
        return controlPersis.traerUsuario(id); 
    }

    public void crearUsuario(String nombre, String apellido, String email, String contrasenia_encript, String rol) {
        Usuario usu = new Usuario();
       usu.setNombre(nombre);
       usu.setApellido(apellido);
       usu.setEmail(email);
       usu.setContrasenia_encript(contrasenia_encript);
       usu.setRol(rol);
       controlPersis.crearUsuario(usu);
    }

    public List<Libros> getLibro() {
        return controlPersis.getLibro();
    }

    public void crearLibro(Libros lib) {
        controlPersis.crearLibro(lib);
    }

    public Libros traerLibro(int id) {
        return controlPersis.traerLibro(id);
    }

    public void editarLibro(Libros lib) {
       controlPersis.editarLibro(lib);
    }

    public void borrarLibro(int id) {
        controlPersis.borrarLibro(id);
    }

    public List<Prestamos> getPrestamo() {
        return controlPersis.getPrestamo();
    }

    public void crearPrestamo(Libros libr, Usuario usu, String fecha_prestamo, String fecha_devolucion, String estado) {
        Prestamos pre = new Prestamos();
        pre.setId_libro(libr);
        pre.setUnUsuario(usu);
        pre.setFecha_prestamo(fecha_prestamo);
        pre.setFecha_devolucion(fecha_devolucion);
        pre.setEstado(estado);
        
        controlPersis.crearPrestamo(pre);
    }

    public String comprobarNombre(String email, String contrasenia_encript) {
        List<Usuario> listaUsuario = new ArrayList<Usuario>();
       listaUsuario = controlPersis.getUsuario();
        for (Usuario usu:listaUsuario) {
            if (usu.getEmail().equals(email)) {
                if (desencriptarpassword(usu.getContrasenia_encript()).equals(contrasenia_encript)) {
                    return usu.getNombre();
                }
            }
        }
        return "";
    }

    public int comprobarId(String email, String contrasenia_encript) {
        List<Usuario> listaUsuario = new ArrayList<Usuario>();
       listaUsuario = controlPersis.getUsuario();
        for (Usuario usu:listaUsuario) {
            if (usu.getEmail().equals(email)) {
                if (desencriptarpassword(usu.getContrasenia_encript()).equals(contrasenia_encript)) {
                    return usu.getId_usuario();
                }
            }
        }
        return 0;
    }

    public void borrarPrestamo(int id) {
        controlPersis.borrarPrestamo(id);
    }

    public Prestamos traerPrestamo(int id) {
        return controlPersis.traerPrestamo(id);
    }

//    public Datos traerDatos(int id) {
//        return controlPersis.traerDatos(id);
//    }

//    public List<Datos> getDatos() {
//        return controlPersis.getDatos();
//    }

//    public TiposEspacios traerTipoEspacio(int idTipo) {
//        return controlPersis.traerTipoEspacio(idTipo);
//    }

    public void editarPrestamos(Prestamos pre) {
        controlPersis.editarPrestamos(pre);
    }

    public List<Prestamos> miPrestamo(int idUsu) {
        List<Prestamos> listaPrestamos = new ArrayList<Prestamos>();
        List<Prestamos> listaTodosPrestamos = controlPersis.getPrestamo();
        for (Prestamos pre:listaTodosPrestamos) {
            if (pre.getUnUsuario().getId_usuario()== idUsu ) {
                    listaPrestamos.add(pre);
            }
        }
        return listaPrestamos;
    }
    
}
