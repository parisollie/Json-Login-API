//
//  DetalleView.swift
//  Jason
//
//  Created by Paul Jaime Felix Flores on 24/04/23.
//

//Vid137

import SwiftUI

struct DetalleView: View {
    //Vid 135 , traemos el id 
    var id : Int
    @StateObject var user = DetalleViewModel()
    var body: some View {
        VStack{
            if user.avatar.isEmpty {
                ProgressView()
            }else{
                Image(systemName: "persona.fill")
                //Vid 135 , heredamos la vista de la imagen , no es necesaria hacerla dos veces
                    .data(url: URL(string: user.avatar)!)
                    .frame(width: 130, height: 130)
                    .clipped()
                    .clipShape(Circle())
                Text(user.first_name).font(.largeTitle)
                Text(user.email).font(.title)
            }
        }.onAppear{
            user.fetch(id: id)
        }
    }
}
