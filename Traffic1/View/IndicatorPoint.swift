//
//  IndicatorPoint.swift
//  Traffic1
//
//  Created by amal badr on 20/06/2022.
//

import SwiftUI

struct IndicatorPoint: View {
    var body: some View {
        ZStack{
       
            Circle()
                .fill(Color.white)
                .frame(width: 15.16, height: 15.16)
            Circle()
                .stroke(Color(hue: 1.0, saturation: 0.0, brightness: 1.0, opacity: 0.573), style: StrokeStyle(lineWidth: 15))
                .frame(width: 27.8, height: 27.8)
               
            Text("Now")
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.4196078431372549, green: 0.08235294117647059, blue: 0.00392156862745098))
                .font(Font.system(size: 4))
                
        }


    }
}

struct IndicatorPoint_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorPoint()
    }
}
