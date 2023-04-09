//
//  CSWorker.swift
//  CS
//
//  Created by Roman Bigun on 08.04.2023.
//

import Foundation

final class CSWorkers {
    static let networkWorker = NetworkWorker()
    private let objectsUrl = URL(string: "https://jsonplaceholder.typicode.com/users")
    func fetchObjects(_ complete: @escaping ([AnyObject]?) -> Void) {}
}
