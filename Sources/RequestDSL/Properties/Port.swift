//
//  Port.swift
//
//
//  Created by ErrorErrorError on 3/30/24.
//  
//

import Foundation

public struct Port: RequestProperty {
  let port: Int
  
  public init(_ port: Int) {
    self.port = port
  }
  
  public func mutate(request: inout URLRequest) {
    var components = URLComponents(from: request)
    components.port = port
    request.url = components.url ?? request.url
  }
}
