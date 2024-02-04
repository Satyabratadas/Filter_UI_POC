//
//  SliderViewRepresent.swift
//  Filter_UI_Dummy_SwiftUI
//
//  Created by Satyabrata Das on 31/01/24.
//

import SwiftUI

//struct SliderViewRepresent: View {
//    var width: CGFloat
//    
////    @ObservedObject var slider = CustomSlider(start: 0, end: 5000, width: self.width)
//    
//   
//        var body: some View {
//            @State  var lowValue = String(slider.lowHandle.currentValue)
//            @State  var highValue = String(slider.highHandle.currentValue)
//             
//             
//            VStack(alignment: .leading, content: {
//                Text("PRICE")
//                
//                SliderView(slider: slider)
//                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 3, trailing: 10))
//                HStack{
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 25)
//                            .foregroundColor(.white)
//                            .border(Color(red: 0.86, green: 0.86, blue: 0.86))
//                        //                        .frame(height: 50)
//                        HStack {
//                            Text("$")
//                                .font(.title3)
//                                .foregroundColor(.black)
//                                .padding(.leading, 8)
//                            TextField("Amount 1", text: $lowValue)
//                                .padding(.leading, -3)
//                                .foregroundColor(.black)
//                                .textFieldStyle(PlainTextFieldStyle())
//                                .keyboardType(.decimalPad)
//                        }
//                    }
//                    .frame(width: 100,height: 40)
//                    //                                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 5))
//                    Spacer()
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 25)
//                            .foregroundColor(.white)
//                            .border(Color(red: 0.86, green: 0.86, blue: 0.86))
//                        //                        .frame(height: 50)
//                        HStack {
//                            Text("$")
//                                .font(.title3)
//                                .foregroundColor(.black)
//                                .padding(.leading, 8)
//                            TextField("Amount 1", text: $highValue)
//                                .padding(.leading, -3)
//                                .foregroundColor(.black)
//                                .textFieldStyle(PlainTextFieldStyle())
//                                .keyboardType(.decimalPad)
//                        }
//                    }
//                    .frame(width: 100,height: 40)
//                    //                    .padding(EdgeInsets(top: 5, leading: 100, bottom: 5, trailing: 5))
//                }
//                .padding(EdgeInsets(top: 10, leading: 0, bottom: 3, trailing: 0))
//            }) 
//        }
//}
//
//struct SliderView: View {
//    @ObservedObject var slider: CustomSlider
//    @Environment(\.horizontalSizeClass) var horizontalSizeClass
//    
//    var body: some View {
//        if isCurrentDeviceIpad() || isLandscapeMode(){
//            RoundedRectangle(cornerRadius: slider.lineWidth)
//                .fill(Color.gray.opacity(0.2))
//                .frame(width: UIScreen.screenWidth - 55, height: slider.lineWidth)
//                .overlay(
//                ZStack {
//                    //Path between both handles
//                    SliderPathBetweenView(slider: slider)
//                    
//                    //Low Handle
//                    SliderHandleView(handle: slider.lowHandle)
//                        .highPriorityGesture(slider.lowHandle.sliderDragGesture)
//                    
//                    //High Handle
//                    SliderHandleView(handle: slider.highHandle)
//                        .highPriorityGesture(slider.highHandle.sliderDragGesture)
//                }
//                )
//        }
//        else{
//            
//            RoundedRectangle(cornerRadius: slider.lineWidth)
//                .fill(Color.gray.opacity(0.2))
//                .frame(width: UIScreen.screenWidth - 60, height: slider.lineWidth)
//                .overlay(
//                    ZStack {
//                        //Path between both handles
//                        SliderPathBetweenView(slider: slider)
//                        
//                        //Low Handle
//                        SliderHandleView(handle: slider.lowHandle)
//                            .highPriorityGesture(slider.lowHandle.sliderDragGesture)
//                        
//                        //High Handle
//                        SliderHandleView(handle: slider.highHandle)
//                            .highPriorityGesture(slider.highHandle.sliderDragGesture)
//                    }
//                )
//        }
//    }
//    
//    func buttonWidth(geometry: GeometryProxy) -> CGFloat {
//            if horizontalSizeClass == .compact {
//                return geometry.size.width * 0.5 // Set width to half of the screen width for compact horizontal size class
//            } else {
//                return geometry.size.width * 0.8 // Set width to 80% of the screen width for regular horizontal size class
//            }
//        }
//}
//
//struct SliderHandleView: View {
//    @ObservedObject var handle: SliderHandle
//    
//    var body: some View {
//        Circle()
//            .frame(width: handle.diameter, height: handle.diameter)
//            .foregroundColor(.white)
//            .shadow(color: Color.black.opacity(4), radius: 2, x: 0, y: 0)
//            .scaleEffect(handle.onDrag ? 1 : 1)
//            .contentShape(Circle())
//            .position(x: handle.currentLocation.x, y: handle.currentLocation.y)
//    }
//}
//
//struct SliderPathBetweenView: View {
//    @ObservedObject var slider: CustomSlider
//    
//    var body: some View {
//        Path { path in
//            path.move(to: slider.lowHandle.currentLocation)
//            path.addLine(to: slider.highHandle.currentLocation)
//        }
//        .stroke(Color(red: 0.86, green: 0.86, blue: 0.86), lineWidth: slider.lineWidth)
//    }
//}



//#Preview {
////    SliderViewRepresent()
//}
