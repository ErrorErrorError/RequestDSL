//
//  Query.swift
//
//
//  Created by ErrorErrorError on 3/28/24.
//
//

import Foundation

public struct Query: RequestProperty {
  let name: String
  let values: [LosslessStringConvertible]
  
  init<each S: LosslessStringConvertible>(
    _ name: String,
    values: repeat each S
  ) {
    self.name = name
    var temp = [LosslessStringConvertible]()
    repeat (temp.append(each values))
    self.values = temp
  }
  
  public func mutate(request: inout URLRequest) {
    var components = URLComponents(from: request)
    components.queryItems = (components.queryItems ?? []) + values.map {
      .init(name: name, value: $0.description)
    } + (values.isEmpty ? [URLQueryItem(name: name, value: nil)] : [])
    request.url = components.url ?? request.url
  }
}
