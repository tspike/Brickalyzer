//
//  Styles.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 10/16/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import Foundation
import UIKit

struct Styles {
    static func primaryButton() -> UIButton {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        return button
    }

    static func secondaryButton() -> UIButton {
        let button = UIButton(type: .system)
        return button
    }
}
