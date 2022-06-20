//
//  CardView.swift
//  Traffic1
//
//  Created by Farah Ashraf on 14/06/2022.
//

import SwiftUI

struct CardView: View {
    @Binding var card: RoadCard
    @Binding var cards: [RoadCard]
    var body: some View {
        GeometryReader {proxy in
            
            let rect = proxy.frame(in: .named("SCROLL"))
            let offset = CGFloat(getIndex(Card: card)*50)
            
            ZStack(alignment: .bottomLeading) {
                
                
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.easeIn){deleteItem()}
                    }) {
                        Image(systemName: "trash")
                            .background(.red)
                            .font(.title)
                            .foregroundColor(.red)
                            .frame(width: 90, height: 50)
                    }
                }
                
                // MARKK - CARD BACKGROUND
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(getBgColor(Card: card))
                    .frame(width: 362 , height: 103)
                    .padding(.trailing)
                // MARK: - CARD DETAILS
                VStack(alignment: .leading, spacing: 35.0) {
                    Text(card.roadName)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    HStack{
                    Text(card.trafficCondition)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        Spacer()
                        Text("Riyadh")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.trailing)
                    }
                }
                .padding()
                

            }
            .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
            .offset(y:offset)
        }
    //    .frame(height: 200)
       .padding(.horizontal)
    }
    
    // MARK: - GET CARD INDEX NUMBER
    func getIndex(Card: RoadCard)-> Int {
        return cards.firstIndex { currentCard in
            return currentCard.id == Card.id
        } ?? 0
    }
    
    // MARK: - GET CARD Background Color

    func getBgColor(Card:RoadCard)->LinearGradient{

        var bgColor = LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.8141518235, green: 0.452002883, blue: 0, alpha: 1)) ,Color( #colorLiteral(red: 0.8141518235, green: 0.452002883, blue: 0, alpha: 1))]), startPoint: .top, endPoint: .bottom)
        
        if (Card.trafficCondition == "High Traffic" ){
            bgColor = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8032885194, green: 0.1093287393, blue: 0, alpha: 1) ) ,Color(#colorLiteral(red: 0.3706890047, green: 0.0455308184, blue: 0.0006339504034, alpha: 1))]), startPoint: .top, endPoint: .bottom)
        }
        else if (Card.trafficCondition == "Low Traffic" ){
            bgColor = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0.5986915827, blue: 0.3405108452, alpha: 1) ) ,Color(#colorLiteral(red: 0, green: 0.3094222546, blue: 0.2128856778, alpha: 1) )]), startPoint: .top, endPoint: .bottom)
        }
        else if (Card.trafficCondition == "Medium Traffic" ){
            bgColor =
            LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 1, green: 0.6665794253, blue: 0, alpha: 1)) ,Color( #colorLiteral(red: 0.8743645549, green: 0.4284721911, blue: 0, alpha: 1))]), startPoint: .top, endPoint: .bottom)

            
        }
        else{
            bgColor = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5046210289, green: 0.06602392346, blue: 0, alpha: 1) ) ,Color(#colorLiteral(red: 0.2254807949, green: 0.01617947407, blue: 0, alpha: 1))]), startPoint: .top, endPoint: .bottom)
        }
        return bgColor
    }
    
    func deleteItem() {
        cards.removeAll { (card) -> Bool in
            return self.card.id == card.id
        }
    }
    
    func onChanged(value: DragGesture.Value) {
        if value.translation.width < 0 {
            if card.isSwiped {
                card.offset = value.translation.width - 90
            } else {
                card.offset = value.translation.width
            }
        }
    }
    
    func onEnd(value: DragGesture.Value) {
        withAnimation(.easeOut) {
            if value.translation.width < 0 {
                if -value.translation.width > UIScreen.main.bounds.width / 2 {
                    card.offset = -1000
                    deleteItem()
                } else if -card.offset > 50 {
                    card.isSwiped = true
                    card.offset = -90
                } else {
                    card.isSwiped = false
                    card.offset = 0
                }
            } else {
                card.isSwiped = false
                card.offset = 0
            }
        }
    }
    

    
}


