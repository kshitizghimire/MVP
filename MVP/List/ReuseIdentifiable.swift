//
//  ReuseIdentifiable.swift
//  MVP
//
//  Created by Tiz on 28/8/21.
//

import UIKit

protocol ReuseIdentifiable {

    static var identifier: String { get }
}

extension ReuseIdentifiable {

    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReuseIdentifiable {}
extension UITableViewHeaderFooterView: ReuseIdentifiable {}
