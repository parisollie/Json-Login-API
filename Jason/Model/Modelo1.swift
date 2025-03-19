//
//  Modelo1.swift
//  Jason
//
//  Created by Paul Jaime Felix Flores on 24/04/23.
//


import Foundation
//V-131,Paso 2.6 cambia todo en la pagina de quick Json de Decodable a Codable.
struct Modelo1: Codable {
    //Ponemos sus atributos.
    let id: Int
    let name, username, email: String
    //Vid 132
    let address: Address
    let phone, website: String
    let company: Company
}

//V-132,Paso 2.20 entramos a los subniveles de un json para podrer entrar a los siguientes subniveles.
// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

//Paso 2.21
// MARK: - Geo
struct Geo: Codable  {
    let lat, lng: String
}


// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}

