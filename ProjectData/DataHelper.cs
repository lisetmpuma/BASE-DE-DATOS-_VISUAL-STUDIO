using ProjectData;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectData
{

    public static class DataHelper
    {
        private static string connectionString = "Data Source=(localdb)\\ProjectModels;Initial Catalog=DBWeb1;Integrated Security=True";


        public static IList<Ciudad> GetCiudades()

        {
            List<Ciudad> ciudades = new List<Ciudad>();


            using (SqlConnection connection = new SqlConnection(connectionString))

            {
                string query = "SELECT Id, Ciudad FROM DataCiudad";


                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                   
                    {
                        while (reader.Read())
                        {
                            int id = Convert.ToInt32(reader["Id"]);
                            string nombreCiudad = reader["Ciudad"].ToString();

                            Ciudad ciudad = new Ciudad { Id = id, NombreCiudad = nombreCiudad };
                            ciudades.Add(ciudad);
                        }
                    }
                }
            }

            return ciudades;
        }
    }


}





