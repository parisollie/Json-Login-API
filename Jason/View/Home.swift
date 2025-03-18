//
//  Home.swift
//  Jason
//
//  Created by Paul F on 18/03/25.
//

import SwiftUI

struct Home: View {
    //Vid132
    @EnvironmentObject var login: PostViewModel
    //Vid131, mandamos a llamar nuestro objeto
    @StateObject var json = Modelo1ViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                // Fondo con degradado
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)]),
                               startPoint: .top,
                               endPoint: .center)
                    .edgesIgnoringSafeArea(.all)
                
                if json.datosModelo.isEmpty {
                    //Vid 131, es un cargador
                    ProgressView()
                } else {
                    //Vid131, List para mostrar los datos
                    List(json.datosModelo, id: \.id) { item in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(item.name)
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            Text(item.email)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            //Vid132, para poder llamar a la dirección, geografía y latitud
                            Text("Latitud: \(item.address.geo.lat)")
                                .font(.footnote)
                                .foregroundColor(.blue)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading) // Forzar tamaño uniforme
                        .background(Color.white.opacity(0.9)) // Fondo semitransparente en cada celda
                        .cornerRadius(10)
                        .shadow(radius: 2)
                    }
                    .background(Color.clear) // Hace que la lista no tenga fondo blanco
                    .scrollContentBackground(.hidden) // Oculta el fondo de la lista en iOS 16+
                    .navigationBarTitle("JSON")
                    .navigationBarItems(
                        leading:
                            Button(action: {
                                // Eliminamos el UserDefaults y cambiamos la variable a 0 para regresar al login
                                UserDefaults.standard.removeObject(forKey: "sesion")
                                login.authenticated = 0
                            }) {
                                Text("Salir")
                            },
                        trailing:
                            //Vid 133, botón para ir a la siguiente vista
                            NavigationLink(destination: Home2()) {
                                Text("Siguiente")
                            }
                    )
                }
            }
        }
    }
}

#Preview {
    Home()
        .environmentObject(PostViewModel()) // Se agrega el environmentObject necesario
}

