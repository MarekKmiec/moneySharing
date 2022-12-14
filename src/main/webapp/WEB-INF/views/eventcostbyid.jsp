<%--
  Created by IntelliJ IDEA.
  User: marek
  Date: 21.09.2022
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Expense</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<style>

</style>
<body>
<h3>Lista wydatków wydarzenia</h3>
<table class="table table-striped ">
    <tr>
        <th scope="col">Cost</th>
        <th scope="col">User</th>
        <th scope="col">Event</th>
        <th scope="col">Descriptions</th>
        <th scope="col">Action</th>
        <%--        <th>AllCost</th>--%>

    </tr>
    <c:forEach items="${allexpense}" var="e">
        <tr>
            <td><c:out value="${e.cost}"/></td>
            <td><c:out value="${e.user.name}"/></td>
            <td><c:out value="${e.event.name}"/></td>
            <td><c:out value="${e.description}"/></td>

            <td><a href="<c:url value="/expense/delete/${e.id}"/>"
                   onclick="return confirm('Are you sure you want to delete expense \'${e.description}\'?')">Delete</a>
                <br><a href="<c:url value="/expense/edit/${e.id}"/>">Edit</a></td>
        </tr>
    </c:forEach>

    <a href="<c:url value="/expense/add"/>">Add Expenses</a><br>
    <a href="<c:url value="/expense/list"/>">List Expenses</a><br>
    <a href="<c:url value="/userform/list"/>">List User</a><br>
    <a href="<c:url value="/event/list"/>">List Event</a><br>
</table>
<br>
<h3>Pośrednie rozliczenie</h3>
<table class="table table-striped ">
    <tr>
        <th scope="col">name</th>
        <th scope="col">cost</th>
        <th scope="col">subCost</th>
    </tr>
    <c:forEach items="${allusercost}" var="e">
        <tr>
            <td><c:out value="${e.key}"/></td>
            <td><c:out value="${e.value}"/></td>
            <td><c:out value="${e.value-summary.avg}"/></td>
        </tr>
    </c:forEach>
</table>
<br>


<TABLE class="table table-striped ">
    <tr>
        <th scope="col"> Całkowity koszt wydarzenia </th>
        <th scope="col">Ilosc uczestników wydarzenia</th>
        <th scope="col">Średni koszt na jednego uczestnika</th>
    </tr>
    <tr>
        <td>${summary.sumAmount} </td>
        <td>${summary.sumUser} </td>
        <td>${summary.avg} </td>
    </tr>
<%--    ${summary.sumAmount} / ${summary.sumUser} =${summary.avg}--%>
</TABLE>


<br>

<table class="table table-striped ">
    <tr>
        <th scope="col">Nazwa wydarzenia</th>
        <th scope="col">id wydarzenia</th>


    </tr>
    <c:forEach items="${allEventByIdMap}" var="e">
        <tr>
            <td><c:out value="${e.key}"/></td>
            <td><c:out value="${e.value}"/></td>


        </tr>
    </c:forEach>


</table>
<br>
<h3>Finalne rozliczenie</h3>
<table class="table table-striped ">
    <tr>
        <th scope="col">Do oddania</th>
        <th scope="col">Oddający</th>
    </tr>
    <c:forEach items="${Billd}" var="e">
        <tr>
            <td><c:out value="${e.key.userName}"/> <c:out value="${e.key.cost}"/></td>
            <td>
                <c:forEach items="${e.value}" var="o">
                    <c:out value="${o.userName}"/> <c:out value="${o.cost}"/><br>
                </c:forEach>
            </td>
        </tr>
    </c:forEach>
</table>
