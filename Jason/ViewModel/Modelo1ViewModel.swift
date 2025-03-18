//
//  Modelo1ViewModel.swift
//  Jason
//
//  Created by Paul Jaime Felix Flores on 24/04/23.
//
//Vid133
import Foundation

class Modelo1ViewModel: ObservableObject {
    //Vid 131,mandamos a llamar a nuestra estructura,la cual esta vacia
    @Published var datosModelo : [Modelo1] = []
    //Vid 131 Se ejecutara cuando se inicia
    init(){
        fetch()
    }
    //Vid 131
    func fetch(){
        //Vid 131 Tenemos nuestra URL
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return  }
        //Vid 131 , traemos el dato de data
        URLSession.shared.dataTask(with: url){data,_,_ in
            
            guard let data = data else { return }
            do{
                //Vid 131 Usamos corchetes porque traeremos mas modelos
                let json = try JSONDecoder().decode([Modelo1].self, from: data)
                //Vid 131 Dispatchque ,cuando traemos datos de internet
                DispatchQueue.main.async {
                    self.datosModelo = json
                }
            }catch let error as NSError{
                print("Error en el json", error.localizedDescription)
            }
           //Vid 131, ejecutamos el resume
        }.resume()
    }
    
}
