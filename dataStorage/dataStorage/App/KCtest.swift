//
//  KCtest.swift
//  dataStorage
//
//  Created by Вадим on 26.05.2026.
//


// --MARK: запись значения в кейчейн--
import SwiftUI
import Security

struct KCtest: View {
    @State private var account = ""
    @State private var password = ""
    
    @State private var status = ""
    
    
    var body: some View {
        VStack {
            Group {
                TextField(text: $account) {
                    Text("Enter account")
                }
                
                TextField(text: $password) {
                    Text("Enter password")
                }
            }
            .padding()
            .background(.brown.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Button {
                do {
                    status = try KCManager().save(
                        account: account,
                        password: password.data(using: .utf8) ?? Data())
                } catch {
                    status = "\(error)"
                }
            } label: {
                Text("Save data")
            }
            .buttonStyle(.bordered)
            .padding(.top)
            
            if status != "" {
                Text(status)
            }

            
        }
        .padding()
        
    }
}

#Preview {
    KCtest()
}
