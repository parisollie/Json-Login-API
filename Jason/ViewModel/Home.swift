//
//  Home.swift
//  Jason
//
//  Created by Paul Jaime Felix Flores on 24/04/23.
//

import SwiftUI

struct Home: View {
    //Vid132
    @EnvironmentObject var login : PostViewModel
    //Vid131, mandamos a llamar nuestro objeto
    @StateObject var json = Modelo1ViewModel()
    
    var body: some View {
        NavigationView{
            /*Vid130
            Text("Bienvenido")
                .navigationBarTitle("JSON")
                .navigationBarItems(leading:
                                        Button(action:{
                                            //Vid130
                                            UserDefaults.standard.removeObject(forKey: "sesion")
                                            login.authenticated = 0
                                        }){
                                            Text("Salir")
                                        }
                                    , trailing:
                                        Button(action:{
                                              //
                                        }){
                                           Text("Siguiente")
                                        })*/
                                       /* NavigationLink(destination: Home2()){
                                            Text("Siguiente")
                                        }
                )*/
            //Vid131, si el modelo esta vacio, llamamos a un progressView , que es un cargador.
            if json.datosModelo.isEmpty {
                //Vid 131, es un cargador
                ProgressView()
            }else{
                //Ponemos un list para ver nuestros datos
                //id:\.id, identificamos el campo
                List(json.datosModelo, id:\.id){ item in
                    VStack(alignment: .leading){
                        Text(item.name)
                        Text(item.email)
                        //Vid132, para poder llamar a la direccion , geografia y latitud 
                        Text(item.address.geo.lat)
                    }
                }.navigationBarTitle("JSON")
                .navigationBarItems(leading:
                                        Button(action:{
                    //Eliminamos el UserDefaults y que cambio la variablea 0 para poder regresar al login 
                                            UserDefaults.standard.removeObject(forKey: "sesion")
                    //para regresar al login
                                            login.authenticated = 0
                                        }){
                                            Text("Salir")
                                        }
                                    , trailing:
                                        //Vid 133
                                        NavigationLink(destination: Home2()){
                                            Text("Siguiente")
                                        }
                )
            }
        }
    }
}

