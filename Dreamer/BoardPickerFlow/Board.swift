//
//  BoardItem.swift
//  Dreamer
//
//  Created by Dylan Mace on 5/30/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import Foundation
import Firebase


struct Board: Identifiable {
    var id: String = UUID().uuidString
    var boardName: String
    var title: String
    //var text: String
    var color: [Double]
    var timeStamp: String
    
}
