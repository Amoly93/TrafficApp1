//
//  RoadCard.swift
//  Traffic1
//
//  Created by Farah Ashraf on 14/06/2022.
//
import SwiftUI
import Foundation
struct RoadCard: Identifiable {
    var id = UUID().uuidString
    var roadName: String
    var trafficCondition: String
//    var trafficConditionSymbol : String   I will put it when i get the symbols in assets
    var isSwiped: Bool
    var offset: CGFloat
}
