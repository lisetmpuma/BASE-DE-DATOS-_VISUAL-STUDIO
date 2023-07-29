

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectData
{
    internal class DBConnection
    {
        public static void Main(string[] args)
        {
            DBConnection db = new DBConnection();
            db.query();
            Console.ReadKey();
        }

        private void query()
        {
      
                IList<Ciudad> ciudades = DataHelper.GetCiudades();

                if (ciudades == null || ciudades.Count == 0)
                {
                    Console.WriteLine("No data");
                    return;
                }

                foreach (Ciudad ciudad in ciudades)
                {
                    Console.WriteLine($"{ciudad.Id}: {ciudad.NombreCiudad}");
                }
            

        }

    }
}