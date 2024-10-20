<%-- 
    Document   : form
    Created on : 19/10/2024, 3:53:45 a. m.
    Author     : Dani
--%>

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
                                <h6 class="mb-4">Crear Libro</h6>
                                <form action="svLibro" method="POST">
                                    <!--<div class="form-floating mb-3">
                                    <input type="file" class="form-control" id="imagen" name="imagen" placeholder="" required>
                                    <label for="floatingText">portada</label>
                                                                    </div>-->
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="titulo" name="titulo" placeholder="" required>
                                        <label for="floatingText">titulo</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="autor" name="autor" placeholder="" required>
                                        <label for="floatingInput">autor</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="date" class="form-control" id="year" name="year" placeholder="" required>
                                        <label for="floatingInput">fecha del año de publición</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="number" class="form-control" id="ISBN" name="ISBN" placeholder="" required>
                                        <label for="floatingPassword">ISBN</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <select class="form-select mb-3" aria-label=".form-select-lg example" id="genero" name="genero" required>
                                            <option value="">-----Selecciona-----</option>
                                            <option value="Ciencia Ficcion">Ciencia ficción</option>
                                            <option value="Accion">Acción</option>
                                            <option value="Aventura">Aventura</option>
                                            <option value="Drama">Drama</option>
                                            <option value="Historico">Historico</option>
                                            <option value="Accion">Misterio</option>
                                            <option value="Romance">Romance</option>
                                            <option value="Psicologico">Psicologico</option>
                                            <option value="Fantasia">Fantasia</option>
                                            <option value="poesia">poesía</option>
                                            <option value="Comedia">Comedia</option>
                                            <option value="autobiografias">autobiografías</option>
                                            <option value="diccionarios">diccionarios</option>
                                        </select>
                                        <label for="floatingPassword">Genero</label>
                                    </div> 
                                    <div class="form-floating mb-3">
                                        <select class="form-select mb-3" aria-label=".form-select-lg example" id="disponibilidad" name="disponibilidad" required>
                                            <option value="">-----Selecciona-----</option>
                                            <option value="true">Disponible</option>
                                            <option value="false">No Disponible</option>
                                        </select>
                                        <label for="floatingPassword">Disponibilidad</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <% String errorMessage = (String) request.getAttribute("errorMessage");
                                            if (errorMessage != null) {
                                        %>

                                        <div style="color: red; font-weight: bold;">
                                            <%=errorMessage%>
                                        </div>
                                        <%
                                            }
                                        %>
                                    </div>
                                    <button type="submit" class="btn btn-primary py-3 w-100 mb-4">Registrar Libro</button>
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
