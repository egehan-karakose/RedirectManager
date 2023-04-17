//
//  Networking.swift
//  RedirectManager
//
//  Created by Egehan Karaköse on 17.04.2023.
//

import Foundation

class RedirectManagerNetworking {
    let endpoint: RedirectManagerEndpointProtocol
    
    init(endpoint: RedirectManagerEndpointProtocol = RedirectManagerEndpoint()) {
        self.endpoint = endpoint
    }
    
    func boilerFuncion(request: BoilerStruct) {
        endpoint.boilerEndpoint(request).retrieve { (response: BoilerStruct?) in
            debugPrint("response successfully getted")
        } failure: { _ in
            debugPrint("error")
        }
    }
}
