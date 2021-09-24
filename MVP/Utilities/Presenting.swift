//
//  TableViewPresenting.swift
//  MVP
//
//  Created by Tiz on 28/8/21.
//

import Foundation

protocol Presenting {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()

}

extension Presenting {
    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewWillDisappear() {}
    func viewDidDisappear() {}
}
