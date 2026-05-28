import SwiftUI

struct RootView: View {
    @State private var authVM = AuthViewModel()

    var body: some View {
        if authVM.isLoggedIn {
            MainView(authVM: authVM)
        } else {
            SignInView(authVM: authVM)
        }
    }
}


#Preview {
    RootView()
}
