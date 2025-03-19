//
//  DetalleViewModel.swift
//  Jason
//
//  Created by Paul Jaime Felix Flores on 24/04/23.
//

//V-135,paso 3.15
import Foundation

class DetalleViewModel: ObservableObject {
    //Paso 3.18 Para descargar los datos ,hacemos variables
    @Published var first_name = ""
    @Published var email = ""
    @Published var avatar = ""
    
    func fetch(id: Int){
        //Paso 3.16 Le mandamos el id y se lo concatenamos con la diagonal invertida
        guard let url = URL(string: "https://reqres.in/api/users/\(id)") else { return  }
        
        URLSession.shared.dataTask(with: url){data,_,_ in
            
            guard let data = data else { return }
            do{
                let json = try JSONDecoder().decode(User.self, from: data)
                DispatchQueue.main.async {
                    //Paso 3.19, accedemos a las variables con cada uno de los campos 
                    self.first_name = json.data.first_name
                    self.email = json.data.email
                    self.avatar = json.data.avatar
                }
            }catch let error as NSError{
                print("Error en el json", error.localizedDescription)
            }
            
        }.resume()
    }
}

