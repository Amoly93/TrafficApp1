//
//  BottomSheet.swift
//  Traffic1
//
//  Created by Farah Ashraf on 14/06/2022.
//

import SwiftUI

struct BottomSheet: View {
    @StateObject var cardData = CardViewModel()
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
            
                Text("Most Traffic")
                    .fontWeight(.semibold)
                    .padding()
                
                ForEach(cardData.cards){
                    card in
                  
                    CardView(card: $cardData.cards[getIndex(Card: card)], cards: $cardData.cards)
                 
                }
                
            
            
        }
    }
    }
    
    func getIndex(Card: RoadCard)-> Int {
        return cardData.cards.firstIndex { currentCard in
            return currentCard.id == Card.id
        } ?? 0
    }
}



struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheet()
    }
}
