//
//  TwoRangeSliderWithOriantation.swift
//  Filter_UI_Dummy_SwiftUI
//
//  Created by Satyabrata Das on 02/02/24.
//

import SwiftUI
import Combine

import SwiftUI
import Combine

struct SliderViewRepresent: View {
//    @State private var screenWidth: CGFloat = UIScreen.main.bounds.width
    let screenWidth: CGFloat
    init(screenWidth: CGFloat) {
        self.screenWidth = screenWidth
    }
    var body: some View {
            TwoRangeSliderWithOriantation(screenWidth: screenWidth)
            .padding(.leading, 5)
  
    }
}

struct TwoRangeSliderWithOriantation: View {
    let screenWidth: CGFloat
    
    @ObservedObject var slider: CustomSlider
    
    init(screenWidth: CGFloat) {
        self.screenWidth = screenWidth
        self.slider = CustomSlider(start: 0, end: 5000, width: screenWidth)
    }
    
    var body: some View {
        @State  var lowValue = String(slider.lowHandle.currentValue)
        @State  var highValue = String(slider.highHandle.currentValue)
        
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .frame(width: screenWidth, height: 100)
            VStack(alignment: .leading, content: {
                HStack(content: {
                    Text("PRICE")
                })
                .padding(.leading, 5)
                SliderView(slider: slider, screenWidth: screenWidth)
                    .padding(.leading, 15)
                HStack{
                    TextFieldView(value: $lowValue)
                    Spacer()
                    TextFieldView(value: $highValue)
                }
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            })
                  
                
        }
    }
}

struct SliderView: View {
    @ObservedObject var slider: CustomSlider
    let screenWidth: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: slider.lineWidth)
            .fill(Color.gray.opacity(0.2))
            .frame(width: screenWidth, height: slider.lineWidth)
            .overlay(
                ZStack {
                    //Path between both handles
                    SliderPathBetweenView(slider: slider)
                    
                    //Low Handle
                    SliderHandleView(handle: slider.lowHandle)
                        .highPriorityGesture(slider.lowHandle.sliderDragGesture)
                    
                    //High Handle
                    SliderHandleView(handle: slider.highHandle)
                        .highPriorityGesture(slider.highHandle.sliderDragGesture)
                }
            )
    }
}

struct SliderHandleView: View {
    @ObservedObject var handle: SliderHandle
    
    var body: some View {
        Circle()
            .frame(width: handle.diameter, height: handle.diameter)
            .foregroundColor(.white)
            .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 0)
            .scaleEffect(handle.onDrag ? 1.3 : 1)
            .contentShape(Rectangle())
            .position(x: handle.currentLocation.x, y: handle.currentLocation.y)
    }
}

struct SliderPathBetweenView: View {
    @ObservedObject var slider: CustomSlider
    
    var body: some View {
        Path { path in
            path.move(to: slider.lowHandle.currentLocation)
            path.addLine(to: slider.highHandle.currentLocation)
        }
        .stroke(Color.green, lineWidth: slider.lineWidth)
    }
}

struct TextFieldView: View {
    @Binding var value: String
    var body: some View {
        ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .foregroundColor(.white)
                                    .border(Color(red: 0.86, green: 0.86, blue: 0.86))
                                //                        .frame(height: 50)
                                HStack {
                                    Text("$")
                                        .font(.title3)
                                        .foregroundColor(.black)
                                        .padding(.leading, 8)
                                    TextField("Amount 1", text: $value)
                                        .padding(.leading, -3)
                                        .foregroundColor(.black)
                                        .textFieldStyle(PlainTextFieldStyle())
                                        .keyboardType(.decimalPad)
                                }
                            }
                            .frame(width: 100,height: 40)
    }
}

@propertyWrapper
struct SliderValue {
    var value: Double
    
    init(wrappedValue: Double) {
        self.value = wrappedValue
    }
    
    var wrappedValue: Double {
        get { value }
        set { value = min(max(0.0, newValue), 1.0) }
    }
}

class SliderHandle: ObservableObject {
    
    //Slider Size
    let sliderWidth: CGFloat
    let sliderHeight: CGFloat
    
    //Slider Range
    let sliderValueStart: Double
    let sliderValueRange: Double
    
    //Slider Handle
    var diameter: CGFloat = 20
    var startLocation: CGPoint
    
    //Current Value
    @Published var currentPercentage: SliderValue
    
    //Slider Button Location
    @Published var onDrag: Bool
    @Published var currentLocation: CGPoint
        
    init(sliderWidth: CGFloat, sliderHeight: CGFloat, sliderValueStart: Double, sliderValueEnd: Double, startPercentage: SliderValue) {
        self.sliderWidth = sliderWidth
        self.sliderHeight = sliderHeight
        
        self.sliderValueStart = sliderValueStart
        self.sliderValueRange = sliderValueEnd - sliderValueStart
        
        let startLocation = CGPoint(x: (CGFloat(startPercentage.wrappedValue)/1.0)*sliderWidth, y: sliderHeight/2)
        
        self.startLocation = startLocation
        self.currentLocation = startLocation
        self.currentPercentage = startPercentage
        
        self.onDrag = false
    }
    
    lazy var sliderDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>  = DragGesture()
        .onChanged { value in
            self.onDrag = true
            
            let dragLocation = value.location
            
            //Restrict possible drag area
            self.restrictSliderBtnLocation(dragLocation)
            
            //Get current value
            self.currentPercentage.wrappedValue = Double(self.currentLocation.x / self.sliderWidth)
            
        }.onEnded { _ in
            self.onDrag = false
        }
    
    private func restrictSliderBtnLocation(_ dragLocation: CGPoint) {
        //On Slider Width
        if dragLocation.x > CGPoint.zero.x && dragLocation.x < sliderWidth {
            calcSliderBtnLocation(dragLocation)
        }
    }
    
    private func calcSliderBtnLocation(_ dragLocation: CGPoint) {
        if dragLocation.y != sliderHeight/2 {
            currentLocation = CGPoint(x: dragLocation.x, y: sliderHeight/2)
        } else {
            currentLocation = dragLocation
        }
    }
    
    //Current Value
    var currentValue: Int {
        return Int(sliderValueStart + currentPercentage.wrappedValue * sliderValueRange)
    }
}

class CustomSlider: ObservableObject {
    
    //Slider Size
    let width: CGFloat
    let lineWidth: CGFloat = 2
    
    //Slider value range from valueStart to valueEnd
    let valueStart: Double
    let valueEnd: Double
    
    //Slider Handle
    @Published var highHandle: SliderHandle
    @Published var lowHandle: SliderHandle
    
    //Handle start percentage (also for starting point)
    @SliderValue var highHandleStartPercentage = 1.0
    @SliderValue var lowHandleStartPercentage = 0.0

    var anyCancellableHigh: AnyCancellable?
    var anyCancellableLow: AnyCancellable?
    
    init(start: Double, end: Double, width: CGFloat) {
        valueStart = start
        valueEnd = end
        self.width = width
        
        highHandle = SliderHandle(sliderWidth: width,
                                  sliderHeight: lineWidth,
                                  sliderValueStart: valueStart,
                                  sliderValueEnd: valueEnd,
                                  startPercentage: _highHandleStartPercentage
                                )
        
        lowHandle = SliderHandle(sliderWidth: width,
                                  sliderHeight: lineWidth,
                                  sliderValueStart: valueStart,
                                  sliderValueEnd: valueEnd,
                                  startPercentage: _lowHandleStartPercentage
                                )
        
        anyCancellableHigh = highHandle.objectWillChange.sink { _ in
            self.objectWillChange.send()
        }
        anyCancellableLow = lowHandle.objectWillChange.sink { _ in
            self.objectWillChange.send()
        }
    }
    
    //Percentages between high and low handle
    var percentagesBetween: String {
        return String(format: "%.2f", highHandle.currentPercentage.wrappedValue - lowHandle.currentPercentage.wrappedValue)
    }
    
    //Value between high and low handle
    var valueBetween: String {
        return String(format: "%.2f", highHandle.currentValue - lowHandle.currentValue)
    }
}

#Preview {
    SliderViewRepresent(screenWidth: 300)
}
