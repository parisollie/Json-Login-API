//
//  Home2.swift
//  Jason
//
//  Created by Paul Jaime Felix Flores on 24/04/23.
//

//Vid 135
import SwiftUI

struct Home2: View {
    
    @StateObject var json2 = Modelo2ViewModel()
    
    var body: some View {
        if json2.datosModelo.data.isEmpty {
            //Vid 133, ponemos nuestro cargador
            ProgressView()
        }else{
            List(json2.datosModelo.data, id:\.id){ item in
                //Vid135,para que nos de el id 
                NavigationLink(destination: DetalleView(id: item.id)){
                    HStack{
                        //vid135
                        //Image(item.avatar)
                        //Vid134
                        Image(systemName: "persona.fill")
                        //Mandamos a llamar la imagen con la extencion data 
                            .data(url: URL(string: item.avatar)!)
                            .frame(width: 80, height: 80)
                            .clipped()
                            .clipShape(Circle())
                        //Vid 133 ,para ver los datos a la derecha 
                        VStack(alignment: .leading){
                            Text(item.first_name).font(.title)
                            Text(item.email).font(.subheadline)
                        }
                    }.navigationBarTitle("JSON CON IMAGEN")
                }
            }
        }
    }
}
//Vid 134, hacemos una extencion para poder llamar la imagen dentro de una url
extension Image {
    func data(url: URL) -> Self {
        if let data = try? Data(contentsOf: url){
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        //vid 134, lo retornamos con self para usarlo con nuestra estructura
        return self
            .resizable()
    }
}

