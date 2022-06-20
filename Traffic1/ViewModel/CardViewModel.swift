//
//  CardViewModel.swift
//  Traffic1
//
//  Created by Farah Ashraf on 14/06/2022.
//

import Foundation

class CardViewModel: ObservableObject {
    @Published var cards: [RoadCard] = [
        RoadCard(roadName: "Prince Turki Al-Awwal", trafficCondition: "Extreme",isSwiped: false,offset: 0),
        RoadCard(roadName: "King Fahad road North ",trafficCondition: "High Traffic",isSwiped: false,offset: 0),
        RoadCard(roadName: "King Salman road South ", trafficCondition: "Medium Traffic",isSwiped: false,offset: 0),
        RoadCard(roadName: "Prince Turki Al-Awwal", trafficCondition: "Low Traffic",isSwiped: false,offset: 0),
        
        
    ]
}
