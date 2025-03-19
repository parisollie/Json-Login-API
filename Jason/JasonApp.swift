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
        //V-128,paso 1.15
        let login = PostViewModel()
        WindowGroup {
            //Paso 1.16,propagaremos esta variable por todo el content view.
            ContentView().environmentObject(login)
        }
    }
}
