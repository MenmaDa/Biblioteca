<%-- 
    Document   : horizontal
    Created on : 19/10/2024, 1:58:58 a. m.
    Author     : Dani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <nav class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0">
        <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
            <h2 class="text-primary mb-0"><i class="fa fa-user-edit"></i></h2>
        </a>
        <a href="#" class="sidebar-toggler flex-shrink-0">
            <i class="fa fa-bars"></i>
        </a>
        <form class="d-none d-md-flex ms-4">
            <input class="form-control bg-dark border-0" type="search" placeholder="Search">
        </form>
        <div class="navbar-nav align-items-center ms-auto">
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                    <img class="rounded-circle me-lg-2" src="https://static.vecteezy.com/system/resources/previews/018/765/757/original/user-profile-icon-in-flat-style-member-avatar-illustration-on-isolated-background-human-permission-sign-business-concept-vector.jpg" alt="" style="width: 40px; height: 40px;">
                    <span class="d-none d-lg-inline-flex"><%=request.getSession().getAttribute("nombre")%></span>
                </a>
                <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                    <form name="editar" action="svEditusu" method="GET">
                        <button class="dropdown-item" title="Editar Registro">
                            Editar Perfil
                        </button>
                        <input type="Hidden" name="id" value="<%=request.getSession().getAttribute("id_usuario")%>">
                    </form>
                    <form name="verPrestamos" action="svMiPrestamo" method="POST">
                        <button class="dropdown-item" title="entrar">
                            Vizualizar prestamos
                        </button>
                        <input type="Hidden" name="id" value="<%=request.getSession().getAttribute("id_usuario")%>">
                    </form>
                    <a href="svLogin" class="dropdown-item">Cerrar sesion</a>
                </div>
            </div>
        </div>
    </nav>
</html>
