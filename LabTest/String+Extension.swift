//
//  String+Extension.swift
//  LabTest
//
//  Created by Wong Tian Haw on 29/06/2022.
//

import Foundation

extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
}
