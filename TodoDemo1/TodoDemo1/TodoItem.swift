//
//  TodoItem.swift
//  TodoDemo1
//
//  Created by Nick on 2017/11/15.
//  Copyright © 2017年 Nick. All rights reserved.
//

import Foundation

class TodoItem: NSObject {
    var id: Int
    var name: String
    var image: String
    var detail: String
    init(id: Int, name: String, image: String, detail: String) {
        self.id = id
        self.name = name
        self.image = image
        self.detail = detail
    }
}
