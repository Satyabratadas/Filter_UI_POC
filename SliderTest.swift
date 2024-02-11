//
//  SliderTest.swift
//  Filter_UI_Dummy_SwiftUI
//
//  Created by Satyabrata Das on 12/02/24.
//

import SwiftUI

struct SliderTest: View {
    @State var minValue: Float = 0.0
    @State var maxValue: Float = Float(UIScreen.main.bounds.width - 50.0)
    @State var orientation = UIDeviceOrientation.portrait
    @State private var screenWidth: CGFloat = UIScreen.screenWidth
    var body: some View {
        Group{
            // setup slider view
            VStack {
                HStack {
                    Text("0")
                        .offset(x: 28, y: 20)
                        .frame(width: 30, height: 30, alignment: .leading)
                        .foregroundColor(Color.black)
                    
                    Spacer()
                    
                    Text("100")
                        .offset(x: -18, y: 20)
                        .frame(width: 30, height: 30, alignment: .trailing)
                        .foregroundColor(Color.black)
                }
                if orientation.isLandscape{
                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                        Capsule()
                            .fill(Color.blue.opacity(25))
                            .frame(width: CGFloat((screenWidth) + 10), height: 30)
                        
                        Capsule()
                            .fill(Color.blue.opacity(25))
                            .offset(x: CGFloat(self.minValue))
                            .frame(width: CGFloat((self.maxValue) - self.minValue), height: 30)
                        
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 30, height: 30)
                            .background(Circle().stroke(Color.white, lineWidth: 5))
                            .offset(x: CGFloat(self.minValue))
                            .gesture(DragGesture().onChanged({ (value) in
                                if value.location.x > 8 && value.location.x <= (UIScreen.main.bounds.width - 50) &&
                                    value.location.x < CGFloat(self.maxValue - 30) {
                                    self.minValue = Float(value.location.x - 8)
                                }
                            }))
                        
                        Text(String(format: "%.0f", (CGFloat(self.minValue) / (UIScreen.main.bounds.width - 50)) * 100))
                            .offset(x: CGFloat(self.minValue))
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(Color.black)
                        
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 30, height: 30)
                            .background(Circle().stroke(Color.white, lineWidth: 5))
                            .offset(x: CGFloat(self.maxValue - 18))
                            .gesture(DragGesture().onChanged({ (value) in
                                if value.location.x - 8 <= (UIScreen.main.bounds.width - 50) &&           value.location.x > CGFloat(self.minValue + 50) {
                                    self.maxValue = Float(value.location.x - 8)
                                }
                            }))
                        
                        Text(String(format: "%.0f", (CGFloat(self.maxValue) / (UIScreen.main.bounds.width - 50)) * 100))
                            .offset(x: CGFloat(self.maxValue - 18))
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(Color.black)
                    })
                    .padding()
                }else{
                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                        Capsule()
                            .fill(Color.blue.opacity(25))
                            .frame(width: CGFloat((screenWidth) + 10), height: 30)
                        
                        Capsule()
                            .fill(Color.blue.opacity(25))
                            .offset(x: CGFloat(self.minValue))
                            .frame(width: CGFloat((self.maxValue) - self.minValue), height: 30)
                        
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 30, height: 30)
                            .background(Circle().stroke(Color.white, lineWidth: 5))
                            .offset(x: CGFloat(self.minValue))
                            .gesture(DragGesture().onChanged({ (value) in
                                if value.location.x > 8 && value.location.x <= (UIScreen.main.bounds.width - 50) &&
                                    value.location.x < CGFloat(self.maxValue - 30) {
                                    self.minValue = Float(value.location.x - 8)
                                }
                            }))
                        
                        Text(String(format: "%.0f", (CGFloat(self.minValue) / (UIScreen.main.bounds.width - 50)) * 100))
                            .offset(x: CGFloat(self.minValue))
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(Color.black)
                        
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 30, height: 30)
                            .background(Circle().stroke(Color.white, lineWidth: 5))
                            .offset(x: CGFloat(self.maxValue - 18))
                            .gesture(DragGesture().onChanged({ (value) in
                                if value.location.x - 8 <= (UIScreen.main.bounds.width - 50) &&           value.location.x > CGFloat(self.minValue + 50) {
                                    self.maxValue = Float(value.location.x - 8)
                                }
                            }))
                        
                        Text(String(format: "%.0f", (CGFloat(self.maxValue) / (UIScreen.main.bounds.width - 50)) * 100))
                            .offset(x: CGFloat(self.maxValue - 18))
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(Color.black)
                    })
                    .padding()
                }
                
            }
        }.onChangeOrientation { newOrientation in
            orientation = newOrientation
            screenWidth = UIScreen.screenWidth
//            frame = UIScreen.main.bounds
            print(orientation.rawValue)
        }
    }
}

#Preview {
    SliderTest()
}
