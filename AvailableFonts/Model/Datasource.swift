//
//  Datasource.swift
//  AvailableFonts
//
//  Created by Alexander on 11/1/17.
//  Copyright © 2017 Dictality. All rights reserved.
//

import UIKit

class Datasource: NSObject {
  
  let availableFontNames: [String]!
  
  let arrayOfText: [String] = {
    let text = "0123456789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
    let array = Array(text.map { String($0) })
    return array
  }()
  
  override init() {
    var arr = [String]()
    for name in UIFont.familyNames {
        arr.append(name)
    }
    availableFontNames = arr
  }
  
  
}
