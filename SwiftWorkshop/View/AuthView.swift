//
//  AuthView.swift
//  SwiftWorkshop
//
//  Created by gdaalumno on 02/12/24.
//

import SwiftUI

struct AuthView: View {
    @State var email = ""
    @State var password = ""
    @FocusState private var focus: String?
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedTextFieldStyle())
                .focused($focus, equals: "emailField")
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
            
            SecureField("Contraseña", text: $password)
                .textFieldStyle(RoundedTextFieldStyle())
        }
        .padding()
    }
}

#Preview {
    AuthView()
}
