//
//  ContentView.swift
//  Traffic1
//
//  Created by Farah Ashraf on 14/06/2022.
//

import SwiftUI

struct ContentView: View {
    @State var offset: CGFloat = 0
    @State var lastOffset: CGFloat = 0
    @GestureState var gestureOffset: CGFloat = 0
    var body: some View {
        NavigationView{
        ZStack{
            MainView( dataDetails: Intersections)
            
            //Bottom Sheet...
            GeometryReader { proxy -> AnyView in
                let height = proxy.frame(in: .global).height
                
                return AnyView(
                    
                    ZStack {
                        BlurView(style: .systemThinMaterialDark)
                            .clipShape(RoundedCorner(radius: 30, corners: [.topLeft,.topRight]))
                        
                        VStack {
                            Capsule()
                                .fill(Color(#colorLiteral(red: 0.4282190502, green: 0.4248103797, blue: 0.4441621006, alpha: 0.8470588235)))
                                .frame(width: 60, height: 4)
                                .padding(.top)
                            
                            //ScrollView Content Here
                            BottomSheet()
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                    }
                        .offset(y: height - 140)
                        .offset(y: -offset > 0 ? -offset <= (height - 140) ? offset : -(height - 140) : 0)
                        .gesture(DragGesture().updating($gestureOffset, body: {value, out, _ in
                            out = value.translation.height
                            onChange()
                        }).onEnded({ value in
                            
                            let maxHeight = height - 140
                            
                            withAnimation {
                                //Logic Condition For Moving States...
                                //Up down or mid...
                                if -offset > 140 && -offset < maxHeight / 2 {
                                    //Mid..
                                    offset = -(maxHeight / 3)
                                }
                                else if -offset > maxHeight / 2 {
                                    offset = -maxHeight
                                }
                                else {
                                    offset = 0
                                }
                            }
                            // Storing Last Offset...
                            // So that the gesture can continue from the last position...
                            lastOffset = offset
                            
                        }))
                )
                
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }.navigationTitle("Traffic Channel")
            
        }
        .navigationBarTitleDisplayMode(.large)
                
            
    }
    
    
    func onChange() {
        DispatchQueue.main.async {
            self.offset = gestureOffset + lastOffset
        }
    }
    func getBlurRadius()->CGFloat {
        let progress = -offset / (UIScreen.main.bounds.height - 140)
        
        return progress * 30
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

//            .colorScheme(.dark)
    }
}
