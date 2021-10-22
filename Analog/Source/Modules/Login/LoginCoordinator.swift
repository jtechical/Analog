//
//  LoginViewCoordinator.swift
//  Analog
//
//  Created by Maksym Soroka on 22.10.2021.
//

import RxSwift

final class LoginCoordinator: Coordinator<Void> {
    private let factory: LoginFactoryProtocol
    private let router: Routable

    init(with factory: LoginFactoryProtocol, router: Routable) {
        self.factory = factory
        self.router = router
    }

    override func start() -> Observable<CoordinationResult> {
        let viewController = factory.makeLoginViewController()
        router.present(viewController, animated: true, completion: nil)
        return Observable.never()
    }
}
