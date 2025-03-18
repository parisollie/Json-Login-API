//
//  Modelo2ViewModel.swift
//  Jason
//
//  Created by Paul Jaime Felix Flores on 24/04/23.
//

//Vid132
import Foundation

class Modelo2ViewModel: ObservableObject {
    //Vid 132 , accedemos al modelo 2 con un array vacio
    @Published var datosModelo = Modelo2(data: [])
    
    init(){
        fetch()
    }
    
    func fetch(){
        guard let url = URL(string: "https://reqres.in/api/users?page=2") else { return  }
        
        URLSession.shared.dataTask(with: url){data,_,_ in
            
            guard let data = data else { return }
            do{
                //Vid 132, accedemos al data sin corchetes porque ya tiene los datos 
                let json = try JSONDecoder().decode(Modelo2.self, from: data)
                DispatchQueue.main.async {
                    self.datosModelo = json
                }
            }catch let error as NSError{
                print("Error en el json", error.localizedDescription)
            }
            
        }.resume()
    }
}
