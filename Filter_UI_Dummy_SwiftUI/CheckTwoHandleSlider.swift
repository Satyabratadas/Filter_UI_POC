//
//  CheckTwoHandleSlider.swift
//  Filter_UI_Dummy_SwiftUI
//
//  Created by Satyabrata Das on 09/02/24.
//

import SwiftUI

//struct SliderViewTest: View {
//    @State private var sliderLowValue: Double = 1000
//    @State private var sliderHighValue: Double = 4000
//
//    let range: ClosedRange<Double> = 0 ... 5000
//
//    var body: some View {
//        VStack {
//            CustomSlider(sliderLowValue: $sliderLowValue,
//                         sliderHighValue: $sliderHighValue,
//                         range: range)
//            
//            Spacer()
//        }
//        .padding()
//    }
//}

struct TwoRangeSliderView: View {
    @State private var sliderLowValue: Double = 0
    @State private var sliderHighValue: Double = 100
    
    let range: ClosedRange<Double> = 0 ... 100
    
    var body: some View {
        VStack {
            Text("Low: \(sliderLowValue, specifier: "%.2f")")
            Text("High: \(sliderHighValue, specifier: "%.2f")")
            CustomSliderView(range: range, sliderLowValue: $sliderLowValue, sliderHighValue: $sliderHighValue)
        }
        .padding()
    }
}

struct CustomSliderView: View {
    let range: ClosedRange<Double>
    @Binding var sliderLowValue: Double
    @Binding var sliderHighValue: Double
    
    var body: some View {
        HStack {
            Text("\(range.lowerBound, specifier: "%.2f")")
            Slider(value: $sliderLowValue, in: range)
                .background(SliderThumbView())
                .overlay(SliderTrackView(range: range, lowValue: $sliderLowValue, highValue: $sliderHighValue))
            Slider(value: $sliderHighValue, in: range)
                .background(SliderThumbView())
        }
    }
}

struct SliderThumbView: View {
    var body: some View {
        Circle()
            .foregroundColor(.blue)
            .frame(width: 20, height: 20)
    }
}

struct SliderTrackView: View {
    let range: ClosedRange<Double>
    @Binding var lowValue: Double
    @Binding var highValue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .foregroundColor(.blue)
            .frame(height: 4)
            .padding(.horizontal, 10)
            .overlay(
                GeometryReader { geometry in
                    let width = geometry.size.width
                    let minX = geometry.frame(in: .global).minX
                    let maxX = geometry.frame(in: .global).maxX
                    
                    let lowOffset = CGFloat((lowValue - range.lowerBound) / (range.upperBound - range.lowerBound)) * width
                    let highOffset = CGFloat((highValue - range.lowerBound) / (range.upperBound - range.lowerBound)) * width
                    
                    let start = min(lowOffset, highOffset)
                    let end = max(lowOffset, highOffset)
                    
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color.blue.opacity(0.3))
                        .frame(width: end - start)
                        .offset(x: start)
                }
            )
    }
}


#Preview {
    TwoRangeSliderView()
}
