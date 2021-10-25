//
//  AuthenticationFactoryProtocol.swift
//  Analog
//
//  Created by Maksym Soroka on 22.10.2021.
//

protocol AuthenticationFactoryProtocol {
    func makeAuthenticationViewController(viewModel: AuthenticationViewModel) -> Presentable & Storyboardable
}

protocol LoginFactoryProtocol {
    func makeLoginViewController() -> Presentable & Storyboardable
}
