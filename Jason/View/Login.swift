//
//  Login.swift
//  Jason
//
//  Created by Paul F on 18/03/25.
//


//login(email: "eve.holt@reqres.in", password: "cityslicka")
import SwiftUI

struct Login: View {
    // Vid 128
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false // Estado para mostrar u ocultar contraseña
    @EnvironmentObject var login: PostViewModel
    
    var body: some View {
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
                    // Mandamos a llamar a login
                    login.login(email: email, password: password)
                }) {
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

