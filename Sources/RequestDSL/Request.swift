//
//  Request.swift
//  Spark
//
//  Created by ErrorErrorError on 3/27/24.
//
//

import Foundation


// FIXME: Use parameter packs, restrict to Swift 5.10
public struct Request<T> {
  private var _build: (T) -> RequestProperty
  
  public init(@PropertyBuilder build: @escaping () -> RequestProperty) where T == Void {
    self._build = { _ in  build() }
  }
  
  public init(@PropertyBuilder build: @escaping (T) -> RequestProperty) {
    self._build = build
  }
  
  public func build(_ value: T) throws -> URLRequest {
    let properties = _build(value)
    var request = URLRequest(url: URL(string: "/").unsafelyUnwrapped)
    properties.mutate(request: &request)
    return request
  }
  
  public func build() throws -> URLRequest where T == Void {
    try build(())
  }
  
  public func callAsFunction(_ value: T) throws -> URLRequest {
    try build(value)
  }
  
  public func callAsFunction() throws -> URLRequest where T == Void {
    try build()
  }
}
