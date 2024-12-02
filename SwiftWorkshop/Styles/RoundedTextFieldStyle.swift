//
//  RoundedTextFieldStyle.swift
//  SwiftWorkshop
//
//  Created by gdaalumno on 02/12/24.
//

import SwiftUI

struct RoundedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        return configuration
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(uiColor: .secondarySystemBackground))
            )
    }
}
