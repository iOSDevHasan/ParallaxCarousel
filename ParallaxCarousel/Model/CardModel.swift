//
//  CardModel.swift
//  ParallaxCarousel
//
//  Created by HASAN BERAT GURBUZ on 8.10.2024.
//

import SwiftUI

struct CardModel: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var subTitle: String
    var image: String
}

var cardList: [CardModel] = [
    CardModel(title: "Posedion", subTitle: "DC Hero", image: "pic1"),
    CardModel(title: "Posedion Second", subTitle: "DC Hero", image: "pic2"),
    CardModel(title: "Thor", subTitle: "Marvel Hero", image: "pic3"),
    CardModel(title: "Thor Second", subTitle: "Marvel Hero", image: "pic4"),
    CardModel(title: "Thor Third", subTitle: "Marvel Hero", image: "pic5")
]
