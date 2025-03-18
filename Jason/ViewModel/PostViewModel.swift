//
//  PostViewModel.swift
//  Jason
//
//  Created by Paul Jaime Felix Flores on 24/04/23.
//

import Foundation

//Vid 126
class PostViewModel: ObservableObject {
    
    @Published var authenticated = 0
    //Vid 127 , el initi para saber que todo funciona bien
    init() {
        //https://reqres.in/
        //login(email: "eve.holt@reqres.in", password: "cityslicka")
        //Vid 131
        if let sesion = UserDefaults.standard.object(forKey: "sesion") as? Int {
            //si ese user existe le pondremos y sino le pondremos 0
            authenticated = sesion
        }else{
            authenticated = 0
        }
    }
        
    //Vid126, funcion del login
    func login(email: String, password: String){
        //Vid 127, guardamos la URL principal a la cual queremos acceder
        guard let url = URL(string: "https://reqres.in/api/login") else { return  }
        
        //Vid127, creamos los parametros que vamos a enviar
        let parametros = ["email":email,"password":password]
        
        //Body para enviar los parametros hacemos el body
        let body = try! JSONSerialization.data(withJSONObject: parametros)
        var request = URLRequest(url: url)
        
        //Vid 127, definos el metodo de enviar datos,POST porque enviamos datos
        request.httpMethod = "POST"
        //HTPP donde se envian los parametros
        request.httpBody = body
        //127 Cabeceras
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){data,response,error in
        //Vid 127, para saber que todo funciona
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            
            do{
                //El JSONCEcoder nos sirve para decodificarlo y mandarlo a nuestro POST model y obtenemos los datos de data
                let datos = try JSONDecoder().decode(PostModel.self, from: data)
                //Vid 127, if inverso ,si el token no trae nada
                if !datos.token.isEmpty{
                    //Administra las tareas que son pesadas el DispatchQueue,que se ejecute en el hilo principal
                    //pero en forma asincrona
                    DispatchQueue.main.async {
                        //Vid 128,imprimimos el token en pantalla
                        print(datos.token)
                        self.authenticated = 1
                        
                        //Vid 130,si accedemos a la autentiticacion guardamos el 1
                        UserDefaults.standard.setValue(1, forKey: "sesion")
                    }
                }
            }catch let error as NSError{
                print("Error al hacer post", error.localizedDescription)
                DispatchQueue.main.async {
                    //el 2 indicamos que es un error 
                    self.authenticated = 2
                }
            }
            
        }.resume()//Vid127, siempre se pone al final de la tarea porque sino causa errores
        
    }
    
}

