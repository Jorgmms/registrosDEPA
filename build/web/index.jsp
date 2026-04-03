<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>LOGIN</title>
        <style>
            /* Fondo con degradado azul/celeste */
            body {
                background: linear-gradient(135deg, #a8e6cf 0%, #2575fc 100%);
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
                border-radius: 20px;
                box-shadow: 0 10px 25px rgba(0,0,0,0.1);
                width: 100%;
                max-width: 350px;
                text-align: center;
            }

            /* Estilo del logo */
            .logo-umg {
                width: 120px;
                margin-bottom: 10px;
            }

            .login-card h2 {
                color: #0097b2;
                font-weight: bold;
                font-size: 24px;
                margin-bottom: 25px;
                text-transform: uppercase;
            }

            /* Inputs redondeados */
            .form-control {
                border-radius: 10px;
                border: 1px solid #ddd;
                padding: 12px;
                margin-bottom: 15px;
            }

            /* Botón azul redondeado */
            .btn-umg {
                background-color: #0097b2;
                color: white;
                border: none;
                border-radius: 25px;
                padding: 12px;
                width: 100%;
                font-weight: bold;
                transition: 0.3s;
            }

            .btn-umg:hover {
                background-color: #007a8f;
                color: white;
                box-shadow: 0 4px 15px rgba(0, 151, 178, 0.4);
            }
        </style>
    </head>
    <body>

        <div class="login-card">
            <img src="Logo_umg.png" alt="Logo UMG" class="logo-umg">
            
            <h2>LOGIN</h2>
            
            <form action="Validar" method="POST">
                <input type="text" name="txtuser" class="form-control" placeholder="Nombre de Usuario" required>
                <input type="password" name="txtpass" class="form-control" placeholder="Contraseña" required>
                
                <button type="submit" name="accion" value="Ingresar" class="btn btn-umg">
                    Ingresar
                </button>
            </form>
        </div>

    </body>
</html>
