
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.crud_seminarios.Estudiante"%>
<%
    ArrayList<Estudiante> estudiantes = (ArrayList<Estudiante>) session.getAttribute("seminarios");
    int actId = Integer.parseInt(request.getAttribute("lastId").toString());
    int id = actId + 1;
    request.setAttribute("nextId", id);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2><c:out value="${requestScope.Estudiante.getTurno()}" default="sin definir" /></h2>
        <h1>Registro de Seminarios</h1>
        <form action="servletSeminarios" method="post">
            <fieldset>
                <legend>Datos </legend>
                <br><label>Id</label>
                <input type="number" name="id" value="<c:out value="${requestScope.Estudiante.getId()}" default="${requestScope.nextId}"  />" readonly><br><br>
                <label>Fecha</label>
                <input type="date" name="fecha" value="<c:out value="${requestScope.Estudiante.getFecha()}" />"><br><br>
                <label>Nombre</label>
                <input type="text" name="nombre" value="<c:out value="${requestScope.Estudiante.getNombre()}" />" ><br><br>
                <label>Apellidos</label>
                <input type="text" name="apellidos" value="<c:out value="${requestScope.Estudiante.getApellidos()}" />"><br><br>
                <div>   
                    <label>
                        <input type="radio" name="turno" value="Temprano"
                        <c:if test="${requestScope.Estudiante.getTurno() == 'Temprano'}">checked</c:if>> Temprano
                    </label>
                    <label>
                        <input type="radio" name="turno" value="Tarde"
                        <c:if test="${requestScope.Estudiante.getTurno() == 'Tarde'}">checked</c:if>> Tarde
                    </label>
                    <label>
                        <input type="radio" name="turno" value="Noche"
                        <c:if test="${requestScope.Estudiante.getTurno() == 'Noche'}">checked</c:if>> Noche
                    </label>
                </div>
            </fieldset>
            <fieldset>
                <legend>Seminarios Disponibles </legend>
                <br>
                <label>
                    <input type="checkbox" name="curso1" value="Inteligencia Artificial" 
                        <c:if test="${requestScope.Estudiante.getSeminarios().contains('Inteligencia Artificial')}"> checked </c:if>>Inteligencia Artificial
                </label><br><br>
                <label>
                    <input type="checkbox" name="curso2" value="Machine Learning"
                        <c:if test="${requestScope.Estudiante.getSeminarios().contains('Machine Learning')}"> checked </c:if>> Machine Learning
                </label><br><br>
                <label>
                    <input type="checkbox" name="curso3" value="Simulacion con Arena"
                        <c:if test="${requestScope.Estudiante.getSeminarios().contains('Simulacion con Arena')}"> checked </c:if>> Simulacion con Arena
                </label><br><br>
                <label>
                    <input type="checkbox" name="curso4" value="Robotica Educativa"
                        <c:if test="${requestScope.Estudiante.getSeminarios().contains('Robotica Educativa')}"> checked </c:if>> Robotica Educativa
                </label><br><br>
            </fieldset>
            <button type="submit">Enviar Registro</button>
        </form>
    </body>
</html>
