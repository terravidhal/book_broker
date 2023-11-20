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
            <title>Create Books :</title>
            <!-- for Bootstrap CSS -->
            <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/css/bootstrap.min.css" />
            <!-- YOUR own local CSS -->
            <link rel="stylesheet" href="/css/style.css" />
        </head>

        <body>
            <div class="title-left" style="padding-top: 100px;width: 90%;
            margin: 0 auto;">
                <h1 class="text-center text-primary">
                    Add a book to your shelf!</h1>
                    <h6>
                        <a href="/books">Back to the shelves</a>
                    </h6>
            </div>
            <div class="container-fluid text-center p-5" style="justify-content: center;width: 50%;">
               <div class="omikuji border-1">
                        <form:form action="/process_book" method="POST" modelAttribute="bookAttr" class="form_this">
                            <div class="form-group">
                                <form:label path="title">Title : </form:label>
                                <form:errors path="title"/>
                                <form:input class="form-control" path="title"/>
                            </div>
                            <div class="form-group">
                                <form:label path="author">Author :</form:label>
                                <form:errors path="author"/>
                                <form:input class="form-control"  path="author"/> 
                            </div>
                            <div class="form-group">
                                <form:label path="thoughts">My thoughts :</form:label>
                                <form:errors path="thoughts"/>
                                <form:textarea class="form-control" rows="3" path="thoughts"/> 
                            </div>
                            <!--important-->
                             <div class="form-group">
                                <form:errors path="user" class="error"/>
                                <form:input type="hidden" path="user" value="${currentUser.id}" class="form-control"/>
                            </div>

                            <button type="submit" class="btn btn-primary my-2">Submit</button>
                        </form:form>
                </div> 
                
            </div>
           

            <!-- link Js -->
            <script type="text/javascript" src="/js/main.js"></script>
            <!-- For any Bootstrap that uses jquery -->
            <script src="/webjars/jquery/jquery.min.js"></script>
            <!--For any Bootstrap that uses JS -->
            <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
        </body>

        </html>