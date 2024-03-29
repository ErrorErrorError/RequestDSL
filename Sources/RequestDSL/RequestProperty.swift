//
//  RequestProperty.swift
//  Spark
//
//  Created by ErrorErrorError on 3/28/24.
//  
//

import Foundation

public protocol RequestProperty {
  func mutate(request: inout URLRequest)
}
