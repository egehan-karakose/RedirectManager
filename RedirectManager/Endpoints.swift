//
//  Endpoints.swift
//  RedirectManager
//
//  Created by Egehan Karaköse on 17.04.2023.
//

import Foundation
import Networking

struct BoilerStruct: Codable {}

protocol RedirectManagerEndpointProtocol {
    func boilerEndpoint(_ request: BoilerStruct) -> Retrieve
}

class RedirectManagerEndpoint: RedirectManagerEndpointProtocol {
    func boilerEndpoint(_ request: BoilerStruct) -> Networking.Retrieve {
        BaseEndpointType(endpoint: Endpoint(path: "", httpMethod: .get, httpTask: .request))
    }
    
    
}
