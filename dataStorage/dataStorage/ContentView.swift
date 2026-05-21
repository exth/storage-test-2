//
//  ContentView.swift
//  dataStorage
//
//  Created by Вадим on 21.05.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
                .ignoresSafeArea()
            
            VStack {
                Text("Hi, Exth!")
                    .font(.title2).bold()
                    .padding()
                    .background(.yellow.opacity(0.4))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }
    }
}

#Preview {
    ContentView()
}
