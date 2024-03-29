//
//  File.swift
//  
//
//  Created by ErrorErrorError on 3/28/24.
//  
//

import Foundation

extension URLComponents {
  init(from request: URLRequest) {
    if let url = request.url {
      self = .init(url: url, resolvingAgainstBaseURL: true) ?? .init()
    } else {
      self = .init()
    }
  }
}
