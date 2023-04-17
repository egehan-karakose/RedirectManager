//
//  RedirectManager.swift
//  RedirectManager
//
//  Created by Egehan Karaköse on 17.04.2023.
//

import Foundation
import Common
import UIKit

public class RedirectManager {
    
    public static let shared = RedirectManager()
    
    private let networkHelper: RedirectManagerNetworking
    
    public var strategy: RedirectStrategy?
    
    private init() {
        networkHelper = RedirectManagerNetworking()
    }
    
    public func decideRedirectStrategy(with type: String, queryParams: String?) {
        
        switch type {
        case "1":
            strategy = MenuRedirectStrategy(queryParams: queryParams~)
        default:
            strategy = DefaultRedirectStrategy()
        }
        
        handleApplicationState()
        
    }
    
    
    //MARK: Add Control to detect which controller currenyly in
    func handleApplicationState() {
        
        // MARK: Login & Activation Screen
//        if let controller = Root.shared.presentedController?.viewControllers.last as? ActivationController {
//            strategy?.onApplicationAlreadyBegun(executor: self, drawProtocol: controller)
//            return
//        }
    
    }
    
    func clearRedirectStrategy() {
        self.strategy = nil
    }
}

extension RedirectManager: RedirectStrategyExecutor {
    
    public func routeToResultScreen() {}
    
    public func showAlertForRedirect() {}
    
    public func routeToCepteKazan() {}
    
    public func focusToPasswordField() {}
    
    public func routeToDashboardCampaign() {}
    
    public func routeToMenuItemWithDeeplinkNo(deepLinkCode: String, parameters: Parameters? = nil, navigationController: UINavigationController) {}
    
    public func routeToMenuItemWithDeeplinkNo(deepLinkCode: String) {}
    
    public func routeToMenuItemWithScreenCode(deepLinkCode: String, navigationController: UINavigationController) {}
    
    public func routeToOpenBanking(deeplinkCode: String, consentNo: String, navigationController: UINavigationController) {}
    
    public func openScreenResultForBKM(deeplinkCode: String, consentNo: String, navigationController: UINavigationController) {}
    
}

extension RedirectManager: RedirectManagerProtocol {
    
    func onSplashScreen() {
        strategy?.onSplashScreen(executor: self)
    }
    
    func onApplicationBegin() {
        strategy?.onApplicationBegin(executor: self)
    }
    
    func onApplicationAlreadyBegun() {
        strategy?.onApplicationAlreadyBegun(executor: self)
    }
    
    func onDashboardOpened(navigationController: UINavigationController) {
        strategy?.onDashboardOpened(executor: self,
                                    navigationController: navigationController)
    }
    
    func onDashboardAlreadyOpen(navigationController: UINavigationController) {
        strategy?.onDashboardAlreadyOpen(executor: self,
                                         navigationController: navigationController)
    }
    
    func onMenuScreen(navigationController: UINavigationController) {
        strategy?.onMenuScreen(executor: self, navigationController: navigationController)
    }
    
    func onResultScreenOpened() {
        strategy?.onResultScreenOpened(executor: self)
    }
    
    func onRedirectAlertAction() {
        strategy?.onRedirectAlertAction(executor: self)
    }

}
