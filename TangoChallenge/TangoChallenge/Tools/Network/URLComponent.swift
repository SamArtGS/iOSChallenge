//
//  URLComponent.swift
//  TangoChallenge
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-05-28.
//

import Foundation

extension URLComponents{
    init(scheme: String = "https", host: String,
         path: String, parameters: [String: String]?) {
        self.init()
        self.scheme = scheme
        self.host = AppConfiguration.baseURL
        self.path = path
        self.queryItems = parameters?.map { (key: String, value: String) in
            URLQueryItem(name: key, value: value)
        }
    }
}
