<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Persona"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Sistema de Registros UMG - Panel Verde</title>
        <style>
            /* Fondo con degradado VERDE */
            body {
                background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%);
                min-height: 100vh;
                margin: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                padding: 40px 0;
            }

            /* Tarjeta blanca para la tabla */
            .tabla-container {
                background: rgba(255, 255, 255, 0.98);
                border-radius: 25px;
                padding: 40px;
                box-shadow: 0 15px 40px rgba(0,0,0,0.2);
                width: 90%;
                max-width: 1250px; /* Un poco más ancha para que quepa el correo cómodamente */
                margin: auto;
                border: 1px solid rgba(255,255,255,0.2);
            }

            /* Título en VERDE */
            h1 {
                color: #1e8449;
                font-weight: bold;
                text-transform: uppercase;
                letter-spacing: 2px;
                margin-bottom: 10px;
            }

            .user-badge {
                background: #e9f7ef; /* Verde muy pálido */
                padding: 10px 20px;
                border-radius: 15px;
                border: 1px solid #a9dfbf; /* Borde verde suave */
                color: #333;
                display: inline-block;
            }

            /* Estilos de la Tabla - VERDE */
            .table {
                border-radius: 15px;
                overflow: hidden;
                border: none;
                margin-top: 20px;
            }

            .table thead {
                background: linear-gradient(to right, #2ecc71, #27ae60);
                color: white;
            }

            .table thead th {
                border: none;
                padding: 18px;
                font-weight: 600;
                text-transform: uppercase;
                font-size: 14px;
                letter-spacing: 1px;
            }

            .table tbody td {
                padding: 15px;
                vertical-align: middle;
            }

            .table tbody tr:hover {
                background-color: #e9f7ef;
                transition: 0.3s;
            }

            /* Botones Personalizados */
            .btn-custom {
                border-radius: 25px;
                padding: 10px 25px;
                font-weight: bold;
                transition: 0.3s;
                border: none;
                text-transform: uppercase;
                font-size: 13px;
                letter-spacing: 1px;
            }

            /* Botón AGREGAR (Verde Esmeralda) */
            .btn-add { 
                background-color: #2ecc71; 
                color: #fff;
                box-shadow: 0 4px 12px rgba(46,204,113,0.3);
            } 
            .btn-add:hover { 
                background-color: #28b463; 
                box-shadow: 0 6px 18px rgba(46,204,113,0.5);
                transform: translateY(-2px);
            }

            /* Botón CERRAR SESIÓN (Gris Bosque) */
            .btn-logout { 
                background-color: #515a5a; 
                color: white; 
            }
            .btn-logout:hover { 
                background-color: #424949; 
            }

            /* Botones de Acción */
            .btn-edit { background-color: #f1c40f; color: #333; }
            .btn-edit:hover { background-color: #d4ac0d; }

            .btn-delete { background-color: #e74c3c; color: white; }
            .btn-delete:hover { background-color: #c0392b; }
            
            /* Badge para el departamento */
            .depto-badge {
                background-color: #27ae60;
                color: white;
                padding: 5px 12px;
                border-radius: 10px;
                font-size: 12px;
                font-weight: 500;
            }
        </style>
    </head>
    
    <%
        if(session.getAttribute("usuarioLogueado") == null) {
            response.sendRedirect("index.jsp");
        }
    %>
    
    <body>
        <div class="tabla-container shadow-lg">
            <div class="d-flex justify-content-between align-items-center mb-5">
                <div>
                    <h1>Listado de Personas</h1>
                    <div class="user-badge shadow-sm">
                        Bienvenido, <strong style="color: #1e8449;"><%= session.getAttribute("usuarioLogueado") %></strong> (UMG Registros)
                    </div>
                </div>
                
                <div class="d-flex gap-3 align-items-center">
                    <a class="btn btn-custom btn-add shadow" href="Controlador?accion=add">
                        + AGREGAR REGISTRO
                    </a>
                    <form action="Validar" method="POST" style="display: inline;">
                        <button type="submit" name="accion" value="Salir" class="btn btn-custom btn-logout shadow-sm">
                            Cerrar Sesión
                        </button>
                    </form>
                </div>
            </div>
            
            <div class="table-responsive">
                <table class="table table-hover table-striped-columns">
                    <thead class="text-center">
                        <tr>
                            <th>ID</th>
                            <th>DPI / Documento</th>
                            <th>Nombres Completos</th>
                            <!-- NUEVA COLUMNA DE CORREO -->
                            <th>Correo Electrónico</th>
                            <th>Departamento</th>
                            <th>Acciones Disponibles</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        PersonaDAO dao = new PersonaDAO();
                        List<Persona> list = dao.listar();
                        Iterator<Persona> iter = list.iterator();
                        Persona per = null;
                        while(iter.hasNext()){
                            per = iter.next();
                    %>
                        <tr>
                            <td class="text-center fw-bold" style="color: #666;"><%= per.getId()%></td>
                            <td class="text-center"><%= per.getDpi()%></td>
                            <td class="text-capitalize text-start" style="color: #333;"><%= per.getNom()%></td>
                            <!-- IMPRESIÓN DEL CORREO -->
                            <td class="text-center" style="color: #555;">
                                <%= (per.getCorreo() != null && !per.getCorreo().isEmpty()) ? per.getCorreo() : "Sin correo" %>
                            </td>
                            <td class="text-center">
                                <span class="depto-badge">
                                    <%= (per.getNomDepartamento() != null) ? per.getNomDepartamento() : "Sin Asignar" %>
                                </span>
                            </td>
                            <td class="text-center">
                                <a class="btn btn-custom btn-edit btn-sm me-2 shadow-sm" href="Controlador?accion=editar&id=<%= per.getId()%>">
                                    Editar
                                </a>
                                <a class="btn btn-custom btn-delete btn-sm shadow-sm" href="Controlador?accion=eliminar&id=<%= per.getId()%>">
                                    Eliminar
                                </a>
                            </td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
            
            <p class="text-center mt-5 text-muted" style="font-size: 0.8rem;">
                © 2026 - Facultad de Ingeniería - Universidad Mariano Gálvez de Guatemala
            </p>
        </div>
    </body>
</html>