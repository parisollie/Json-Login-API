//
//  PostViewModel.swift
//  Jason
//
//  Created by Paul Jaime Felix Flores on 24/04/23.
//

import Foundation

//V-126,Paso 1.1,creamos el PostViewModel y le ponemos el ObservableObject
class PostViewModel: ObservableObject {
    
    //Paso 1.2, variable por defecto le ponemos 0, para saber si estamos logeados o no
    @Published var authenticated = 0
    
    //Paso 1.10, el init es  para saber que todo funciona bien
    init() {
        /*
         
         https://reqres.in/
         login(email: "eve.holt@reqres.in", password: "cityslicka")*/
        
        //Paso 1.25
        if let sesion = UserDefaults.standard.object(forKey: "sesion") as? Int {
            //si ese user existe le pondremos y sino le pondremos 0.
            authenticated = sesion
        }else{
            authenticated = 0
        }
    }
        
    //Paso 1.3,función del login
    func login(email: String, password: String){
        
        //V-127,Paso 1.4 guardamos la URL principal a la cual queremos acceder
        guard let url = URL(string: "https://reqres.in/api/login") else { return  }
        
        //Paso 1.5, creamos los parámetros que vamos a enviar
        let parametros = ["email":email,"password":password]
        
        //Paso 1.6,el Body es donde nosotros vamos a poder enviar los parámetros.
        let body = try! JSONSerialization.data(withJSONObject: parametros)
        var request = URLRequest(url: url)
        
        //Paso 1.7, definos el metodo de enviar datos,POST porque enviamos datos
        request.httpMethod = "POST"
        //HTPP donde se envian los parámetros
        request.httpBody = body
        //Cabeceras
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //Paso 1.8
        URLSession.shared.dataTask(with: request){data,response,error in
            //Para saber que todo funciona
            if let response = response {
                print(response)
            }
            
            //Paso 1.12
            guard let data = data else { return }
            
            //Paso 1.13
            do{
                /*
                   El jsonDecoder nos sirve para decodificarlo y mandarlo a nuestro POST model y
                   obtenemos los datos de data
                */
                let datos = try JSONDecoder().decode(PostModel.self, from: data)
                //if inverso ,si el token no trae nada
                if !datos.token.isEmpty{
                    /*
                      Administra las tareas que son pesadas el DispatchQueue,que se ejecute
                      en el hilo principal pero en forma asíncrona.
                     */
                    DispatchQueue.main.async {
                        
                        //V-128,imprimimos el token en pantalla
                        print(datos.token)
                        //Si se autentico cambiamos del 0 al 1
                        self.authenticated = 1
                        
                        //V-130,paso 1.24 si accedemos a la autentiticacion guardamos el 1
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
            
        }
        //Paso 1.9, siempre se pone al final de la tarea porque sino causa errores
        .resume()
        
    }
    
}

