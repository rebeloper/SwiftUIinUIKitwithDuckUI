//
//  NewsFeedHeaderModel.swift
//  SwiftUIinUIKitwithDuckUI
//
//  Created by Alex Nagy on 11/07/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import Foundation

struct Profile {
    
    var uid: String
    
    var dictionary: [String: Any] {
        return [
            "uid": uid
        ]
    }
    
}

extension Profile: DocumentSerializable {
    init?(documentData: [String : Any]) {
        let uid = documentData["uid"] as? String ?? ""
        
        self.init(uid: uid)
    }
}

extension Profile: CustomDebugStringConvertible {
    var debugDescription: String {
        return "Profile(dictionary: \(dictionary))"
    }
}

extension Profile: CustomStringConvertible {
    var description: String {
        return "Profile(uid: \(uid))"
    }
}
