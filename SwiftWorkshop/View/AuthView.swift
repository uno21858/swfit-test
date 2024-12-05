//
//  AuthView.swift
//  SwiftWorkshop
//
//  Created by gdaalumno on 02/12/24.
//

import SwiftUI

struct AuthView: View {
    @Bindable var authViewModel : AuthViewModel
    @FocusState private var focus: String?
    
    var body: some View {
        VStack {
            TextField("Email", text: $authViewModel.email)
                .textFieldStyle(RoundedTextFieldStyle())
                .focused($focus, equals: "emailField")
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
            
            SecureField("Contraseña", text: $authViewModel.password)
                .textFieldStyle(RoundedTextFieldStyle())
            ViewThatFits{
                HStack{
                    registerButton()
                    logInButton()
                }
                .disabled(self.authViewModel.email.isEmpty||self.authViewModel.password.isEmpty)
                
                VStack{
                    registerButton()
                    logInButton()
                }
                .disabled(self.authViewModel.email.isEmpty||self.authViewModel.password.isEmpty)
                
            }
        }
        .padding()
    }
    
    @ViewBuilder private func registerButton() -> some View {
        Button {
            Task{
                await self.authViewModel.registerUser()
            }
        } label: {
            Text("Registrarse")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)

        }
        .buttonStyle(.bordered)
        .disabled(self.authViewModel.email.isEmpty || self.authViewModel.password.isEmpty)
    }
    
    
    @ViewBuilder private func logInButton() -> some View {
        Button {
            Task{
                await self.authViewModel.loginWithEmailPassword()
            }
        } label: {
            Text("Iniciar Sesion")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        }
        .buttonStyle(.borderedProminent)
        
        .disabled(self.authViewModel.email.isEmpty || self.authViewModel.password.isEmpty)
    }
}

