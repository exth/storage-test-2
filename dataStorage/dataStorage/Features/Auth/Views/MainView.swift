import SwiftUI

struct MainView: View {
    var authVM: AuthViewModel

    var body: some View {
        VStack(spacing: 16) {
            Text("Главный экран")
                .font(.title)

            // Read — показываем токены
            Text(authVM.tokenInfo)
                .font(.caption)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            Button("Проверить токены") {
                authVM.checkTokens() // read
            }
            .buttonStyle(.bordered)

            Button("Выйти") {
                authVM.signOut() // delete
            }
            .tint(.red)
            .buttonStyle(.bordered)
        }
        .padding()
    }
}
