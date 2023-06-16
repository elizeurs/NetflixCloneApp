//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Elizeu RS on 16/06/23.
//

import Foundation

extension String {
  func capitalizeFirstLetter() -> String {
    return self.prefix(1).uppercased() + self.lowercased().dropFirst()
  }
}
