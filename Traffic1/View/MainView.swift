//
//  MainView.swift
//  Traffic1
//
//  Created by Farah Ashraf on 14/06/2022.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var cardData = CardViewModel()
    @StateObject static var dataCard:ChartData = .init(points: [0, 2, 2 ,3], time: ["1:00 PM","1:15 PM","1:30 PM" , "1:45 PM"], title: "King Fahd Bin Abdulaziz Rd - North",colorCard: 1)
      let dataDetails:[Intersection]
    @State private var show: Bool = false
    @Environment(\.editMode) var editMode
    @State var offset: CGFloat = 0
    @State var lastOffset: CGFloat = 0
    @State var currentCard: RoadCard?
    @State var SearchStreetText : String = ""
    
    @Namespace var animation
    var body: some View {
        //        NavigationView{
        
        
        VStack(alignment: .leading) {
            
            
            Text("Traffic List")
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.leading)
            
            if self.editMode?.wrappedValue == .active {
            
                List{
                    ForEach(cardData.cards){
                        card in
//                        swipeActions {
//                            Button(role: .destructive, action: {
//                                cardData.cards.deleteCard(at:card) } ) {
//                                   Label("Delete", systemImage: "trash")
//
//                            }
//                            
//                        }
                      
                        ZStack(alignment: .bottomLeading) {

                            // MARKK - CARD BACKGROUND
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(getBgColor(Card: card))
                              .frame(width: 330 , height: 103)
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
                        

                        
                    }.onDelete(perform: deleteCard)

                
                }.listStyle(.plain)
                    
                    .toolbar {
                        EditButton()
                    }
                    
                
                
            }
            
            else{
                ScrollView{
                    ForEach(cardData.cards){
                        card in
                      
                        CardView(card: $cardData.cards[getIndex(Card: card)], cards: $cardData.cards)
                        
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.35)) {
                                    currentCard = card
                                    print("🦄\(currentCard)")
                                    self.show.toggle()
                                    print("🤬\(show)")
                                    print("😏\(editMode)")
                                }
                                
                            }
                        
                    }
                    
                }.toolbar {
                    EditButton()
                }
                
                
            }}
        
        .sheet(isPresented: self.$show) { RoadDetailsView(dataDetails: Intersections,data: MainView.dataCard, isShowingStreetView: $show)}
        .coordinateSpace(name: "SCROLL")
        .searchable(text: $SearchStreetText, placement:.navigationBarDrawer(displayMode: .always))
        
        .preferredColorScheme(.dark)
    }
    // MARK: - Delete Card
    
    func deleteCard(at offsets: IndexSet) {
        withAnimation {
            cardData.cards.remove(atOffsets: offsets)
        }
    }
  
    
    func getIndex(Card: RoadCard)-> Int {
        return cardData.cards.firstIndex { currentCard in
            return currentCard.id == Card.id
        } ?? 0
    }
    
}

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


struct MainView_Previews: PreviewProvider {
  
    static var previews: some View {
        MainView( dataDetails: Intersections)
        
        
    }
}
