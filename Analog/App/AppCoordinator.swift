//
//  AppCoordinator.swift
//  Analog
//
//  Created by Maksym Soroka on 22.10.2021.
//

import RxSwift

final class AppCoordinator: Coordinator<Void> {
    private let coordinatorFactory: CoordinatorFactory
    private let router: Routable

    init(
        with coordinatorFactory: CoordinatorFactory,
        router: Routable
    ) {
        self.coordinatorFactory = coordinatorFactory
        self.router = router
    }

    override func start() -> Observable<Void> {
        let coordinator = coordinatorFactory.makeAuthenticationCoordinator(router: router, coordinatorFactory: coordinatorFactory)
        return coordinate(to: coordinator)
    }
}
