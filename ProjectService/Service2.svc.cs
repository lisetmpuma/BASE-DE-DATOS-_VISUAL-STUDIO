using System;
/*using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;*/
using System.Data.SqlClient; //agregar AHORA

namespace ProjectService
{
        public class Service2 : IService2
        {
            public void GuardarInformacion(string nombre, string apellidos, string sexo, string email, string direccion, string ciudad, 
                string requerimiento)
            {
                string connectionString = "Data Source=(localdb)\\ProjectModels;Initial Catalog=DBWeb1;Integrated Security=True";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        connection.Open();
                        string query = "INSERT INTO TablaInformacion2 (Nombre, Apellidos, Sexo, Email, Direccion, Ciudad, Requerimiento) " +
                                       "VALUES (@nombre, @apellidos, @sexo, @email, @direccion, @ciudad, @requerimiento)";

                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@nombre", nombre);
                            command.Parameters.AddWithValue("@apellidos", apellidos);
                            command.Parameters.AddWithValue("@sexo", sexo);
                            command.Parameters.AddWithValue("@email", email);
                            command.Parameters.AddWithValue("@direccion", direccion);
                            command.Parameters.AddWithValue("@ciudad", ciudad);
                            command.Parameters.AddWithValue("@requerimiento", requerimiento);
                            command.ExecuteNonQuery();
                        }

                    }
                    catch (Exception ex)
                    { Console.WriteLine("Error al guardar la información en la base de datos: " + ex.Message); }                                           // Manejo del error en caso de que no se pueda guardar la información

                     finally
                    { connection.Close(); }
            }
            }
        }
    }




