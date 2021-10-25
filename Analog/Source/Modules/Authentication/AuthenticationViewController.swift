//
//  ViewController.swift
//  Analog
//
//  Created by Maksym Soroka on 22.10.2021.
//

import UIKit
import RxSwift

final class AuthenticationViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet private weak var getStartedButton: UIButton!
    @IBOutlet private weak var loginLabel: UILabel!
    @IBOutlet private weak var termsOfServicesLabel: UILabel!
    @IBOutlet private weak var signupView: SignupView!
    @IBOutlet private weak var exampleButton: UIButton!

    // MARK: - Properties
    var viewModel: AuthenticationViewModel!
    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        signupView.frame = view.bounds

        bind()
    }

    // MARK: - Bindings
    private func bind() {
        // MARK: Input
        exampleButton.rx.tap.bind(to: viewModel.input.exampleButtonTapped).disposed(by: disposeBag)
        // MARK: Output
        viewModel.output.exampleResult
            .subscribe(onNext: { result in
                AppLogger.log(result)
            }).disposed(by: disposeBag)
    }
}

// MARK: - Actions
extension AuthenticationViewController {
    @IBAction private func getStartedPressed(_ sender: Any) {
        UIView.transition(
            with: view,
            duration: 0.55,
            options: .transitionCrossDissolve
        ) { [unowned self] in
            view.addSubview(signupView)
        }
    }

    @IBAction private func cancelPressed(_ sender: Any) {
        UIView.transition(
            with: view,
            duration: 0.33,
            options: .transitionCrossDissolve
        ) { [unowned self] in
            signupView.removeFromSuperview()
        }
    }

    @IBAction private func loginTextTapped(_ sender: Any) {
        if let gesture = sender as? UITapGestureRecognizer {
            guard let text = loginLabel.text else { return }
            let range = (text as NSString).range(of: "Log in")
            if gesture.didTapAttributedText(in: loginLabel, range: range) {
                viewModel.input.loginButtonTapped.onNext(())
            }
        }
    }

    @IBAction private func termsOfServicesTextTapped(_ sender: Any) {
        if let gesture = sender as? UITapGestureRecognizer {
            guard let text = termsOfServicesLabel.text else { return }
            let range = (text as NSString).range(of: "Terms of Services")
            if gesture.didTapAttributedText(in: termsOfServicesLabel, range: range) {

            }
        }
    }
}

extension AuthenticationViewController: Storyboardable, Presentable { }
