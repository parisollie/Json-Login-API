//
//  Home2.swift
//  Jason
//
//  Created by Paul F on 18/03/25.
//

import SwiftUI

struct Home2: View {
    @StateObject var json2 = Modelo2ViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                // Fondo con degradado en la parte superior
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)]),
                               startPoint: .top,
                               endPoint: .center)
                    .edgesIgnoringSafeArea(.all)
                
                if json2.datosModelo.data.isEmpty {
                    //Vid 133, cargador
                    ProgressView()
                } else {
                    List(json2.datosModelo.data, id:\.id) { item in
                        //Vid135, navegación al detalle
                        NavigationLink(destination: DetalleView(id: item.id)) {
                            HStack(spacing: 16) {
                                // Imagen redonda con borde
                                Image(systemName: "persona.fill")
                                    .data(url: URL(string: item.avatar)!)
                                    .frame(width: 80, height: 80)
                                    .clipped()
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                
                                // Datos alineados a la izquierda
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(item.first_name)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    
                                    Text(item.email)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white.opacity(0.9)) // Fondo semitransparente
                            .cornerRadius(12)
                            .shadow(radius: 3)
                        }
                    }
                    .background(Color.clear)
                    .scrollContentBackground(.hidden)
                    .navigationBarTitle("JSON CON IMAGEN", displayMode: .inline)
                }
            }
        }
    }
}

//Vid 134, hacemos una extensión para cargar la imagen desde una URL
extension Image {
    func data(url: URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
}

#Preview {
    Home2()
}
