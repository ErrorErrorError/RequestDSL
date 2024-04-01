//
//  Host.swift
//  
//
//  Created by ErrorErrorError on 3/28/24.
//  
//

import Foundation

public struct Host: RequestProperty {
  let host: String
  
  public init(_ host: String) {
    self.host = host
  }
  
  public func mutate(request: inout URLRequest) {
    var components = URLComponents(from: request)
    components.host = host
    request.url = components.url ?? request.url
  }
}
