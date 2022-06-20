//
//  SwiftUIView.swift
//  Traffic1
//
//  Created by amal badr on 20/06/2022.
//

//
//  Details.swift
//  chat-card
//
//  Created by amal badr on 05/06/2022.
//

import SwiftUI

struct intersectionCell: View {
    let  detail:Intersection
    var body: some View {
        HStack{
            ZStack{
                // MARK: - High Traffic (Green)
    if (detail.trafficCondition == 0){
                  Circle()
                      .fill(Color(#colorLiteral(red: 0.1312103271, green: 0.5165600181, blue: 0.3449866772, alpha: 1)))
                      .frame(width: 26.18, height: 126.18)
                                  Circle()
                                      .fill(Color(#colorLiteral(red: 0.1312103271, green: 0.5165600181, blue: 0.3449866772, alpha: 0.2)))
                                      .frame(width: 48, height: 48)
              }
                // MARK: - Medium Traffic (Yellow)
              else if (detail.trafficCondition == 1){
                  Circle()
                      .fill(Color(#colorLiteral(red: 0.8371217847, green: 0.4898844957, blue: 0.01937523298, alpha: 1)))
                      .frame(width: 26.18, height: 126.18)
                                  Circle()
                      .fill(Color(#colorLiteral(red: 0.8371217847, green: 0.4898844957, blue: 0.01937523298, alpha: 1)))
                      .opacity(0.2)
                      .frame(width: 48, height: 48)
              }
                // MARK: - Low Traffic (Red)
                else{
                  Circle()
                      .fill(Color(#colorLiteral(red: 0.6748812795, green: 0.1826903522, blue: 0, alpha: 1)))
                      .frame(width: 26.18, height: 126.18)
                                  Circle()
                      .fill(Color(#colorLiteral(red: 0.6748812795, green: 0.1826903522, blue: 0, alpha: 1)))
                      .opacity(0.2)
                                      .frame(width: 48, height: 48)
             
            }
//                Circle()
//                    .fill(Color.red)
//                    .frame(width: 26.18, height: 126.18)
//                Circle()
//                    .fill(Color(#colorLiteral(red: 0.1312103271, green: 0.5165600181, blue: 0.3449866772, alpha: 0.2)))
//                    .frame(width: 48, height: 48)
                    
            }
           
            Text ("\(detail.roadName)")
                .font(Font.system(size: 14 ,weight: .medium))
//                .foregroundColor(Color.white)
                .padding(.leading, 5.0)
                   

                      }
        .frame(width: 360, height: 60, alignment: .leading)
    }
}

struct Details_Previews: PreviewProvider {
    static var Road = Intersections[2]
    static var previews: some View {
        intersectionCell(detail: Road)
            .previewLayout(.fixed(width: 360, height: 70))
    }
}
