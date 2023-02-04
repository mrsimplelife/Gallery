//
//  Card.swift
//  Gallery
//
//  Created by youme on 2023/02/04.
//

import SwiftUI

enum CardType: String {
    case skeleton
    case monkey
    case owl
    case panda

    func getColor() -> UIColor {
        switch self {
        case .skeleton:
            return .green

        case .monkey:
            return .orange

        case .owl:
            return .red

        case .panda:
            return .purple
        }
    }
}

class Card {
    var imageName: String
    var characterName: String
    var backgroundColor: UIColor

    private init(imageName: String, characterName: String, backgroundColor: UIColor) {
        self.imageName = imageName
        self.characterName = characterName
        self.backgroundColor = backgroundColor
    }

    static func getCardDetails(for type: CardType) -> Card {
        return Card(
            imageName: type.rawValue,
            characterName: type.rawValue.capitalized,
            backgroundColor: type.getColor()
        )
    }
}
