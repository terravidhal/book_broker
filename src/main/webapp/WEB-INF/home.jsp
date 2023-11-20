<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!-- New line below to use the JSP Standard Tag Library -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- New line below to use the JSP Standard Tag Library : Form -->
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!-- gestion ds erreurs -->
            <%@ page isErrorPage="true" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8">
                    <title>All Books :</title>
                    <!-- for Bootstrap CSS -->
                    <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/css/bootstrap.min.css" />
                    <!-- YOUR own local CSS -->
                    <link rel="stylesheet" href="/css/style.css" />
                </head>

                <body>
                    <div class="container-fluid p-5" style="justify-content: center;width: 90%;">
                        <div class="title">
                            <div class="title-left">
                                <h1>Hello,
                                    <span class="text-primary">
                                        <c:out value="${currentUser.userName}" />
                                    </span>. Welcome to...
                                </h1>
                                <h6><a href="/logout" style="text-decoration: none;">Logout</a></h6>
                            </div>
                            <div class="title-left">
                                <p class="h2">The Book Brooker
                                </p>
                            </div>
                            <div class="title-right">
                                <h6>
                                    Available books to borrow:</h6>
                                <h6>
                                    <a href="/book/new">+Add a to my shelf!</a>
                                </h6>
                            </div>
                        </div>
                        <table class="table table-striped border border-5 my-3">
                            <thead>
                                <tr style="text-align: center;">
                                    <th scope="col">ID</th>
                                    <th scope="col">Title</th>
                                    <th scope="col">Author Name</th>
                                    <th scope="col">Owner</th>
                                    <th scope="col">Actions</th>
                                </tr>
                            </thead>
                            <tbody style="text-align: center;">
                                <c:forEach var="elt" items="${allBooks}">

                                    <c:if test="${currentUser.id != elt.borrower.id}">
                                        <tr>
                                            <td>
                                                <c:out value="${elt.id}" />
                                            </td>
                                            <td><a href="books/${elt.id}">
                                                    <c:out value="${elt.title}" />
                                                </a></td>
                                            <td>
                                                <c:out value="${elt.author}" />
                                            </td>
                                            <td>
                                                <c:out value="${elt.user.userName}" />
                                            </td>
                                            <c:if test="${currentUser == elt.user}">
                                                <td>
                                                    <a href="books/${elt.id}/edit">edit</a>
                                                    <!--otr method avc un simple requestmapping ou getmapping-->
		                                           &nbsp;<a href="/books/${elt.id}/delete">delete</a>
                                                </td>
                                            </c:if>
                                            <c:if test="${currentUser != elt.user}">
                                                <td><a href="books/${elt.id}/borrow">borrow</a></td>
                                            </c:if>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                        <!-- Borrowing Books -->
                        <div class="title-right">
                            <h6>
                                Books I'm Borrowing...</h6>
                        </div>
                        <table class="table table-striped border border-5 my-3">
                            <thead>
                                <tr style="text-align: center;">
                                    <th scope="col">ID</th>
                                    <th scope="col">Title</th>
                                    <th scope="col">Author Name</th>
                                    <th scope="col">Owner</th>
                                    <th scope="col">Actions</th>
                                </tr>
                            </thead>
                            <tbody style="text-align: center;">
                                <c:forEach var="elt" items="${allBooks}">

                                    <c:if test="${currentUser.id == elt.borrower.id}">
                                        <tr>
                                            <td>
                                                <c:out value="${elt.id}" />
                                            </td>
                                            <td><a href="books/${elt.id}">
                                                    <c:out value="${elt.title}" />
                                                </a></td>
                                            <td>
                                                <c:out value="${elt.author}" />
                                            </td>
                                            <td>
                                                <c:out value="${elt.user.userName}" />
                                            </td>
                                            <c:if test="${currentUser != elt.user}">
                                                <td><a href="books/${elt.id}/return">return</a></td>
                                            </c:if>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>



                    <!-- link Js -->
                    <script type="text/javascript" src="/js/main.js"></script>
                    <!-- For any Bootstrap that uses jquery -->
                    <script src="/webjars/jquery/jquery.min.js"></script>
                    <!--For any Bootstrap that uses JS -->
                    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
                </body>

                </html>