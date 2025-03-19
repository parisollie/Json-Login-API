//
//  DetalleView.swift
//  Jason
//
//  Created by Paul F on 18/03/25.
//

import SwiftUI

struct DetalleView: View {
    //V-135 ,paso 3.13 traemos el id
    var id: Int
    //paso 3.20
    @StateObject var user = DetalleViewModel()
    
    var body: some View {
        ZStack {
            // Fondo con degradado suave
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                //paso 3.24
                if user.avatar.isEmpty {
                    //indicador de carga
                    ProgressView()
                        .scaleEffect(1.5)
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                } else {
                    VStack(spacing: 15) {
                        //Paso 3.22 imagen de usuario con mejoras visuales
                        Image(systemName: "person.fill")
                            .data(url: URL(string: user.avatar)!)
                            .frame(width: 130, height: 130)
                            .clipped()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                        
                        //Paso 3.23,información del usuario dentro de una tarjeta
                        VStack(spacing: 8) {
                            Text(user.first_name)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text(user.email)
                                .font(.body)
                                .foregroundColor(.white.opacity(0.9))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(12)
                        .shadow(radius: 10)
                        
                        //Paso 3.26, botón estilizado
                        Button(action: {
                            // Acción del botón (Ej: cerrar vista o regresar)
                        }) {
                            Text("Regresar")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: 200)
                                .background(Color.purple.opacity(0.8))
                                .cornerRadius(12)
                                .shadow(radius: 5)
                        }
                        .padding(.top, 20)
                    }
                    .padding()
                }
            }
        }
        //Paso 3.21
        .onAppear {
            //obtenemos los datos del usuario
            user.fetch(id: id)
        }
    }
}

#Preview {
    DetalleView(id: 2)
}

