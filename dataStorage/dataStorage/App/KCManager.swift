import Foundation
import Security // -?


enum KCErrors: Error {
    case duplicateItem
    case unknown(status: OSStatus)
}


final class KCManager {
    func save(account: String, password: Data) throws -> String {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecValueData: password
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status != errSecDuplicateItem else {
            throw KCErrors.duplicateItem
        }
        
        guard status == errSecSuccess else {
            throw KCErrors.unknown(status: status)
        }
        
        return "Saved"
    }
}
