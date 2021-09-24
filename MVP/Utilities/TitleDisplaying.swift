//
//  TitleDisplaying.swift
//  MVP
//
//  Created by Tiz on 24/9/21.
//

import UIKit

protocol TitleDisplaying {
    func set(title: String?)
}

extension TitleDisplaying where Self: UIViewController {
    func set(title: String?) {
        self.title = title
    }
}

protocol Displaying: TitleDisplaying {}
