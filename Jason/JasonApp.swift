//
//  JasonApp.swift
//  Jason
//
//  Created by Paul Jaime Felix Flores on 24/04/23.
//

import SwiftUI

@main
struct JasonApp: App {
    var body: some Scene {
        //Vid128
        let login = PostViewModel()
        WindowGroup {
            //Vid128, proparemos esta variable por todo el content view 
            ContentView().environmentObject(login)
        }
    }
}
