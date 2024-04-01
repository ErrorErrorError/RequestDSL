//
//  File.swift
//  
//
//  Created by ErrorErrorError on 3/30/24.
//  
//

import Foundation

private struct URLBuilder {
  var scheme: String?
  var host: String?
  var port: Int?
  
  var url: URL? {
    var components = URLComponents()
    components.scheme = scheme
    components.host = host
    components.port = port
    return components.url
  }
}
