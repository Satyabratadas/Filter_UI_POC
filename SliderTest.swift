//
//  SliderTest.swift
//  Filter_UI_Dummy_SwiftUI
//
//  Created by Satyabrata Das on 12/02/24.
//

import SwiftUI

struct SliderTest: View {
    @State var width : CGFloat = 0
    @State var width1 : CGFloat = 330
    var totalWidth = UIScreen.screenWidth - 60
    
    var body: some View{
        VStack{
            ZStack(alignment: .leading ){
                Rectangle()
                    .fill(Color.black.opacity(0.20))
                    .frame(height: 6)
                Rectangle()
                    .fill(Color.black)
                    .frame(width: self.width1 - self.width,height: 6)
                    .offset(x: self.width + 18)
                
                HStack(spacing: 0){
                    Circle()
                        .fill(Color.black)
                        .frame(width: 18,height: 18)
                        .offset(x: self.width)
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    if value.location.x >= 0 && value.location.x <= self.width1{
                                        self.width = value.location.x
                                    }
                                    
                                })
                        )
                    Circle()
                        .fill(Color.black)
                        .frame(width: 18,height: 18)
                        .offset(x: self.width1)
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    if value.location.x <= self.totalWidth && value.location.x >= self.width{
                                        self.width1 = value.location.x
                                    }
                                    
                                })
                        )
                }
            }
        }
        .padding()
    }
}

#Preview {
    SliderTest()
}
