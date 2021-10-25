//
//  Routable.swift
//  Analog
//
//  Created by Maksym Soroka on 22.10.2021.
//

protocol Routable: Presentable {
    func present(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)
    func push(_ module: Presentable?, animated: Bool)
    func popModule(animated: Bool)
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    func setRootModule(_ module: Presentable?, isNavigationBarHidden: Bool)
    func popToRootModule(animated: Bool)
}
