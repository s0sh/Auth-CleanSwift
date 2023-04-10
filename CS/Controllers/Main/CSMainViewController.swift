//
//  CSMainViewController.swift
//  CS
//
//  Created by Roman Bigun on 09.04.2023.
//

import UIKit

// swiftlint:disable trailing_whitespace

protocol CSMainDisplayLogic: AnyObject {
    func displayData(_ viewModel: CSDataStore)
}

final class CSMainViewController: BaseController {
   
    private var messageLabel: UILabel = {
       let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 18)
        label.textColor = .red
        label.backgroundColor = .yellow
        return label
    }()
    
    var interactor: CSMainInteractor?
    let router = CSMainRouter()
}

extension CSMainViewController {
    override func setupViews() {
        super.setupViews()
        view.addView(messageLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            messageLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        /// for exampple
        messageLabel.text = router.dataStore?.data?.userAddress
    }
    
    override func setupComponents() {
        super.setupComponents()
        
        // Создаем компоненты VIP цикла
        let interactor = CSMainInteractor()
        let presenter = CSMainPresenter()
        
        // Связываем созданные компоненты
        interactor.presenter = presenter
        presenter.viewController = self
        
        // Указываем ссылку на Interactor для View Controller
        self.interactor = interactor
        
        router.dataStore = CSDataStore()
    }
}

extension CSMainViewController: CSMainDisplayLogic {
    func displayData(_ viewModel: CSDataStore) { }
}
