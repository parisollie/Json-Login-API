//
//  ContentView.swift
//  Jason
//
//  Created by Paul Jaime Felix Flores on 24/04/23.
//

import SwiftUI

struct ContentView: View {
    //Vid 129
    @EnvironmentObject var login : PostViewModel
    
    //Vid 129
    var body: some View {
        Group{
            //Si estamos en cero estamos en la pantalla de login
            if login.authenticated == 0 {
                //Mandamos al login
                Login()
            }else if login.authenticated == 1 {
                //Si todo salio bien , nos vamos al Home 
                Home()
            }else if login.authenticated == 2 {
                VStack{
                    Text("Usuario y/o contraseña incorrectos")
                    Button(action:{
                        login.authenticated = 0
                    }){
                        Text("Regresar")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
