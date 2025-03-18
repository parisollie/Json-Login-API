//
//  Modelo1.swift
//  Jason
//
//  Created by Paul Jaime Felix Flores on 24/04/23.
//
//Vid 131
import Foundation
//Vid 131 , cambia todo en la pagina de quick Jason de Decodable a Codable x
struct Modelo1: Codable {
    let id: Int
    let name, username, email: String
    //Vid 132
    let address: Address
    let phone, website: String
    let company: Company
}
//Vid132, entramos a los subniveles de un json
// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable  {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}

