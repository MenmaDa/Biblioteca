<%-- 
    Document   : index
    Created on : 19/10/2024, 1:50:00 a. m.
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

        <%@include file="layaout/validarSesion.jsp"%>
        <!-- Vertical Start -->
        <div id="layoutSidenav_nav">
            <jsp:include page="layaout/vertical.jsp"/>  
            </div>
        <!-- Vertical End -->


        <!-- Content Start -->
        <div class="content">
            <!-- Horizontal Start -->
            <jsp:include page="layaout/horizontal.jsp"/>  
            <!-- Horizontal End -->



            <!-- Recent Sales Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-secondary text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Biblioteca WarMode</h6>
                        <a href="">Motrar todo</a>
                    </div>
                    
                    <div class="d-flex align-items-center justify-content-center mb-4">
                        <img src="img/biblioteca.jpg" alt="alt"/>
                    </div>
                </div>
            </div>
            <!-- Recent Sales End -->


            <!-- Widgets Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    
                    <div class="col-sm-12 col-md-6 col-xl-4">
                        <div class="h-100 bg-secondary rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">Calender</h6>
                                <a href="">Show All</a>
                            </div>
                            <div id="calender"></div>
                        </div>
                    </div>
                    
                </div>
            </div>
            <!-- Widgets End -->


            <!-- Footer Start -->
            <jsp:include page="layaout/footer.jsp"/>
            <!-- Footer End -->
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        
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
