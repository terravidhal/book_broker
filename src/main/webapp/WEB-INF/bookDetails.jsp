<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!-- New line below to use the JSP Standard Tag Library -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Show Details books :
                <c:out value="${book.title}" />
            </title>
            <!-- for Bootstrap CSS -->
            <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/css/bootstrap.min.css" />
            <!-- YOUR own local CSS -->
            <link rel="stylesheet" href="/css/style.css" />
        </head>

        <body>

            <div class="container-fluid fs-2 ml-200" style="padding: 0 50px;">
                <div class="title-left" style="padding-top: 50px;">
                    <h1 class="text-primary">
                        <c:out value="${book.title}" />
                    </h1>
                    <h6>
                        <a href="/books">Back to the shelves</a>
                    </h6>
                </div>
                <div class="infos">
                    <c:if test="${book.user.id == currentUser.id}">
                        <h4 style="margin-top: 70px;">
                            You read <span style="color: purple;">
                                <c:out value="${book.title}" />
                            </span> by
                            <span style="color: green;">
                                <c:out value="${book.author}" />
                            </span>.
                        </h4>
                        <h4 class="my-2">
                            Here are Your thoughts:
                        </h4>
                    </c:if>
                    <c:if test="${book.user.id != currentUser.id}">
                        <h4 style="margin-top: 70px;">
                            <span style="color: red;">
                                <c:out value="${book.user.userName}" />
                            </span> read
                            <span style="color: purple;">
                                <c:out value="${book.title}" />
                            </span> by
                            <span style="color: green;">
                                <c:out value="${book.author}" />
                            </span>.
                        </h4>
                        <h4 class="my-2">
                            Here are
                            <c:out value="${book.user.userName}" />'s thoughts:
                        </h4>
                    </c:if>
                    <div class="border-underline"></div>
                    <p style="font-size: 0.9rem; text-align:justify; width:50%;">
                        <c:out value="${book.thoughts}" />
                    </p>
                    <div class="border-underline"></div>
                    <c:if test="${book.user.id == currentUser.id}">
                        <div class="button-left">
                            <h5 style="margin-bottom: 0;">
                                <a href="/books/${book.id}/edit" class="btn btn-success">Edit</a>
                            </h5>
                            <!-- otr method avc un simple requestmapping ou getmapping-->
                            <h5 style="margin-bottom: 0;">
                                <a href="/books/${book.id}/delete" class="btn btn-danger">delete</a>
                            </h5>            
                        </div>
                    </c:if>
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