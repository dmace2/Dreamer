//
//  Post.swift
//  Dreamer
//
//  Created by Dylan Mace on 6/27/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import Foundation
import Firebase


struct Post: Identifiable {
    var id: String = UUID().uuidString
    var postName: String
    var title: String
    var text: String
    var color: [Double]
    var timeStamp: String
    
}
