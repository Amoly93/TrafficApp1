//
//  LineChartView.swift
//  Traffic1
//
//  Created by amal badr on 20/06/2022.
//

import SwiftUI

func getTimestamp()-> String {
    let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
    return "\(timestamp)"
}
public struct LineChartView: View {
    @StateObject var data:ChartData
    @State private var touchLocation:CGPoint = .init(x: 130, y: 0)
    @State private var showIndicatorDot: Bool = true


    
    public var body: some View {
            VStack{
            // MARK: - CARD
                ZStack(alignment: .center){

                RoundedRectangle(cornerRadius: 20)
                    
                    .fill(BgColor(Card: data))
                    .frame(width: 362, height: 266, alignment: .center)
                    
                    HStack {
                        Spacer()
                        Rectangle()
                            .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3405422185)))
                            .opacity(0.3)
                            .frame(width: 1)
                        Spacer()
                        Rectangle()
                            .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3405422185)))
                            .opacity(0.3)
                            .frame(width: 1)
                        Spacer()
                        Rectangle()
                            .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3405422185)))
                            .opacity(0.3)
                            .frame(width: 1)
                        Spacer()
                    
                    }
                   
                    .frame(width: 362, height: 260, alignment: .center)

                VStack(alignment: .leading){

                        VStack{
                       Text(data.title!)
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .padding(.top, 20.0)
                             

                        }
                        .padding(.leading)
                       

//                    Spacer()

                    GeometryReader{ geometry in
                        Line(data: self.data,
                             frame: .constant(geometry.frame(in: .local)),
                             touchLocation: self.$touchLocation,
                             showIndicator: self.$showIndicatorDot,
                             minDataValue: .constant(0),
                             maxDataValue: .constant(4)
                           
                        )

                    }
                    .frame(width: 360, height: 200)
//                    if getTimestamp() == data.time {
//                            self.showIndicatorDot = true
//                        }
//                    .clipShape(RoundedRectangle(cornerRadius:5 ))
                    Spacer(minLength: -2)
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.8797428608, green: 0.8797428012, blue: 0.8797428608, alpha: 0.1)))
                        .frame(width: 362, height: 19).overlay(
                    HStack(spacing: 53.0){
//                        Text(data.points)
                        ForEach(data.time ,id: \.self) { Y in
                            Text(Y)
                          
                                  }
//                        Text( self.getCurrentValue()! )
                      
                   
                    }
                    .font(Font.system(size: 11 ,weight: .medium))
                    .foregroundColor(Color.white)
                    .frame(width: 360.0 , height: 15)
                   )
                        
                }.padding(.bottom, 10.0).frame(width: 300, height: 200)
                }.clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
            }
  
    }
    
    func getCurrentValue() -> (String,Double)? {
        guard self.data.points.count > 0 else { return nil}
        let index =  Int(self.data.points.count)
        return self.data.points[index]
    }
    
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LineChartView( data: .init(points: [0, 2, 2 ,3], time: ["1:00 PM","1:15 PM","1:30 PM" , "1:45 PM"], title: "King Fahd Bin Abdulaziz Rd - North",colorCard: 1))
//            LineChartView(data:  .init(points: [("1:00", 80),("1:20", 80),("1:90", 80),("88", 80)], title: "King Fahd Bin Abdulaziz Rd - North", colorCard: 60))


        }
    }
}

//ChartData(values: [("home", 6),("home", 6),("home", 6)], title: "String")
//.init(points: [("1:00", 85),("1:20", 84),("1:90", 85),("88", 83)]
