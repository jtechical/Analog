//
//  AppDelegate.swift
//  Analog
//
//  Created by Maksym Soroka on 22.10.2021.
//

import UIKit
import RxSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    let disposedBag = DisposeBag()
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let rootViewController = UINavigationController()
        let coordinator = AppCoordinator(
            with: CoordinatorFactory(),
            router: Router(rootViewController: rootViewController)
        )
        coordinator.start()
            .subscribe()
            .disposed(by: disposedBag)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        return true
    }
}
