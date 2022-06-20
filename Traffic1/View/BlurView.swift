//
//  BlurView.swift
//  Traffic1
//
//  Created by Farah Ashraf on 14/06/2022.
//

import Foundation
import SwiftUI

struct BlurView: UIViewRepresentable {
    
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        //do nothing
    }
}
