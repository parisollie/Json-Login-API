//
//  Home.swift
//  Jason
//
//  Created by Paul F on 18/03/25.
//

import SwiftUI

struct Home: View {
    //V-132,paso 2.3
    @EnvironmentObject var login: PostViewModel
    //Paso 2.15,Mandamos a llamar nuestro objeto
    @StateObject var json = Modelo1ViewModel()
    
    var body: some View {
        //Paso 2.0
        NavigationView {
            ZStack {
                // Fondo con degradado
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)]),
                               startPoint: .top,
                               endPoint: .center)
                    .edgesIgnoringSafeArea(.all)
                //Paso 2.16
                if json.datosModelo.isEmpty {
                    //Paso 2.17 ,es un cargador que gira
                    ProgressView()
                } else {
                    //Paso 2.18 List para mostrar los datos
                    List(json.datosModelo, id: \.id) { item in
                        //Paso 2.19
                        VStack(alignment: .leading, spacing: 8) {
                            Text(item.name)
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            Text(item.email)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            //V-132,paso 2.22 para poder llamar a la dirección, geografía y latitud
                            Text("Latitud: \(item.address.geo.lat)")
                                .font(.footnote)
                                .foregroundColor(.blue)
                        }
                        .padding()
                        // Forzar tamaño uniforme
                        .frame(maxWidth: .infinity, alignment: .leading)
                        // Fondo semitransparente en cada celda
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .shadow(radius: 2)
                    }
                    // Hace que la lista no tenga fondo blanco
                    .background(Color.clear)
                    // Oculta el fondo de la lista en iOS 16+
                    .scrollContentBackground(.hidden)
                    //Paso 2.1
                    .navigationBarTitle("JSON")
                    .navigationBarItems(
                        leading:
                            //Paso 2.2
                            Button(action: {
                                //Paso 2.5 Eliminamos el UserDefaults y cambiamos la variable a 0 para regresar al login
                                UserDefaults.standard.removeObject(forKey: "sesion")
                                //Paso 2.4
                                login.authenticated = 0
                            }) {
                                Text("Salir")
                                    .foregroundColor(.purple)
                                    //.font(.title)
                                   
                            },
                        /*
                          //Es un botón más bonito pero no cabe
                          Button(action: {
                            // Eliminamos el UserDefaults y cambiamos la variable a 0 para regresar al login
                            UserDefaults.standard.removeObject(forKey: "sesion")
                            login.authenticated = 0
                        }) {
                            HStack {
                                Image(systemName: "arrow.right.square.fill") // Icono de logout
                                    .font(.body) // Tamaño más pequeño
                                Text("Salir")
                                    .font(.body) // Fuente más compacta
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.white)
                            .padding(8) // Padding reducido
                            .background(Color.blue)
                            .cornerRadius(8) // Esquinas menos redondeadas
                            .shadow(radius: 2) // Sombra más sutil
                        },*/
                        
                        trailing:
                            //V-133,Paso 3.10 botón para ir a la siguiente vista
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

