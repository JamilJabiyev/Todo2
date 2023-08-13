//
//  Fonts.swift
//  ToDo2
//
//  Created by Jamil Jabiyev on 11.08.23.
//

import Foundation
import UIKit

enum FontType: String {
    case regular = "Regular"
    case medium = "Medium"
    case semibold = "SemiBold"
    case bold = "Bold"
}

struct Fonts {
    static func style(type: FontType, size: CGFloat) -> UIFont? {
        UIFont(name: "Poppins-\(type.rawValue)", size: size)
    }
}

