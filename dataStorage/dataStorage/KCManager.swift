//import Foundation
//import Security // -?
//
//
//enum KCErrors: Error {
//    case duplicateItem
//    case unknown(status: OSStatus)
//}
//
//
//final class KCManager {
//    static func save(account: String, password: Data) throws -> String {
//        let query: [CFString: Any] = [
//            kSecClass: kSecClassGenericPassword,
//            kSecAttrAccount: account,
//            kSecValueData: password
//        ]
//        
//        let status = SecItemAdd(query as CFDictionary, nil)
//        
//        guard status != errSecDuplicateItem else {
//            throw KCErrors.duplicateItem
//        }
//        
//        guard status == errSecSuccess else {
//            throw KCErrors.unknown(status: status)
//        }
//        
//        return "Saved"
//    }
//    
//    
//    
//    static func getPassword(for account: String) throws -> Data?  {
//        let query: [CFString: Any] = [
//            kSecClass: kSecClassGenericPassword,
//            kSecAttrAccount: account,
//            kSecReturnData: kCFBooleanTrue as Any
//        ]
//        
//        var result: AnyObject?
//        
//        let status = SecItemCopyMatching(query as CFDictionary, &result)
//        
//        guard status == errSecSuccess else {
//            throw KCErrors.unknown(status: status)
//        }
//        
//        return result as? Data
//    }
//}
