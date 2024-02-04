//
//  CustomSlider.swift
//  Filter_UI_Dummy_SwiftUI
//
//  Created by Satyabrata Das on 31/01/24.
//

import SwiftUI
import Combine

//SliderValue to restrict double range: 0.0 to 1.0
//@propertyWrapper
//struct SliderValue {
//    var value: Double
//    
//    init(wrappedValue: Double) {
//        self.value = wrappedValue
//    }
//    
//    var wrappedValue: Double {
//        get { value }
//        set { value = min(max(0.0, newValue), 1.0) }
//    }
//}
//
//class SliderHandle: ObservableObject {
//    
//    //Slider Size
//    let sliderWidth: CGFloat
//    let sliderHeight: CGFloat
//    
//    //Slider Range
//    let sliderValueStart: Double
//    let sliderValueRange: Double
//    
//    //Slider Handle
//    var diameter: CGFloat = 15
//    var startLocation: CGPoint
//    
//    //Current Value
//    @Published var currentPercentage: SliderValue
//    
//    //Slider Button Location
//    @Published var onDrag: Bool
//    @Published var currentLocation: CGPoint
//   
//        
//    init(sliderWidth: CGFloat, sliderHeight: CGFloat, sliderValueStart: Double, sliderValueEnd: Double, startPercentage: SliderValue) {
//        self.sliderWidth = sliderWidth
////        var sliderWidth: CGFloat
//        self.sliderHeight = sliderHeight
//        
////        if isCurrentDeviceIpad(){
////            sliderWidth = UIScreen.screenWidth - 55
////        }
////        else{
////            sliderWidth = UIScreen.screenWidth - 55
////        }
//        self.sliderValueStart = sliderValueStart
//        self.sliderValueRange = sliderValueEnd - sliderValueStart
//        
//        let startLocation = CGPoint(x: (CGFloat(startPercentage.wrappedValue)/1.0)*sliderWidth, y: sliderHeight/2)
//        
//        self.startLocation = startLocation
//        self.currentLocation = startLocation
//        self.currentPercentage = startPercentage
////        self.sliderFinalWidth = sliderWidth
//        self.onDrag = false
//    }
//    
//    lazy var sliderDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>  = DragGesture()
//        .onChanged { value in
//            self.onDrag = true
//            
//            let dragLocation = value.location
//            
//            //Restrict possible drag area
//            self.restrictSliderBtnLocation(dragLocation)
//            
//            //Get current value
//            self.currentPercentage.wrappedValue = Double(self.currentLocation.x / self.sliderWidth)
//            
//        }.onEnded { _ in
//            self.onDrag = false
//        }
//    
//    private func restrictSliderBtnLocation(_ dragLocation: CGPoint) {
//        //On Slider Width
//        if dragLocation.x > -1 && dragLocation.x < sliderWidth + 1 {
//            calcSliderBtnLocation(dragLocation)
//        }
//    }
//    
//    private func calcSliderBtnLocation(_ dragLocation: CGPoint) {
//        if dragLocation.y != sliderHeight/2 {
//            currentLocation = CGPoint(x: dragLocation.x, y: sliderHeight/2)
//        } else {
//            currentLocation = dragLocation
//        }
//    }
//    
//    //Current Value
//    var currentValue: Int {
//        return Int(sliderValueStart + currentPercentage.wrappedValue * sliderValueRange)
//    }
//    
//    
//}
//
//class CustomSlider: ObservableObject {
//    
//    //Slider Size
//    let lineWidth: CGFloat = 2
//    let sliderWidth: CGFloat
//    
//    //Slider value range from valueStart to valueEnd
//    let valueStart: Double
//    let valueEnd: Double
//    
//    //Slider Handle
//    @Published var highHandle: SliderHandle
//    @Published var lowHandle: SliderHandle
//    
//    //Handle start percentage (also for starting point)
//    @SliderValue var highHandleStartPercentage = 1.0
//    @SliderValue var lowHandleStartPercentage = 0.0
//
//    var anyCancellableHigh: AnyCancellable?
//    var anyCancellableLow: AnyCancellable?
//    
//    init(start: Double, end: Double, width: CGFloat) {
//        valueStart = start
//        valueEnd = end
//        sliderWidth = width
//        highHandle = SliderHandle(sliderWidth: sliderWidth,
//                                  sliderHeight: lineWidth,
//                                  sliderValueStart: valueStart,
//                                  sliderValueEnd: valueEnd,
//                                  startPercentage: _highHandleStartPercentage
//                                )
//        
//        lowHandle = SliderHandle( sliderWidth: sliderWidth,
//                                  sliderHeight: lineWidth,
//                                  sliderValueStart: valueStart,
//                                  sliderValueEnd: valueEnd,
//                                  startPercentage: _lowHandleStartPercentage
//                                )
//        
//        anyCancellableHigh = highHandle.objectWillChange.sink { _ in
//            self.objectWillChange.send()
//        }
//        anyCancellableLow = lowHandle.objectWillChange.sink { _ in
//            self.objectWillChange.send()
//        }
//    }
//    
//    //Percentages between high and low handle
//    var percentagesBetween: String {
//        return String(format: "%.2f", highHandle.currentPercentage.wrappedValue - lowHandle.currentPercentage.wrappedValue)
//    }
//    
//    //Value between high and low handle
//    var valueBetween: String {
//        return String(format: "%.2f", highHandle.currentValue - lowHandle.currentValue)
//    }
//}
