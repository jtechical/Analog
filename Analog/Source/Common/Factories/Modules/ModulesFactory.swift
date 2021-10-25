//
//  ModulesFactory.swift
//  Analog
//
//  Created by Maksym Soroka on 22.10.2021.
//

final class ModulesFactory { }

// MARK: - AuthenticationFactoryProtocol
extension ModulesFactory: AuthenticationFactoryProtocol {
    func makeAuthenticationViewController(viewModel: AuthenticationViewModel) -> Presentable & Storyboardable {
        let viewController = AuthenticationViewController.instantiate()
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: - LoginFactoryProtocol
extension ModulesFactory: LoginFactoryProtocol {
    func makeLoginViewController() -> Presentable & Storyboardable {
        LoginViewController.instantiate()
    }
}
