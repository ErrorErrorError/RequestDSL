//
//  File 2.swift
//  
//
//  Created by ErrorErrorError on 3/28/24.
//  
//

import Foundation

extension URL: RequestProperty {
  public func mutate(request: inout URLRequest) {
    request.url = self
  }
}
