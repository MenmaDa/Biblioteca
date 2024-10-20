<%-- 
    Document   : form
    Created on : 19/10/2024, 3:53:45 a. m.
    Author     : Dani
--%>

<%@page import="logica.Prestamos"%>
<%@page import="logica.Libros"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="logica.Usuario"%>
<%@page import="logica.Controladora"%>
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
                                <h6 class="mb-4">Editar Prestamos</h6>
                                <% Prestamos pres = (Prestamos) request.getSession().getAttribute("presEditar");%>
                                <form action="svEditpres" method="POST">
                                    <div class="form-floating mb-3">
                                        <%
                                            Controladora control = new Controladora();
                                            List<Usuario> listaUsuarios = new ArrayList<Usuario>();
                                            listaUsuarios = control.getUsuario();
                                        %>
                                        <select class="form-select mb-3" aria-label=".form-select-lg example" id="id_usuario" name="id_usuario" value="<%=pres.getUnUsuario()%>" required>
                                            <option value="">--- Seleccione---</option>
                                            <%
                                                for (Usuario usu : listaUsuarios) {
                                            %>
                                            <option value="<%=usu.getId_usuario()%>"><%=usu.getEmail()%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                        <label for="floatingText">Usuario</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <%
                                            List<Libros> listaLibros = new ArrayList<Libros>();
                                            listaLibros = control.getLibro();
                                        %>
                                        <select class="form-select mb-3" aria-label=".form-select-lg example" id="id_libro" name="id_libro" value="<%=pres.getId_libro().getTitulo()%>" required>
                                            <option value="">--- Seleccione---</option>
                                            <%
                                                for (Libros libr : listaLibros) {
                                            %>
                                            <option value="<%=libr.getId_libro()%>"><%=libr.getTitulo()%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                        <label for="floatingInput">libro</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="date" class="form-control" id="fecha_prestamo" name="fecha_prestamo" value="<%=pres.getFecha_prestamo()%>" placeholder="" required>
                                        <label for="floatingInput">fecha del prestamo</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="date" class="form-control" id="fecha_devolucion" name="fecha_devolucion" value="<%=pres.getFecha_devolucion()%>" placeholder="" required>
                                        <label for="floatingInput">fecha de devolución</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <%
                                            String errorMessage = (String) request.getAttribute("errorMessage");
                                            if (errorMessage != null) {
                                        %>

                                        <div style="color: red; font-weight: bold;">
                                            <%=errorMessage%>
                                        </div>
                                        <%
                                            }
                                        %>
                                    </div>

                                    <center>
                                        <button type="submit" class="btn btn-info py-3 w-50 mb-4">Editar Prestamo</button>
                                        <a class="btn btn-primary btn-block py-3 w-50 mb-4" href="svPrestamo">Cancelar</a>
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
