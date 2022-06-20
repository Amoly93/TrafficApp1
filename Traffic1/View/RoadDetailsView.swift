//
//  RoadDetailsView.swift
//  Traffic1
//
//  Created by amal badr on 20/06/2022.
//
import SwiftUI


struct RoadDetailsView: View {
    let dataDetails:[Intersection]
//    @StateObject  var dataCard:ChartData = .init(points: [("1:00", 85),("1:20", 84),("1:90", 85),("88", 83)], title: "King Fahd Bin Abdulaziz Rd - North" ,colorCard: 80)
    @StateObject static var dataCard:ChartData = .init(points: [0, 2, 2 ,3], time: ["1:00 PM","1:15 PM","1:30 PM" , "1:45 PM"], title: "King Fahd Bin Abdulaziz Rd - North",colorCard: 1)
    @StateObject var data:ChartData
//    @EnvironmentObject var model: ChartData
    @Binding var isShowingStreetView:Bool
    var body: some View {
        // MARK: - Details
        VStack{
            HStack{
            Button {
                isShowingStreetView.toggle()
            } label: {
                Image(systemName: "x.circle.fill")
                    .foregroundColor(Color(red: 0.17254901960784313, green: 0.17254901960784313, blue: 0.1803921568627451))
                    .frame(width: 30.0, height: 30.0)
                    .font(.system(size: 26))
                    
            }
            .padding(.leading, 336.0)
            .padding(.top, 11.0)
           
            
            }
            .frame(width: 361.0)
            LineChartView(data: data)
//                .environmentObject(dataCard)
            VStack(alignment: .leading){

            List{
                Text("Intersection Details")
                        .font(Font.system(size: 18 ,weight: .bold))
                        .listRowBackground(Color(#colorLiteral(red: 0.1068546938, green: 0.1073546372, blue: 0.1149837066, alpha: 1)))
                        
                ForEach(dataDetails) { detail in
                    intersectionCell(detail: detail)
                        .listRowBackground(Color(#colorLiteral(red: 0.1068546938, green: 0.1073546372, blue: 0.1149837066, alpha: 1)))
                        .listRowSeparatorTint(Color(#colorLiteral(red: 0.3103045225, green: 0.3105843961, blue: 0.3191230595, alpha: 0.7)))
                }
                
                
            }
            .padding(.horizontal, -20.0)
            .ignoresSafeArea(.all)
            
            
            }
         
            
            
        }
    }
}

struct RoadDetailsView_Previews: PreviewProvider {
    @StateObject static var dataCard:ChartData = .init(points: [0, 2, 2 ,3], time: ["1:00 PM","1:15 PM","1:30 PM" , "1:45 PM"], title:  "King Fahd Bin Abdulaziz Rd - North", colorCard: 1)
    static var previews: some View {
        RoadDetailsView(dataDetails: Intersections, data: dataCard, isShowingStreetView: .constant(true) )
        
//        StreetView(dataDetails: Intersections, data: .init(points: [("1:00", 85),("1:20", 84),("1:90", 85),("88", 83)], title: "King Fahd Bin Abdulaziz Rd - North",colorCard: 80), isShowingStreetView: .constant(true))
//            .environmentObject(dataCard)
    }
}
