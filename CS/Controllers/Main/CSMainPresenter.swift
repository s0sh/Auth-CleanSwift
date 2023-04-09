//
//  CSMainPresenter.swift
//  CS
//
//  Created by Roman Bigun on 09.04.2023.
//

import Foundation

protocol CSMainPresentetionLogic: AnyObject {}

final class CSMainPresenter: CSMainPresentetionLogic {
    weak var viewController: CSMainDisplayLogic?
}
