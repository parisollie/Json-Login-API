//
//  PostModel.swift
//  Jason
//
//  Created by Paul Jaime Felix Flores on 24/04/23.
//


import Foundation
//https://reqres.in/
/*
   Esta pagina nos pedira el Token,por eso le ponemos el token V-126,paso 1.0,
   Es la estructura que recibe el Json y le agregamos el protocolo Decodable
   que sirve para decodificarla.
*/
struct PostModel: Decodable {
    var token : String
}
