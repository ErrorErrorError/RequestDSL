//
//  Path.swift
//  Spark
//
//  Created by ErrorErrorError on 3/28/24.
//  
//

import Foundation

public struct Path: RequestProperty {
  let path: LosslessStringConvertible
  
  public init(_ path: LosslessStringConvertible) {
    self.path = path
  }
  
  public init(_ paths: LosslessStringConvertible...) {
    self.path = paths.map(\.description).joined(separator: "/")
  }
  
  public func mutate(request: inout URLRequest) {
    request.url = URLComponents(from: request).url ?? request.url
    request.url?.append(path: path.description)
  }
}
