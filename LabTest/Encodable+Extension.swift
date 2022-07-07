//
//  Encodable+Extension.swift
//  LabTest
//
//  Created by Wong Tian Haw on 29/06/2022.
//

import Foundation

extension Encodable {
    func dictionary() -> [String:Any] {
        var dict = [String:Any]()
        let otherSelf = Mirror(reflecting: self)
        for child in otherSelf.children {
            if let key = child.label {
                dict[key] = child.value
            }
        }
        return dict
    }
}
