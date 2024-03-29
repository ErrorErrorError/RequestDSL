//
//  Header.swift
//  Spark
//
//  Created by ErrorErrorError on 3/28/24.
//  
//

import Foundation

public struct Header: RequestProperty {
  let header: String
  let value: String
  
  init(_ header: String, _ value: String) {
    self.header = header
    self.value = value
  }
  
  public func mutate(request: inout URLRequest) {
    request.setValue(value, forHTTPHeaderField: header)
  }
}
