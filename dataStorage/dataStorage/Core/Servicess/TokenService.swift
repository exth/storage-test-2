import Foundation

enum KeychainKeys {
    static let accessToken  = "accessToken"
    static let refreshToken = "refreshToken"
}

final class TokenService {
    static let shared = TokenService()
    private let keychain = KeychainService.shared
    private init() {}

    // Read
    var accessToken: String?  {
        keychain.read(forKey: KeychainKeys.accessToken)
    }
    
    var refreshToken: String? {
        keychain.read(forKey: KeychainKeys.refreshToken)
    }

    // Save
    func saveTokens(access: String, refresh: String) throws {
        try keychain.save(access,  forKey: KeychainKeys.accessToken)
        try keychain.save(refresh, forKey: KeychainKeys.refreshToken)
    }

    // Delete
    func clearTokens() throws {
        try keychain.delete(forKey: KeychainKeys.accessToken)
        try keychain.delete(forKey: KeychainKeys.refreshToken)
    }
}
