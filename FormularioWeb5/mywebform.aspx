<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mywebform.aspx.cs" Inherits="FormularioWeb5.mywebform" %>

<!DOCTYPE html>

<html >
<head >

    
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v6.0.0-beta1/css/all.css">
   

     <style>
        
        .form-container {       /*  centrar el formulario */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        #requerimiento {
            height: 120px;           /* Estilo personalizado para hacer el campo de Requerimiento más grande */
        }
    
        .half-width {
            width: 45%;                /* Estilo personalizado para ajustar el tamaño de los campos Nombre, Apellido, Email y Dirección */
        }
       
        .full-width {
            width: 90%;                 /* Estilo personalizado para ajustar el tamaño de Dirección y Ciudad */
        }
        
        .btn-custom {                   /* Estilo personalizado para los botones */
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
        }
      
        .custom-form {                   /* Estilo personalizado para el formulario */
            background-color: #f5f5f5;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        .form-title {                   /* Estilo personalizado para el título del formulario */
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }
       
        .label-ciudad {                 /* Estilo personalizado para el campo de Ciudad */
            display: block;
            margin-bottom: 5px;
        }
       
        .form-check-label {                /* Estilo personalizado para el campo de Sexo */
            margin-right: 10px;
        }
    </style>


    <script>
        function validar() {

            const nombre = document.getElementById("<%=nombre.ClientID%>").value;       //ojo elimina lo espacios vacios
            const apellidos = document.getElementById("<%=apellidos.ClientID%>").value;

            const masculino = document.getElementById("<%=masculino.ClientID%>").checked;
            const femenino = document.getElementById("<%=femenino.ClientID%>").checked;

            const ciudad = document.getElementById("<%=ciudad.ClientID%>").selectedIndex;
            const correo = document.getElementById("<%=correo.ClientID%>").value;

            const validarNombreApellido = /^[a-zA-Z\s]+$/;
            const Dominio = correo.substring(correo.lastIndexOf('@') + 1);


            if (!validarNombreApellido.test(nombre.trim())) {                      //telimina espacios en blanco al inicio y final (trim:) ,despues evalua  si el cnteniddo de nombre ocoincide con el patron validarnombreapellido
                alert("Error en Nombre");
                return false;
            }

            if (!validarNombreApellido.test(apellidos.trim())) {                      
                alert("Error en Apellidos");
                return false;
            }

            if (!masculino && !femenino) {
                alert("ERROR seleccionar Sexo");
                return false;
            }

            if (Dominio !== 'unsa.edu.pe') {
                alert("Error en correo");
                return false;
            }


            if (ciudad === 0) {                                 //1er intento funcioa cambiando "" por 0
                alert("ERROR seleccionar Ciudad");
                return false;
            }


            alert(Date());

            mostrarResumen();
            return false;
        }
      
    </script>



</head>
     
<body>

 
    <div class="container form-container">
        <form runat="server" class="col-lg-6 custom-form">
            <div class="form-title">Formulario de Registro</div>

            <!-- 1ra línea -->
            <div class="form-group">
                <label for="Nombre">Nombre:</label>
                <asp:TextBox ID="nombre" runat="server" name="nombre" class="form-control half-width"></asp:TextBox>
            </div>

            <!-- 2da línea -->
            <div class="form-group">
                <label for="Apellidos">Apellidos:</label>
                <asp:TextBox ID="apellidos" runat="server" name="apellidos" class="form-control half-width"></asp:TextBox>
            </div>

            <!-- 3ra línea (Sexo) -->
            <div class="form-group">
                <label>Sexo:</label>
                <br>
                <div class="form-check form-check-inline">
                    <asp:RadioButton ID="masculino" runat="server" GroupName="sexo" CssClass="form-check-input" />
                    <label class="form-check-label" for="masculino">Masculino</label>
                </div>
                <div class="form-check form-check-inline">
                    <asp:RadioButton ID="femenino" runat="server" GroupName="sexo" CssClass="form-check-input" />
                    <label class="form-check-label" for="femenino">Femenino</label>
                </div>
            </div>

            <!-- 4ta línea -->
            <div class="form-group">
                <label>Email:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-at"></i></span>
                    </div>
                    <asp:TextBox ID="correo" runat="server" class="form-control half-width"></asp:TextBox>
                </div>
            </div>

            <!-- 5ta línea (Dirección y Ciudad en la misma línea) -->
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="Direccion">Dirección:</label>
                    <asp:TextBox ID="direccion" runat="server" name="direccion" class="form-control full-width"></asp:TextBox>
                </div>
                <div class="form-group col-md-6">
                    <label class="label-ciudad">Ciudad:</label>
                    <asp:DropDownList ID="ciudad" runat="server" class="form-control full-width">
                        <asp:ListItem Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            

            <!-- 6ta línea -->
            <div class="form-group">
                <label for="Requerimiento">Requerimiento:</label>
                <asp:TextBox ID="requerimiento" runat="server" name="requerimiento" class="form-control" TextMode="MultiLine"></asp:TextBox>
            </div>

            <!-- 7ma línea -->
            <div class="form-group text-center">
                <asp:Button ID="Enviar" runat="server" Text="Enviar" OnClientClick="validar();" OnClick="EnviarClick" class="btn btn-primary btn-custom" />
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="Eliminar_Click" type="button" class="btn btn-danger btn-custom ml-2" />
            </div>

            <div id="cuadroResumen" runat="server" visible="false"></div>
        </form>
    </div>

    <!-- referencia a Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>
