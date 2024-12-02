//
//  AppNavigation.swift
//  SwiftWorkshop
//
//  Created by gdaalumno on 02/12/24.
//

import SwiftUI

struct AppNavigation: View {
    var body: some View {
        NavigationStack {
            AuthView()
                .navigationTitle("Autenticación")
        }
    }
}

#Preview {
    AppNavigation()
}
