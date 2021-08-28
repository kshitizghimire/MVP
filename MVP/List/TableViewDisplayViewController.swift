//
//  TableViewDisplayViewController.swift
//  MVP
//
//  Created by Tiz on 28/8/21.
//

import UIKit

final class TableViewDisplayViewController: UIViewController {

    let containerView = UIView(frame: .zero)

    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .lightGray
        self.view.addSubview(containerView)

        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                containerView.topAnchor.constraint(equalTo: view.topAnchor),
                containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ]
        )
    }

}
