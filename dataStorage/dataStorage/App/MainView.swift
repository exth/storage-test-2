//
//  MainView.swift
//  dataStorage
//
//  Created by Вадим on 22.05.2026.
//

import SwiftUI

struct MainView: View {
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        Text("This is Main View")
        Button {
            isLoggedIn = false
        } label: {
            Text("SignOut")
        }
        .buttonStyle(.bordered)
        .tint(.red)
    }
}

#Preview {
    MainView(isLoggedIn: .constant(false))
}
