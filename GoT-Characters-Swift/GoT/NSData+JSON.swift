//  Converted to Swift 4 by Swiftify v4.1.6792 - https://objectivec2swift.com/
//
//  NSData+JSON.swift
//  GoT
//
//  Created by Paciej on 24/10/15.
//  Copyright © 2015 Maciej Piotrowski. All rights reserved.
//

import Foundation

extension Data {
    var jsonObject: Any? {
        return try? JSONSerialization.jsonObject(with: self as Data, options: .allowFragments)
    }
}