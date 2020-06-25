//
//  User.swift
//  Dreamer
//
//  Created by Dylan Mace on 5/29/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import Foundation
import SwiftUI

class User {
    var uid: String
    var email: String?
    var avatar: URL?
    var displayName: String?
    
    init(uid: String, email: String?, displayName: String, avatar: URL?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
        self.avatar = avatar
    }
}
