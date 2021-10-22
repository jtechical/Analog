//
//  Coordinator.swift
//  Analog
//
//  Created by Maksym Soroka on 22.10.2021.
//
//
import RxSwift

class Coordinator<ResultType> {
    typealias CoordinationResult = ResultType

    var disposeBag = DisposeBag()

    private let identifier = UUID()

    private var childCoordinators = [UUID: Any]()

    private func store<T>(coordinator: Coordinator<T>) {
        childCoordinators[coordinator.identifier] = coordinator
    }

    private func free<T>(coordinator: Coordinator<T>) {
        childCoordinators[coordinator.identifier] = nil
    }

    func coordinate<T>(to coordinator: Coordinator<T>) -> Observable<T> {
        store(coordinator: coordinator)
        return coordinator.start()
            .do(
                onNext: { [unowned self] _ in
                    free(coordinator: coordinator)
                }
            )
    }

    func start() -> Observable<ResultType> {
        fatalError("Start method should be implemented.")
    }
}
