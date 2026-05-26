//
//  RootView.swift
//  dataStorage
//
//  Created by Вадим on 22.05.2026.
//

import SwiftUI

struct RootView: View {
    @AppStorage("isLoggedIn") var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn {
            MainView(isLoggedIn: $isLoggedIn)
        } else {
            SignView(isLoggedIn: $isLoggedIn)
        }
    }
}

#Preview {
    RootView()
}
