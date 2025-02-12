<%@page import="logica.Prestamos"%>
<%@page import="java.util.List"%>
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


            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <jsp:include page="layaout/horizontal.jsp"/>  
                <!-- Navbar End -->


                <!-- Table Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-secondary text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Recent Salse</h6>
                            <a href="">Show All</a>
                        </div>
                        <div class="table-responsive">
                            <table id="datatablesSimple" class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Usuario</th>
                                        <th>Libro</th>
                                        <th>Fecha del Prestamo</th>
                                        <th>Fecha de devolución</th>
                                        <th>estado</th>
                                        <th width="10%">Acciones</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Id</th>
                                        <th>Usuario</th>
                                        <th>Libro</th>
                                        <th>Fecha del Prestamo</th>
                                        <th>Fecha de devolución</th>
                                        <th>estado</th>
                                        <th>Acciones</th>
                                    </tr>
                                </tfoot>
                                <% List<Prestamos> listaPrestamos = (List) request.getSession().getAttribute("listaPrestamos");%>
                                <tbody>
                                    <% for (Prestamos pre : listaPrestamos) {%>
                                    <tr>
                                        <td><%=pre.getId_prestamos()%></td>
                                        <td><%=pre.getUnUsuario().getNombre()%></td>
                                        <td><%=pre.getId_libro().getTitulo()%></td>
                                        <td><%=pre.getFecha_prestamo()%></td>
                                        <td><%=pre.getFecha_devolucion()%></td>
                                        <td><%=pre.getEstado()%></td>
                                        <td>
                                            <form name="eliminar" action="svEliminarpres" method="POST" style="float: left; margin-right: 10px">
                                                <button class="btn btn-outline-danger btn-block" title="Eliminar Registro">

                                                </button>
                                                <input type="Hidden" name="id" value="<%=pre.getId_prestamos()%>">
                                            </form>
                                            <form name="editar" action="svEditpres" method="GET">
                                                <button class="btn btn-outline-info btn-block" title="Editar Registro">

                                                </button>
                                                <input type="Hidden" name="id" value="<%=pre.getId_prestamos()%>">
                                            </form>
                                        </td>
                                    </tr>
                                    <% }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <jsp:include page="layaout/footer.jsp"/>
            </div>
        </div><a class="btn btn-sm btn-primary" href="">Detail</a>
        <!-- Table End -->

        <%@include file="layaout/validarSesion.jsp"%>
        <!-- Footer Start -->
        <!-- Footer End -->
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
    <jsp:include page="layaout/scripts.jsp"/>
</body>
</html>
