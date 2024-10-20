<%-- 
    Document   : form
    Created on : 19/10/2024, 3:53:45 a. m.
    Author     : Dani
--%>

<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="layaout/header.jsp"/>  
</head>

<body>
    <div class="container-fluid position-relative d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Sidebar Start -->
        <div id="layoutSidenav_nav">
            <jsp:include page="layaout/vertical.jsp"/>  
            </div>
        <!-- Sidebar End -->

        <%@include file="layaout/validarSesion.jsp"%>
        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <jsp:include page="layaout/horizontal.jsp"/>  
            <!-- Navbar End -->


            <!-- Form Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-24 col-xl-12">
                        <div class="bg-secondary rounded h-100 p-4">
                            <h6 class="mb-4">Editar Usuario</h6>
                            <% Usuario usu = (Usuario) request.getSession().getAttribute("usuEditar");%>
                            <form action="svEditusu" method="POST">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="" value="<%=usu.getNombre()%>" required>
                                    <label for="floatingText">Nombre</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="apellido" name="apellido" placeholder="" value="<%=usu.getApellido()%>" required>
                                    <label for="floatingInput">Apellido</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" value="<%=usu.getEmail()%>" required>
                                    <label for="floatingInput">Email address</label>
                                </div>
                                <div class="form-floating mb-4">
                                    <input type="password" class="form-control" id="contrasenia_encript" name="contrasenia_encript" value="<%=usu.getContrasenia_encript()%>" placeholder="Password" required>
                                    <label for="floatingPassword">Contraseña</label>
                                </div>
                                <div class="form-floating mb-4">
                                    <%
                                 String rol = (String) request.getSession().getAttribute("rol");
                                 if ("Admin".equals(rol)) {
                                    %>
                                    <select class="form-select mb-3" aria-label=".form-select-lg example" value="<%=usu.getRol()%>" id="rol" name="rol" required>
                                        <option value="">-----Selecciona-----</option>
                                        <option value="Admin">Admin</option>
                                        <option value="Usuario">Usuario</option>
                                        <option value="Bibliotecario">Bibliotecario</option>
                                    </select>
                                    <label for="floatingPassword">Rol</label>
                                    <% } else{%>
                                    <input class="form-control" type="text" name="rol" id="rol" value="<%=usu.getRol()%>" placeholder="" readonly>
                                    <label for="floatingPassword">Rol</label>
                                    <% } %>
                                </div>
                             <center>
                                <button type="submit" class="btn btn-info py-3 w-50 mb-4">Editar Usuario</button> 
                                <a class="btn btn-primary btn-block py-3 w-50 mb-4" href="svUsuario">Cancelar</a>
                            </center>
                        </form>
                            
                        </div>
                    </div>
                </div>
            </div>
            <!-- Form End -->


            <!-- Footer Start -->
            <jsp:include page="layaout/footer.jsp"/>
            <!-- Footer End -->
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>
