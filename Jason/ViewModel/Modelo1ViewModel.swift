//
//  Modelo1ViewModel.swift
//  Jason
//
//  Created by Paul Jaime Felix Flores on 24/04/23.
//

import Foundation

class Modelo1ViewModel: ObservableObject {
    //V-131,paso 2.7,mandamos a llamar a nuestra estructura,la cual esta vacia
    @Published var datosModelo : [Modelo1] = []
    
    //Paso 2.8 Se ejecutara cuando se inicia
    init(){
        fetch()
    }
    
    //Paso 2.9
    func fetch(){
        //Ponemos nuestra URL, Tenemos nuestra URL
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return  }
        
        //Paso 2.10,traemos el dato de data
        URLSession.shared.dataTask(with: url){data,_,_ in
            //Paso 2.12
            guard let data = data else { return }
            do{
                //Paso 2.13,Usamos corchetes porque traeremos más modelos
                let json = try JSONDecoder().decode([Modelo1].self, from: data)
                
                //Paso 2.14,Dispatchque ,cuando traemos datos de internet
                DispatchQueue.main.async {
                    self.datosModelo = json
                }
            }catch let error as NSError{
                print("Error en el json", error.localizedDescription)
            }
           //Paso 2.11,ejecutamos el resume
        }.resume()
    }
    
}
