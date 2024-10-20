/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.biblioteca;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Field;
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
import javax.swing.text.DateFormatter;
import logica.Usuario;
import logica.Controladora;
import logica.Libros;
import logica.Prestamos;

@WebServlet(name = "svMiPrestamo", urlPatterns = {"/svMiPrestamo"})
public class svMiPrestamo extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario =request.getParameter("id");
        
        if (usuario!= null && !usuario.isEmpty()) {
            int idUsu = Integer.parseInt(usuario);
            List<Prestamos> listaPrestamos = control.miPrestamo(idUsu);
            HttpSession misession = request.getSession();
            misession.setAttribute("listaPrestamos", listaPrestamos);
            response.sendRedirect("vermisPrestamos.jsp");
        }
        else {
    // Manejar el caso donde el parámetro es nulo o vacío
    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El parámetro idUsu es inválido o no proporcionado.");
}
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
