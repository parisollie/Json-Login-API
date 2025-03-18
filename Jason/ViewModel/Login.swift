//
//  Login.swift
//  Jason
//
//  Created by Paul Jaime Felix Flores on 24/04/23.
//
//Vid130,Hacemos el Login

import SwiftUI

struct Login: View {
    //Vid 128
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var login : PostViewModel
   
    
    var body: some View {
        ZStack{
            //Ignoramos el area 
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack{
                Text("Email").foregroundColor(.white).bold()
                TextField("Email", text: $email)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                //Para que el usuario pueda poner el @
                    .keyboardType(.emailAddress)
                Text("Password").foregroundColor(.white).bold()
                SecureField("Password", text: $password)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action:{
                    //Mandamos a llamar a login 
                    login.login(email: email, password: password)
                }){
                    Text("Entrar").foregroundColor(.white).bold()
                }
            }.padding(.all)
        }
    }
}


