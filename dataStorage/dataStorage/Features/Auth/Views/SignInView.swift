import SwiftUI

struct SignInView: View {
    var authVM: AuthViewModel

    @State private var email    = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 16) {
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
                .autocorrectionDisabled()
                .textContentType(.emailAddress)

            SecureField("Пароль", text: $password)
                .textFieldStyle(.roundedBorder)
                .textContentType(.password)

            if let error = authVM.errorMessage {
                Text(error)
                    .foregroundStyle(.red)
                    .font(.caption)
            }

            Button {
                Task { await authVM.signIn(email: email, password: password) }
            } label: {
                if authVM.isLoading {
                    ProgressView()
                } else {
                    Text("Войти")
                }
            }
            .disabled(authVM.isLoading || email.isEmpty || password.isEmpty)
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
