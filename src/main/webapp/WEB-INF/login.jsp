<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!-- New line below to use the JSP Standard Tag Library -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- New line below to use the JSP Standard Tag Library : Form -->
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <!-- gestion ds erreurs -->
    <%@ page isErrorPage="true" %> 
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Create Dojos :</title>
            <!-- for Bootstrap CSS -->
            <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/css/bootstrap.min.css" />
            <!-- YOUR own local CSS -->
            <link rel="stylesheet" href="/css/style.css" />
        </head>

        <body>
            <div class="container-fluid text-center p-5" style="justify-content: center;width: 50%;">
                <h1 class="text-center text-primary" style="padding-top: 100px;">
                    Login !</h1>
               <div class="omikuji border-1">
                        <form:form action="/login_process" method="POST" modelAttribute="newLogin" class="form_this">
                            <div class="form-group">
                                <form:label path="email">Email  : </form:label>
                                <form:errors path="email"/>
                                <form:input class="form-control" type="email" path="email"/>
                            </div>
                            <div class="form-group">
                                <form:label path="password">Password  : </form:label>
                                <form:errors path="password"/>
                                <form:input class="form-control" type="password" path="password"/>
                            </div>
                            <button type="submit" class="btn btn-primary my-2">Submit</button>
                        </form:form>
                </div> 
            </div>
            <div class="back st">
                <a href="/register">click to register</a>
            </div>

            <!-- link Js -->
            <script type="text/javascript" src="/js/main.js"></script>
            <!-- For any Bootstrap that uses jquery -->
            <script src="/webjars/jquery/jquery.min.js"></script>
            <!--For any Bootstrap that uses JS -->
            <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
        </body>

        </html>