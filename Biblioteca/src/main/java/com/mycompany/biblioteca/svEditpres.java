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
import logica.Prestamos;
import logica.Usuario;

/**
 *
 * @author agude
 */
@WebServlet(name = "svEditpres", urlPatterns = {"/svEditpres"})
public class svEditpres extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Prestamos pre = control.traerPrestamo(id);
        HttpSession misession = request.getSession();
        misession.setAttribute("presEditar", pre);
        response.sendRedirect("editarPrestamos.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        int id_libro = Integer.parseInt(request.getParameter("id_libro"));
        int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));

        Libros libr = control.traerLibro(id_libro);
        Usuario usu = control.traerUsuario(id_usuario);
        String fecha_prestamo = request.getParameter("fecha_prestamo");
        String fecha_devolucion = request.getParameter("fecha_devolucion");

        Prestamos pre = (Prestamos) request.getSession().getAttribute("presEditar");
        pre.setId_libro(libr);
        pre.setUnUsuario(usu);
        pre.setFecha_prestamo(fecha_prestamo);
        pre.setFecha_devolucion(fecha_devolucion);

        String errorMessage = null;
        //En esta seccion nos ayuda a validar que los datos no tengan fechas anteriores, que la hora de inicio y fin sean coherentes y 
        //que en el espacio de trabajo se tenga que seleccionar una parte de su contenido osea que no este vacio.
        try {
            LocalDate fecha_ini = LocalDate.parse(fecha_prestamo, DateTimeFormatter.ISO_LOCAL_DATE);
            LocalDate fecha_fin = LocalDate.parse(fecha_devolucion, DateTimeFormatter.ISO_LOCAL_DATE);
            LocalDate fecha_hoy = LocalDate.now();

            if (fecha_ini.isBefore(fecha_hoy) || fecha_fin.isBefore(fecha_hoy)) {
                errorMessage = "(*)la fecha del prestamo y la fecha de devolucion no puede ser menor a la fecha actual.";
            }
            if (fecha_ini.isEqual(fecha_fin)) {
                errorMessage = "(*)la fecha del prestamo y la fecha de devolucion no pueden ser la misma.";
            }
            //generamos los mensajes de error de la fecha
        } catch (NumberFormatException e) {
            errorMessage = "La fecha ingresada es inválida. Asegúrate de ingresar una fecha válida.";
        }
        //Enviamos el error al index
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            RequestDispatcher Respuesta_Error = request.getRequestDispatcher("editarPrestamos.jsp");
            Respuesta_Error.forward(request, response);
        } else {
            LocalDate fecha_ini = LocalDate.parse(fecha_prestamo, DateTimeFormatter.ISO_LOCAL_DATE);
            LocalDate fecha_fin = LocalDate.parse(fecha_devolucion, DateTimeFormatter.ISO_LOCAL_DATE);
            if (fecha_fin.isAfter(fecha_ini)) {
                String estado = "disponible";
                pre.setEstado(estado);
                control.editarPrestamos(pre);
                response.sendRedirect("svEditpres");
            }
            if (fecha_ini.isAfter(fecha_fin)) {
                String estado = "no devuelto";
                pre.setEstado(estado);
                control.editarPrestamos(pre);
                response.sendRedirect("svEditpres");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
