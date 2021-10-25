//
//  Router.swift
//  Analog
//
//  Created by Maksym Soroka on 22.10.2021.
//

import UIKit

final class Router {
    private weak var rootViewController: UINavigationController?

    var toPresent: UIViewController? {
        rootViewController
    }

    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
}

extension Router: Routable {
    func present(
        _ module: Presentable?,
        animated: Bool = false,
        completion: (() -> Void)? = nil
    ) {
        guard let viewController = module?.toPresent else { return }
        rootViewController?.present(viewController, animated: animated, completion: completion)
    }

    func push(
        _ module: Presentable?,
        animated: Bool = false
    ) {
        if let viewController = module?.toPresent {
            rootViewController?.pushViewController(viewController, animated: animated)
        }
    }

    func popModule(animated: Bool) {
        rootViewController?.popViewController(animated: animated)
    }

    func dismissModule(animated: Bool, completion: (() -> Void)? = nil) {
        rootViewController?.dismiss(animated: animated, completion: completion)
    }

    func setRootModule(_ module: Presentable?, isNavigationBarHidden: Bool = false) {
        guard let viewController = module?.toPresent else { return }
        // TODO: What will happen if controller need to display navbar, and isNavigationBarHidden is false?
        rootViewController?.setViewControllers([viewController], animated: true)
//        rootViewController?.isNavigationBarHidden = isNavigationBarHidden
    }

    func popToRootModule(animated: Bool) {

    }
}
