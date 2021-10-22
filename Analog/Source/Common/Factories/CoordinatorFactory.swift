//
//  CoordinatorFactory.swift
//  Analog
//
//  Created by Maksym Soroka on 22.10.2021.
//

import UIKit

struct CoordinatorFactory {
    let modulesFactory = ModulesFactory()
}

// MARK: - CoordinatorFactoryProtocol
extension CoordinatorFactory: CoordinatorFactoryProtocol {
    func makeLoginCoordinator(router: Routable) -> Coordinator<Void> {
        LoginCoordinator(with: modulesFactory, router: router)
    }
    
    func makeAuthenticationCoordinator(router: Routable, coordinatorFactory: CoordinatorFactoryProtocol) -> Coordinator<Void> {
        AuthenticationCoordinator(with: modulesFactory, coordinatorFactory: coordinatorFactory, router: router)
    }
}
