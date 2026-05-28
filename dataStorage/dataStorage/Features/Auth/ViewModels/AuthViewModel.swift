import Foundation

@Observable
final class AuthViewModel {
    var isLoggedIn   = false
    var isLoading    = false
    var errorMessage: String? = nil
    var tokenInfo    = "" // для демонстрации в MainView

    private let tokenService = TokenService.shared
    private let udService    = UserDefaultsService.shared

    init() {
        self.isLoggedIn = udService.isLoggedIn
    }

    // MARK: - Sign In (save)
    func signIn(email: String, password: String) async {
        isLoading    = true
        errorMessage = nil

        do {
            let accessToken  = "mock_access_token"
            let refreshToken = "mock_refresh_token"

            
            // MARK: - в реальном проекте: (№1) -
            
            // Сетевой запрос:
            
            // let tokens = try await AuthService.shared.login(email: email, password: password)
            
            // try tokenService.saveTokens(access: tokens.accessToken, refresh: tokens.refreshToken)
            
            
            try tokenService.saveTokens(access: accessToken, refresh: refreshToken)
            udService.isLoggedIn = true
            isLoggedIn = true

        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }

    // MARK: - Read
    func checkTokens() {
        let access  = tokenService.accessToken  ?? "не найден"
        let refresh = tokenService.refreshToken ?? "не найден"
        tokenInfo = "access: \(access)\nrefresh: \(refresh)"
    }

    // MARK: - Sign Out (delete)
    func signOut() {
        try? tokenService.clearTokens()
        udService.clearSession()
        isLoggedIn = false
        tokenInfo  = ""
    }
}
