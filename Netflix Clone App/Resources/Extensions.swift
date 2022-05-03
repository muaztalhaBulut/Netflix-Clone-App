//
//  Extensions.swift
//  Netflix Clone App
//
//  Created by Muaz Talha Bulut on 1.05.2022.
//

import Foundation

extension String {
    func capitalizedFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
