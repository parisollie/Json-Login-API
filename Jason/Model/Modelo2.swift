//
//  Modelo2.swift
//  Jason
//
//  Created by Paul Jaime Felix Flores on 24/04/23.
//

import Foundation
//V-133,paso 3.0
struct Modelo2 : Decodable {
    var data : [UserList]
}
//V-135,paso 3.17 accedemos a otro tipo de lista dentro de la estructura
struct User : Decodable{
    var data : UserList
}
//Paso 3.1, creamos nuestra estructura
struct UserList : Decodable {
    //Ponemos sus campos
    var id : Int
    var first_name : String
    var email : String
    var avatar : String
}

