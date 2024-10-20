/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.biblioteca;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Libros;
import logica.Usuario;

/**
 *
 * @author agude
 */
@WebServlet(name = "svEditlibro", urlPatterns = {"/svEditlibro"})
public class svEditlibro extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Libros lib = control.traerLibro(id);
        HttpSession misession = request.getSession();
        misession.setAttribute("libEditar", lib);
        response.sendRedirect("editarLibro.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

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
            RequestDispatcher Respuesta_Error = request.getRequestDispatcher("editarLibro.jsp");
            Respuesta_Error.forward(request, response);
        } else {
            Libros lib = (Libros) request.getSession().getAttribute("libEditar");
            lib.setTitulo(titulo);
            lib.setAutor(autor);
            lib.setYear(year);
            lib.setISBN(ISBN);
            lib.setGenero(genero);
            lib.setDisponibilidad(disponibilidad);

            control.editarLibro(lib);
            response.sendRedirect("svEditlibro");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
