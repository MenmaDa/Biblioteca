
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession misession = request.getSession();
    misession.setMaxInactiveInterval(5*60);
    String Usuario = (String) request.getSession().getAttribute("email");
    
    if (Usuario == null) {
            boolean error = false;
            misession.setAttribute("error", error);
            response.sendRedirect("iniciar_sesion.jsp");
        }
    
%>