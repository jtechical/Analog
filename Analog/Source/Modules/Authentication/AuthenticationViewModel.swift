//
//  AuthenticationViewModel.swift
//  Analog
//
//  Created by Maksym Soroka on 22.10.2021.
//

import RxSwift

final class AuthenticationViewModel {

    // MARK: - Propetries
    let input: Input
    let output: Output

    struct Input {
        let loginButtonTapped: AnyObserver<Void>
        let exampleButtonTapped: AnyObserver<Void>
    }

    struct Output {
        let loginResult: Observable<Void>
        let exampleResult: Observable<String>
    }

    // MARK: Private Properties
    private let loginButton = PublishSubject<Void>()
    private let exampleButton = PublishSubject<Void>()

    // MARK: - Lifecycle
    init() {
        // TODO: An example of how to separate input and output logic
        self.input = Input(loginButtonTapped: loginButton.asObserver(),
                           exampleButtonTapped: exampleButton.asObserver())
        // Here will be business logic if we need some additional implementation
        let someResult = exampleButton.map { _ -> String in
            return "ExampleButton Tapped"
        }
        self.output = Output(loginResult: loginButton,
                             exampleResult: someResult)
    }
}
