//
//  UIView+Constraints.swift
//  MVP
//
//  Created by Tiz on 24/9/21.
//

import UIKit

extension UIView {
    func constraintsForAnchoringTo(boundsOf view: UIView) -> [NSLayoutConstraint] {
        view.translatesAutoresizingMaskIntoConstraints = false
        return [
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
        ]
    }
}
