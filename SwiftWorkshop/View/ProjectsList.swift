//
//  PojectsLists.swift
//  SwiftWorkshop
//
//  Created by gdaalumno on 04/12/24.
//

import SwiftUI

struct ProjectsList: View {
    @Bindable var viewModel: ProjectsViewModel
    
    var body: some View {
        List{
            // Projects go here
        }
        .navigationTitle("Proyectos")
        .toolbar{
            ToolbarItem(placement: .primaryAction){
                Button{
                    self.viewModel.showNewProjectSheet = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
            }
        }
        .sheet(isPresented: $viewModel.showNewProjectSheet, content: {
            NavigationStack{
                NewProjectForm(newProject: $viewModel.newProject)
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction){
                            cancelButton()
                        }
                        
                        ToolbarItem(placement: .confirmationAction) {
                            createButton()
                        }
                    }
            }
        })
    }
    @ViewBuilder private func cancelButton() -> some View {
            
        Button("Cancelar", role: .destructive){
            self.viewModel.showNewProjectSheet = false
        }
    }
    @ViewBuilder private func createButton() -> some View {
        Button("agregar"){
            self.viewModel.uploadProject()
        }
    }
}
