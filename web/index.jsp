<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>LOGIN - Sistema UMG</title>
        <style>
            /* Fondo con degradado VERDE vibrante */
            body {
                background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%);
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            /* Tarjeta blanca redondeada */
            .login-card {
                background: #ffffff;
                padding: 40px;
                border-radius: 25px;
                box-shadow: 0 15px 35px rgba(0,0,0,0.2);
                width: 100%;
                max-width: 380px;
                text-align: center;
            }

            /* Estilo del logo */
            .logo-umg {
                width: 130px;
                margin-bottom: 15px;
            }

            .login-card h2 {
                color: #1e8449; /* Verde oscuro para el título */
                font-weight: bold;
                font-size: 26px;
                margin-bottom: 25px;
                text-transform: uppercase;
                letter-spacing: 1px;
            }

            /* Inputs redondeados y estilizados */
            .form-control {
                border-radius: 15px;
                border: 1px solid #ddd;
                padding: 12px 15px;
                margin-bottom: 20px;
                transition: 0.3s;
            }

            .form-control:focus {
                border-color: #2ecc71;
                box-shadow: 0 0 0 0.2rem rgba(46, 204, 113, 0.2);
            }

            /* Botón VERDE redondeado */
            .btn-umg {
                background-color: #2ecc71;
                color: white;
                border: none;
                border-radius: 25px;
                padding: 12px;
                width: 100%;
                font-weight: bold;
                text-transform: uppercase;
                letter-spacing: 1px;
                transition: 0.3s;
                box-shadow: 0 4px 10px rgba(46, 204, 113, 0.3);
            }

            .btn-umg:hover {
                background-color: #27ae60;
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 6px 15px rgba(39, 174, 96, 0.4);
            }
            
            /* Mensaje de error (opcional por si fallan las credenciales) */
            .error-msg {
                color: #e74c3c;
                font-size: 14px;
                margin-bottom: 15px;
            }
        </style>
    </head>
    <body>

        <div class="login-card">
            <img src="Logo_umg.png" alt="Logo UMG" class="logo-umg">
            
            <h2>Acceso</h2>
            
            <%-- Mostrar mensaje si el Servlet detecta error --%>
            <% if(request.getParameter("error") != null) { %>
                <div class="error-msg text-center">
                    Datos incorrectos. Intente de nuevo.
                </div>
            <% } %>
            
            <form action="Validar" method="POST">
                <input type="text" name="txtuser" class="form-control" placeholder="Nombre de Usuario" required>
                <input type="password" name="txtpass" class="form-control" placeholder="Contraseña" required>
                
                <button type="submit" name="accion" value="Ingresar" class="btn btn-umg">
                    Ingresar al Sistema
                </button>
            </form>
            
            <p class="text-center mt-4 text-muted" style="font-size: 11px;">
                © 2026 - Universidad Mariano Gálvez
            </p>
        </div>

    </body>
</html>