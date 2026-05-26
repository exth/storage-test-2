//
//  SIgnView.swift
//  dataStorage
//
//  Created by Вадим on 22.05.2026.
//

import SwiftUI

struct SignView: View {
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        Text("This is SignView")
        
        Button {
            isLoggedIn = true
        } label: {
            Text("SignIn")
        }
        .buttonStyle(.bordered)
        .tint(.blue)

    }
}

#Preview {
    SignView(isLoggedIn: .constant(false))
}
