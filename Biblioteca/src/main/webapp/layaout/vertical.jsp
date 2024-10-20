<%-- 
    Document   : vertical
    Created on : 19/10/2024, 1:55:11 a. m.
    Author     : Dani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="sidebar pe-4 pb-3">
        <nav class="navbar bg-secondary navbar-dark">
            <a href="index.jsp" class="navbar-brand mx-4 mb-3">
                <h3 class="text-primary"><i class="fa fa-user-edit me-2"></i>WarMode</h3>
            </a>
            <div class="d-flex align-items-center ms-4 mb-4">
                <div class="position-relative">
                    <img class="rounded-circle" src="https://static.vecteezy.com/system/resources/previews/018/765/757/original/user-profile-icon-in-flat-style-member-avatar-illustration-on-isolated-background-human-permission-sign-business-concept-vector.jpg" alt="" style="width: 40px; height: 40px;">
                    <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                </div>
                <div class="ms-3">
                    <h6 class="mb-0"><%=request.getSession().getAttribute("nombre")%></h6>
                    <span><%=request.getSession().getAttribute("rol")%></span>
                </div>
            </div>
            <div class="navbar-nav w-100">
                <a href="svLibro" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Catalogo</a>
                <%
                    String rol = (String) request.getSession().getAttribute("rol");
                    if ("Admin".equals(rol)) {
                %>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Administración</a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="CrearUsuarios.jsp" class="dropdown-item">Crear Usuario</a>
                        <a href="svUsuario" class="dropdown-item">Ver usuario</a>
                    </div>
                </div>
                <% } %>
                <%
                    if ("Admin".equals(rol) || "Bibliotecario".equals(rol)) {
                %>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-table me-2"></i>Prestamos</a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="CrearPrestamos.jsp" class="dropdown-item">Registrar prestamo</a>
                        <a href="svPrestamo" class="dropdown-item">Ver Prestamos</a>
                    </div>
                </div>
                <% } %> 
                <%
                    if ("Admin".equals(rol) || "Bibliotecario".equals(rol)) {
                %>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Libros</a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="CrearLibros.jsp" class="dropdown-item">Registrar Libro</a>
                        <a href="svLibro" class="dropdown-item">Ver libros</a>
                    </div>
                </div>
                <% }%> 
            </div>
        </nav>
    </div>
</html>
