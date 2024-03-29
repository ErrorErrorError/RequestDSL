//
//  File.swift
//  
//
//  Created by ErrorErrorError on 3/28/24.
//  
//

import Foundation

public struct Scheme: RequestProperty {
  let scheme: String
  
  init(_ scheme: String) {
    self.scheme = scheme
  }
  
  public func mutate(request: inout URLRequest) {
    var components = URLComponents(from: request)
    components.scheme = scheme
    request.url = components.url ?? request.url
  }
}
