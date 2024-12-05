//
//  ProjectPreview.swift
//  SwiftWorkshop
//
//  Created by gdaalumno on 05/12/24.
//

import SwiftUI

struct ProjectPreview: View {
    let project: Project
    var dateFormatter : RelativeDateTimeFormatter{
        let formatter = RelativeDateTimeFormatter()
        
        formatter.locale = .current
        formatter.dateTimeStyle = .named
        
        return formatter
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
              
                Text(project.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(dateFormatter.string(for: project.startDate) ?? project.startDate.formatted())
                    .font(.caption)
                Text(project.description)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            
            Image(systemName: project.inProgress ? "ellipsis" : "checkmark")
                .symbolVariant(.circle)
                .font(.title3)
                .foregroundStyle(project.inProgress ? .yellow : .green)
        }
    }
}

#Preview {
     ProjectPreview(project: Project(title: "Titulo", description: "Una descripcion corta", inProgress: true))
}
