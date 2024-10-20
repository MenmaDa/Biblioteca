/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.biblioteca;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Usuario;

/**
 *
 * @author agude
 */
@WebServlet(name = "svLogin", urlPatterns = {"/svLogin"})
public class svLogin extends HttpServlet {
    
    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        request.getSession().removeAttribute("email");
        request.getSession().invalidate();
        boolean error = false;
        HttpSession misession = request.getSession(true);
        misession.setMaxInactiveInterval(5 * 60);
        misession.setAttribute("error", error);
        response.sendRedirect(request.getContextPath() + "/iniciar_sesion.jsp");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String email = request.getParameter("email");
        String contrasenia_encript = request.getParameter("contrasenia_encript");
        String rol = control.comprobarRol(email, contrasenia_encript);
        String nombre = control.comprobarNombre(email, contrasenia_encript);
        int id_usuario = control.comprobarId(email, contrasenia_encript);
        boolean error = true;
        boolean validacion = false;
        HttpSession misession = request.getSession();
        validacion = control.comprobarAcceso(email, contrasenia_encript);
        
        if (validacion) {
            error = false;
            misession.setAttribute("id_usuario", id_usuario);
            misession.setAttribute("nombre", nombre);
            misession.setAttribute("email", email);
            misession.setAttribute("rol", rol);
            response.sendRedirect("index.jsp");
        } else {
            misession.setAttribute("error", error);
            response.sendRedirect("iniciar_sesion.jsp");
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
