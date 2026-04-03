<%@page import="Modelo.Persona"%>
<%@page import="ModeloDAO.PersonaDAO"%> 
<%@page import="java.util.List"%>
<%@page import="Modelo.Departamento"%>
<%@page import="ModeloDAO.DepartamentoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Modificar Registro - UMG</title>
        <style>
            /* Fondo con degradado Azul (Igual al Listar) */
            body {
                background: linear-gradient(135deg, #00c6ff 0%, #0072ff 100%);
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0;
                font-family: 'Segoe UI', Tahoma, sans-serif;
            }

            /* Tarjeta de edición blanca y ancha */
            .edit-card {
                background: white;
                padding: 40px;
                border-radius: 25px;
                box-shadow: 0 15px 35px rgba(0,0,0,0.2);
                width: 100%;
                max-width: 600px; /* Un poco más ancha que el login */
            }

            h2 {
                color: #0056b3;
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
                border-color: #007bff;
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            }

            /* Botones estilo redondeado */
            .btn-custom {
                border-radius: 25px;
                padding: 12px;
                font-weight: bold;
                text-transform: uppercase;
                letter-spacing: 1px;
                transition: 0.3s;
            }

            .btn-update {
                background-color: #007bff;
                color: white;
                border: none;
                width: 100%;
            }

            .btn-update:hover {
                background-color: #0056b3;
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0,123,255,0.3);
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
            }
        </style>
    </head>
    <body>
        <div class="edit-card">
            <%
                PersonaDAO dao = new PersonaDAO();
                // Recuperamos el ID enviado desde el controlador
                int id = Integer.parseInt((String)request.getAttribute("idper"));
                Persona p = (Persona)dao.list(id);
            %>
            
            <h2>Editar Persona</h2>
            <hr class="mb-4">
            
            <form action="Controlador" method="GET">
                <div class="form-group">
                    <label>Documento DPI:</label>
                    <input class="form-control" type="text" name="txtDpi" value="<%= p.getDpi()%>" required>
                </div>

                <div class="form-group">
                    <label>Nombres Completos:</label>
                    <input class="form-control" type="text" name="txtNom" value="<%= p.getNom()%>" required>
                </div>

                <div class="form-group">
                    <label>Contraseña / Password:</label>
                    <input class="form-control" type="password" name="txtPass" value="<%= p.getPass()%>" placeholder="Nueva contraseña">
                </div>

                <div class="form-group">
                    <label>Departamento:</label>
                    <select name="txtIdDepto" class="form-control">
                        <%
                            DepartamentoDAO deptoDAO = new DepartamentoDAO();
                            List<Departamento> listDepto = deptoDAO.listar();
                            for (Departamento d : listDepto) {
                                String seleccionado = (d.getId() == p.getIdDepartamento()) ? "selected" : "";
                        %>
                        <option value="<%= d.getId() %>" <%= seleccionado %> >
                            <%= d.getNombre() %>
                        </option>
                        <% } %>      
                    </select>
                </div>
                
                <input type="hidden" name="txtid" value="<%= p.getId()%>">
                
                <div class="mt-4">
                    <button class="btn btn-custom btn-update" type="submit" name="accion" value="Actualizar">
                        Guardar Cambios
                    </button>
                    <a href="Controlador?accion=listar" class="btn btn-custom btn-back">
                        Cancelar y Regresar
                    </a>
                </div>
            </form>
        </div>
    </body>
</html>
