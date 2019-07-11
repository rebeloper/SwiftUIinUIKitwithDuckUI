//
//  UsersCellModel.swift
//  SwiftUIinUIKitwithDuckUI
//
//  Created by Alex Nagy on 11/07/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import Foundation

struct UserProfile {
    
    var uid: String
    
    var dictionary: [String: Any] {
        return [
            "uid": uid
        ]
    }
    
}

extension UserProfile: DocumentSerializable {
    init?(documentData: [String : Any]) {
        let uid = documentData["uid"] as? String ?? ""
        
        self.init(uid: uid)
    }
}

extension UserProfile: CustomDebugStringConvertible {
    var debugDescription: String {
        return "UserProfile(dictionary: \(dictionary))"
    }
}

extension UserProfile: CustomStringConvertible {
    var description: String {
        return "UserProfile(uid: \(uid))"
    }
}
