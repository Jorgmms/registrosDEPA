<%@page import="Modelo.Departamento"%>
<%@page import="ModeloDAO.DepartamentoDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Nuevo Registro - UMG</title>
        <style>
            /* Fondo con degradado VERDE (Consistente con todo el sistema) */
            body {
                background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%);
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0;
                font-family: 'Segoe UI', Tahoma, sans-serif;
            }

            /* Tarjeta de registro blanca */
            .add-card {
                background: white;
                padding: 40px;
                border-radius: 25px;
                box-shadow: 0 15px 35px rgba(0,0,0,0.2);
                width: 100%;
                max-width: 550px;
            }

            h2 {
                color: #1e8449;
                font-weight: bold;
                text-transform: uppercase;
                margin-bottom: 30px;
                text-align: center;
                letter-spacing: 1px;
            }

            .form-group label {
                font-weight: 600;
                color: #555;
                margin-bottom: 8px;
                margin-left: 5px;
            }

            .form-control {
                border-radius: 15px;
                padding: 12px 15px;
                border: 1px solid #dee2e6;
                margin-bottom: 20px;
                transition: 0.3s;
            }

            .form-control:focus {
                border-color: #2ecc71;
                box-shadow: 0 0 0 0.2rem rgba(46, 204, 113, 0.2);
            }

            /* Botones estilo redondeado */
            .btn-custom {
                border-radius: 25px;
                padding: 12px;
                font-weight: bold;
                text-transform: uppercase;
                letter-spacing: 1px;
                transition: 0.3s;
                border: none;
            }

            .btn-add-submit {
                background-color: #2ecc71;
                color: white;
                width: 100%;
                box-shadow: 0 4px 10px rgba(46, 204, 113, 0.3);
            }

            .btn-add-submit:hover {
                background-color: #27ae60;
                transform: translateY(-2px);
                box-shadow: 0 6px 15px rgba(39, 174, 96, 0.4);
            }

            .btn-back {
                background-color: #f8f9fa;
                color: #666;
                border: 1px solid #ddd;
                width: 100%;
                margin-top: 10px;
                text-decoration: none;
                display: block;
                text-align: center;
            }

            .btn-back:hover {
                background-color: #e2e6ea;
                color: #333;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="add-card shadow-lg">
            <h2>Nuevo Registro</h2>
            <p class="text-center text-muted mb-4">Complete los datos para la nueva persona</p>
            <hr class="mb-4">
            
            <form action="Controlador" method="GET">
                <div class="form-group">
                    <label>Documento DPI:</label>
                    <input class="form-control" type="text" name="txtDpi" placeholder="Ej: 1234567890123" required>
                </div>

                <div class="form-group">
                    <label>Nombres Completos:</label>
                    <input class="form-control" type="text" name="txtNom" placeholder="Nombre Apellido" required>
                </div>

                <div class="form-group">
                    <label>Contraseña de Acceso:</label>
                    <input class="form-control" type="password" name="txtPass" placeholder="Mínimo 6 caracteres" required>
                </div>

                <!-- NUEVO CAMPO DE CORREO ELECTRÓNICO -->
                <div class="form-group">
                    <label>Correo Electrónico:</label>
                    <input class="form-control" type="email" name="txtCorreo" placeholder="ejemplo@correo.com" required>
                </div>

                <div class="form-group">
                    <label>Departamento Asignado:</label>
                    <select name="txtIdDepto" class="form-control">
                        <option value="0">-- Seleccione --</option>
                        <%
                            DepartamentoDAO deptoDAO = new DepartamentoDAO();
                            List<Departamento> listaDeptos = deptoDAO.listar();
                            for (Departamento d : listaDeptos) {
                        %>
                        <option value="<%= d.getId() %>">
                            <%= d.getNombre() %>
                        </option>
                        <% } %>      
                    </select>
                </div>
                
                <div class="mt-4">
                    <button class="btn btn-custom btn-add-submit" type="submit" name="accion" value="Agregar">
                        Registrar Persona
                    </button>
                    <a href="Controlador?accion=listar" class="btn btn-custom btn-back">
                        Volver al Listado
                    </a>
                </div>
            </form>
        </div>
    </body>
</html>