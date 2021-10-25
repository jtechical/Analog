//
//  AuthenticationCoordinator.swift
//  Analog
//
//  Created by Maksym Soroka on 22.10.2021.
//

import UIKit
import RxSwift

final class AuthenticationCoordinator: Coordinator<Void> {
    private let router: Routable
    private let modulesFactory: AuthenticationFactoryProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol

    init(
        with modulesFactory: AuthenticationFactoryProtocol,
        coordinatorFactory: CoordinatorFactoryProtocol,
        router: Routable
    ) {
        self.modulesFactory = modulesFactory
        self.coordinatorFactory = coordinatorFactory
        self.router = router
    }

    override func start() -> Observable<CoordinationResult> {
        let viewModel = AuthenticationViewModel()
        let authenticationViewController = modulesFactory.makeAuthenticationViewController(viewModel: viewModel)
        let loginCoordinator = coordinatorFactory.makeLoginCoordinator(router: router)
        router.setRootModule(authenticationViewController, isNavigationBarHidden: true)
        return viewModel.output.loginResult.flatMap { [unowned self] in
            return self.coordinate(to: loginCoordinator)
        }
    }
}
