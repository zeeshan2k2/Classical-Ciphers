//
//  Extensions.swift
//  Classical Ciphers
//
//  Created by Zeeshan Waheed on 29/08/2024.
//

import Foundation

// Helper function to pad a binary string to a given length
extension String {
    func padLeft(to length: Int, with character: Character) -> String {
        return String(repeating: character, count: max(0, length - self.count)) + self
    }
}
