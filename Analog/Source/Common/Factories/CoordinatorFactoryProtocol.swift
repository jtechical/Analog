//
//  CoordinatorFactoryProtocol.swift
//  Analog
//
//  Created by Maksym Soroka on 22.10.2021.
//

import UIKit

protocol CoordinatorFactoryProtocol {
    func makeAuthenticationCoordinator(router: Routable, coordinatorFactory: CoordinatorFactoryProtocol) -> Coordinator<Void>
    func makeLoginCoordinator(router: Routable) -> Coordinator<Void>
}
