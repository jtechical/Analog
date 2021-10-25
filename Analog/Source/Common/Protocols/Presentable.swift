//
//  Presentable.swift
//  Analog
//
//  Created by Maksym Soroka on 22.10.2021.
//

import UIKit

protocol Presentable {
    var toPresent: UIViewController? { get }
}

extension Presentable where Self: UIViewController {
    var toPresent: UIViewController? { self }
}
