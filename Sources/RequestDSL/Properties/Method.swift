//
//  Method.swift
//  Spark
//
//  Created by ErrorErrorError on 3/28/24.
//  
//

import Foundation

public enum Method: String, RequestProperty {
  case get = "GET"
  case post = "POST"
  case put = "PUT"
  
  public func mutate(request: inout URLRequest) {
    request.httpMethod = self.rawValue
  }
}
