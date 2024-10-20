/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.biblioteca;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import logica.Usuario;
import logica.Controladora;
//import logica.Datos;
import logica.Libros;
//import logica.TiposEspacios;


@WebServlet(name = "svLibro", urlPatterns = {"/svLibro"})
public class svLibro extends HttpServlet {
    
    Controladora control = new Controladora();
    private String[] extens ={".jpg",".png",".jpeg"};
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Libros>listaLibros = new ArrayList<Libros>();
        listaLibros= control.getLibro();
        HttpSession misession = request.getSession();
        misession.setAttribute("listaLibros", listaLibros);
        response.sendRedirect("verLibros.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
//        String name = request.getParameter("imagen");
//        Part part =request.getPart("imagen");
//       
//        if (part == null) {
//            System.out.println("No se selecciono archivo");
//            return;
//        }
//        if (isExtension(part.getSubmittedFileName(),extens)) {
//            Datos datos = new Datos();
//            datos = control.traerDatos(1);
//            String pathFiles = datos.getRuta();
//            File uploads = new File(pathFiles);
//            
//            String photo = saveFile(part,uploads);
            
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String ISBN = request.getParameter("ISBN");
        String genero = request.getParameter("genero");
        boolean disponibilidad = Boolean.parseBoolean(request.getParameter("disponibilidad"));
        //        String name = request.getParameter("imagen");
//        Part part =request.getPart("imagen");

//        if (part == null) {
//            System.out.println("No se selecciono archivo");
//            return;
//        }
//        if (isExtension(part.getSubmittedFileName(),extens)) {
//            Datos datos = new Datos();
//            datos = control.traerDatos(1);
//            String pathFiles = datos.getRuta();
//            File uploads = new File(pathFiles);
//            
//            String photo = saveFile(part,uploads);
//            libr.setImagenEspacio("img/espacios/" + part.getSubmittedFileName());
        String errorMessage = null;
        String year = request.getParameter("year");
        //En esta seccion nos ayuda a validar que los datos no tengan fechas anteriores, que la hora de inicio y fin sean coherentes y 
        //que en el espacio de trabajo se tenga que seleccionar una parte de su contenido osea que no este vacio.
        try {
            LocalDate years = LocalDate.parse(year, DateTimeFormatter.ISO_LOCAL_DATE);
            LocalDate fecha_hoy = LocalDate.now();

            if (years.isAfter(fecha_hoy)) {
                errorMessage = "La fecha de la nacimiento no puede ser despues a la fecha actual.";
            }
            //generamos los mensajes de error de la fecha
        } catch (NumberFormatException e) {
            errorMessage = "La fecha ingresada es inválida. Asegúrate de ingresar una fecha válida.";
        }
        //Enviamos el error al index
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            RequestDispatcher Respuesta_Error = request.getRequestDispatcher("CrearLibros.jsp");
            Respuesta_Error.forward(request, response);
        } else {
            
            Libros libr = new Libros();
            
            libr.setTitulo(titulo);
            libr.setAutor(autor);
            libr.setYear(year);
            libr.setISBN(ISBN);
            libr.setGenero(genero);
            libr.setDisponibilidad(disponibilidad);
            
            control.crearLibro(libr);
            response.sendRedirect("svLibro");
        }
    }
        
//    }
 private boolean isExtension(String filename, String[] extensions) {
        for (String it : extensions) {
            if (filename.toLowerCase().endsWith(it)) {
                return true;
            }
        }
        return false;
    }

    private String saveFile(Part part, File pathUploads) {
        String pathAbsolute="";
        try {
            Path path = Paths.get(part.getSubmittedFileName());
            String filename = path.getFileName().toString();
            InputStream input = part.getInputStream();
            if (input !=null) {
                File file = new File(pathUploads, filename);
                pathAbsolute = file.getAbsolutePath();
                Files.copy(input,file.toPath());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pathAbsolute;
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
