//
//  Extentions.swift
//  Traffic1
//
//  Created by Farah Ashraf on 14/06/2022.
//

import Foundation
import SwiftUI

//MARK: - add corner radius to desired corners

public extension View {

    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner = .allCorners) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

//MARK: - Swipe right to Delete an Item

public extension View {

    func onDelete(style: Delete.CornerRadiusStyle? = nil, perform action: @escaping () -> Void) -> some View {
        self.modifier(Delete(action: action,  cornerRadiusStyle: style))
    }

}
