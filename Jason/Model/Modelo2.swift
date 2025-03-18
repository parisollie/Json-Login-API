//
//  Modelo2.swift
//  Jason
//
//  Created by Paul Jaime Felix Flores on 24/04/23.
//

import Foundation
//Vid 133
struct Modelo2 : Decodable {
    var data : [UserList]
}
//Vid135,accedemos a otro tipo de lista dentro de la estructura 
struct User : Decodable{
    var data : UserList
}
//Vid133, creamos nuestra estructura
struct UserList : Decodable {
    var id : Int
    var first_name : String
    var email : String
    var avatar : String
}

