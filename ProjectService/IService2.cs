using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;


namespace ProjectService
{
    [ServiceContract]
    public interface IService2
    {
        [OperationContract]
        void GuardarInformacion(string nombre, string apellidos,
            string sexo, string email, string direccion,
            string ciudad, string requerimiento);
    }
}

