//
//  Helpers.swift
//  Traffic1
//
//  Created by amal badr on 20/06/2022.
//

//
//  Helpers.swift
//  chat-card
//
//  Created by amal badr on 02/06/2022.
//

import Foundation

import SwiftUI



//public class ChartData: ObservableObject, Identifiable {
//    @Published var points: [(name:String,speed:Double)]
//    var ID = UUID()
//    var title: String?
//    var colorCard:Int?
//    public init<N: BinaryFloatingPoint>(points:[(name:String,speed:N)],title:String ,colorCard:Int) {
//        self.points = points.map{($0.0, Double($0.1))}
//        self.title = title
//        self.colorCard = colorCard
//    }
//
//    public func onlyPoints() -> [Double] {
//        return self.points.map{ $0.1 }
//    }
//}

public class ChartData: ObservableObject, Identifiable {
    @Published var points: [(String,Double)]
    @Published var time: [String]
    var ID = UUID()
    var title: String?
    var colorCard:Int?
    public init<N: BinaryFloatingPoint>(points:[N],time: [String],title:String ,colorCard:Int) {
        self.points = points.map{("", Double($0))}
        self.time = time
        self.title = title
        self.colorCard = colorCard
    }
  
    public func onlyPoints() -> [Double] {
        return self.points.map{ $0.1 }
    }
}


public class TestData{
    static public var data:ChartData = ChartData(points: [37,72,51], time: ["1:00 PM","1:15 PM","1:30 PM" , "1:45 PM"],title: "guffuif",colorCard: 0)
//    static public var data2:ChartData = ChartData(values: [("home", 6),("home", 6),("home", 6)], title: "String")
//    static public var data3:ChartData = ChartData(
    
    
}


//// MARK: - GET CARD Background Color
//func getBgColor(Card:RoadCard)->LinearGradient{
//    var bgColor = LinearGradient(colors: Color( #colorLiteral(red: 0.8141518235, green: 0.452002883, blue: 0, alpha: 1)), startPoint: .top, endPoint: .bottom)
//
//    if (Card.trafficCondition == "High Traffic" ){
//      bgColor = LinearGradient(colors: Color( #colorLiteral(red: 0.6890485883, green: 0.1882430911, blue: 0, alpha: 1)) , startPoint: .top, endPoint: .bottom)
//  }
//  else if (Card.trafficCondition == "Low Traffic" ){
//      bgColor = LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.07885948569, green: 0.7001376748, blue: 0.4398876429, alpha: 1)) ,Color( #colorLiteral(red: 0.1544113159, green: 0.3357427418, blue: 0.2464482188, alpha: 1))]), startPoint: .top, endPoint: .bottom)
//  }
//  else if (Card.trafficCondition == "Medium Traffic" ){
//      bgColor = LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.8141518235, green: 0.452002883, blue: 0, alpha: 1)) ,Color( #colorLiteral(red: 0.8141518235, green: 0.452002883, blue: 0, alpha: 1))]), startPoint: .top, endPoint: .bottom)
//  }
//  return bgColor
//}
//struct RoadCard: Identifiable {
//    var id: UUID
//  var roadName: String
//  var trafficCondition: String
//    init(id:UUID = UUID() ,roadName:String ,trafficCondition:String){
//        self.id = id
//        self.roadName = roadName
//        self.trafficCondition = trafficCondition
//    }
//
//
//}


// MARK: - GET CARD Background Color
func BgColor(Card:ChartData)->LinearGradient{
    var bgColor = LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.07885948569, green: 0.7001376748, blue: 0.4398876429, alpha: 1)) ,Color( #colorLiteral(red: 0.1544113159, green: 0.3357427418, blue: 0.2464482188, alpha: 1))]), startPoint: .top, endPoint: .bottom)
    
    if (Card.colorCard! == 2 ){
        
        bgColor = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6890485883, green: 0.1882430911, blue: 0, alpha: 1)) ,Color(#colorLiteral(red: 0.4409647584, green: 0.1069230959, blue: 0, alpha: 1))]), startPoint: .top, endPoint: .bottom)
  }
    else if (Card.colorCard! == 0){
        bgColor = LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.07885948569, green: 0.7001376748, blue: 0.4398876429, alpha: 1)) ,Color( #colorLiteral(red: 0.1544113159, green: 0.3357427418, blue: 0.2464482188, alpha: 1))]), startPoint: .top, endPoint: .bottom)
  }
    else if (Card.colorCard! == 1){
        bgColor = LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.8141518235, green: 0.452002883, blue: 0, alpha: 1)) ,Color( #colorLiteral(red: 0.8141518235, green: 0.452002883, blue: 0, alpha: 1))]), startPoint: .top, endPoint: .bottom)
  }  else if (Card.colorCard! == 3){
      bgColor = LinearGradient(gradient: Gradient(colors: [Color( #colorLiteral(red: 0.5007295609, green: 0.06539645046, blue: 0, alpha: 1)) ,Color(#colorLiteral(red: 0.2637678385, green: 0.02294288576, blue: 0.001906684251, alpha: 1) )]), startPoint: .top, endPoint: .bottom)
}
  return bgColor
}


// MARK: - Intersections DATA
struct Intersection: Identifiable {
    var id: UUID
  var roadName: String
  var trafficCondition: Int
    init(id:UUID = UUID() ,roadName:String ,trafficCondition:Int){
        self.id = id
        self.roadName = roadName
        self.trafficCondition = trafficCondition
    }
    

}
var Intersections: [Intersection] = [
  Intersection(roadName: "King Fahad road North ",trafficCondition: 0),
  Intersection(roadName: "King Salman road South ", trafficCondition: 1),
  Intersection(roadName: "Prince Turki Al-Awwal", trafficCondition: 2),
  Intersection(roadName: "King Fahad road North ",trafficCondition: 2),
  Intersection(roadName: "King Salman road South ", trafficCondition: 0),
  Intersection(roadName: "Prince Turki Al-Awwal", trafficCondition: 0),
  Intersection(roadName: "King Fahad road North ",trafficCondition: 1),
  Intersection(roadName: "King Salman road South ", trafficCondition: 2),
  Intersection(roadName: "Prince Turki Al-Awwal", trafficCondition: 1),
  Intersection(roadName: "King Fahad road North ",trafficCondition: 1),
  Intersection(roadName: "King Salman road South ", trafficCondition: 2),
  Intersection(roadName: "Prince Turki Al-Awwal", trafficCondition: 2),
]
