//
//  Login.swift
//  Jason
//
//  Created by Paul F on 18/03/25.
//


//login(email: "eve.holt@reqres.in", password: "cityslicka")
import SwiftUI

struct Login: View {
    // V-128,Paso 1.14
    @State private var email = ""
    @State private var password = ""
    // Estado para mostrar u ocultar contraseña
    @State private var isPasswordVisible = false
    
    //V-127,Paso 1.11 varaiable para el login
    @EnvironmentObject var login: PostViewModel
    
    var body: some View {
        //Paso 1.17
        ZStack {
            // Fondo con degradado para mejor estética
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // Título
                Text("Iniciar Sesión")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 10) {
                    //Paso 1.18
                    Text("Email")
                        .foregroundColor(.white)
                        .bold()
                    TextField("Correo electrónico", text: $email)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    //paso 1.19
                    Text("Password")
                        .foregroundColor(.white)
                        .bold()
                    HStack {
                        if isPasswordVisible {
                            TextField("Contraseña", text: $password)
                        } else {
                            SecureField("Contraseña", text: $password)
                        }
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                }
                
                Button(action: {
                    //Paso 1.21 Mandamos a llamar a login
                    login.login(email: email, password: password)
                }) {
                    //Paso 1.20
                    Text("Entrar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            }
            .padding()
        }
    }
}

#Preview {
    Login()
}

