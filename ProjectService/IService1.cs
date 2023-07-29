using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace ProjectService
{
      [ServiceContract]
    public interface IService1
    {
        [OperationContract]
        IList <String> getCiudades(); //Ilist :Es el tipo de retorno del método getCiudades() ,IList es una interfaz genérica que representa una lista de elementos, 
                                       //Especificamos q la lista contendra datos tipos string
    }
}
