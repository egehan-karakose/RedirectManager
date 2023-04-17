//
//  RedirectStrategies.swift
//  RedirectManager
//
//  Created by Egehan Karaköse on 17.04.2023.
//

import Foundation
import Common

protocol RedirectManagerProtocol {
    func onApplicationBegin()
    func onApplicationAlreadyBegun()
    func onDashboardOpened(navigationController: UINavigationController)
    // MARK: protocol usage
    //func onDashboardAlreadyOpen(navigationController: UINavigationController, virtualAssisantInitializerProtocol: VirtualAssisantInitializerProtocol?)
    func onDashboardAlreadyOpen(navigationController: UINavigationController)
    func onMenuScreen(navigationController: UINavigationController)
    func onResultScreenOpened()
    func onRedirectAlertAction()
    func onSplashScreen()
}

public protocol RedirectStrategy {
    var queryParams: String { get set }
    //func onApplicationBegin(executor: RedirectStrategyExecutor, drawProtocol: ActivationControllerDrawProtocol)
    func onApplicationBegin(executor: RedirectStrategyExecutor)
    func onApplicationAlreadyBegun(executor: RedirectStrategyExecutor)
    func onDashboardOpened(executor: RedirectStrategyExecutor,
                           navigationController: UINavigationController)
    func onDashboardAlreadyOpen(executor: RedirectStrategyExecutor,
                                navigationController: UINavigationController)
    func onMenuScreen(executor: RedirectStrategyExecutor, navigationController: UINavigationController)
    func onResultScreenOpened(executor: RedirectStrategyExecutor)
    func onRedirectAlertAction(executor: RedirectStrategyExecutor)
    func onSplashScreen(executor: RedirectStrategyExecutor)
}

public protocol RedirectStrategyExecutor {
    
    // MARK: onDashboardOpened
    func routeToMenuItemWithDeeplinkNo(deepLinkCode: String, parameters: Parameters?, navigationController: UINavigationController)
    func routeToMenuItemWithScreenCode(deepLinkCode: String, navigationController: UINavigationController)
    func routeToMenuItemWithDeeplinkNo(deepLinkCode: String)
    func routeToResultScreen()
    func openScreenResultForBKM(deeplinkCode: String, consentNo: String, navigationController: UINavigationController)
    func showAlertForRedirect()
}

// TODO: Will be implemented
class MenuRedirectStrategy: RedirectStrategy {
    
    var queryParams: String
    
    init(queryParams: String) {
        self.queryParams = queryParams
    }
    
    //MARK: Sample Usage
    func onRedirectAlertAction(executor: RedirectStrategyExecutor) {
        executor.showAlertForRedirect()
    }
    func onApplicationBegin(executor: RedirectStrategyExecutor) {}
    func onApplicationAlreadyBegun(executor: RedirectStrategyExecutor) {}
    func onDashboardOpened(executor: RedirectStrategyExecutor,
                           navigationController: UINavigationController) {}
    func onDashboardAlreadyOpen(executor: RedirectStrategyExecutor,
                                navigationController: UINavigationController) {}
    func onMenuScreen(executor: RedirectStrategyExecutor, navigationController: UINavigationController) {}
    func onResultScreenOpened(executor: RedirectStrategyExecutor) {}
    func onSplashScreen(executor: RedirectStrategyExecutor) {}
    
}

// MARK: Default Idle Strategy
class DefaultRedirectStrategy: RedirectStrategy {
    var queryParams: String = ""
    func onApplicationBegin(executor: RedirectStrategyExecutor) {}
    func onApplicationAlreadyBegun(executor: RedirectStrategyExecutor) {}
    func onDashboardOpened(executor: RedirectStrategyExecutor,
                           navigationController: UINavigationController) {}
    func onDashboardAlreadyOpen(executor: RedirectStrategyExecutor,
                                navigationController: UINavigationController) {}
    func onMenuScreen(executor: RedirectStrategyExecutor, navigationController: UINavigationController) {}
    func onResultScreenOpened(executor: RedirectStrategyExecutor) {}
    func onRedirectAlertAction(executor: RedirectStrategyExecutor) {}
    func onSplashScreen(executor: RedirectStrategyExecutor) {}
}
