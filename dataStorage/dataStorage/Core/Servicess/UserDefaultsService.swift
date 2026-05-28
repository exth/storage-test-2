import Foundation

extension UserDefaults {
    enum Keys {
        static let isLoggedIn = "isLoggedIn"
    }
}

final class UserDefaultsService {
    static let shared = UserDefaultsService()
    private let defaults = UserDefaults.standard
    private init() {}

    var isLoggedIn: Bool {
        get {
            defaults.bool(forKey: UserDefaults.Keys.isLoggedIn)
        }
        
        set {
            defaults.set(newValue, forKey: UserDefaults.Keys.isLoggedIn)
        }
    }

    func clearSession() {
        defaults.removeObject(forKey: UserDefaults.Keys.isLoggedIn)
    }
}
