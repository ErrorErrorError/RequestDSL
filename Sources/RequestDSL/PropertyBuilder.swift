//
//  PropertyBuilder.swift
//  Spark
//
//  Created by ErrorErrorError on 3/28/24.
//  
//

import Foundation

@resultBuilder
public enum PropertyBuilder {
  // var properties = [Method.get, Header("", ""), Path("")]
  public static func buildBlock(_ components: RequestProperty...) -> RequestProperty {
    components.reduce(AllProperties()) {
      $0.add($1)
    }
  }
  
  public static func buildPartialBlock(first: RequestProperty) -> RequestProperty {
    first
  }
  
  public static func buildPartialBlock(accumulated: RequestProperty, next: RequestProperty) -> RequestProperty {
    accumulated.append(next)
  }
  
  public static func buildOptional(_ component: RequestProperty?) -> RequestProperty {
    component ?? AllProperties()
  }
  
  public static func buildEither(first component: RequestProperty) -> RequestProperty {
    component
  }
  
  public static func buildEither(second component: RequestProperty) -> RequestProperty {
    component
  }
  
  public static func buildArray(_ components: [RequestProperty]) -> RequestProperty {
    AllProperties(items: components)
  }
  
  public static func buildLimitedAvailability(_ component: RequestProperty) -> RequestProperty {
    component
  }
}

struct AllProperties: RequestProperty {
  var items: [RequestProperty] = []
  
  func mutate(request: inout URLRequest) {
    for property in items {
      property.mutate(request: &request)
    }
  }
  
  func add(_ property: RequestProperty) -> AllProperties {
    var items = items
    items.append(property)
    return AllProperties(items: items)
  }
}

extension RequestProperty {
  func append(_ property: RequestProperty) -> AllProperties {
    if let allProperties = self as? AllProperties {
      allProperties.add(property)
    } else if let allProperties = property as? AllProperties {
      allProperties.add(self)
    } else {
      AllProperties(items: [self, property])
    }
  }
}
