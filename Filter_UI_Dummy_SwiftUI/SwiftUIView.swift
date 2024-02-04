//
//  SwiftUIView.swift
//  Filter_UI_Dummy_SwiftUI
//
//  Created by Satyabrata Das on 23/01/24.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var lowerValue: Double = 0.0
        @State private var upperValue: Double = 5000
        let totalRange: ClosedRange<Double> = 0.0...5000

        var body: some View {
            VStack {
                Text("Range: \(Int(lowerValue)) - \(Int(upperValue))")

                RangeSlider(
                    lowerValue: $lowerValue,
                    upperValue: $upperValue,
                    bounds: totalRange
                )
                .padding()
            }
        }
}

struct RangeSlider: View {
    @Binding var lowerValue: Double
    @Binding var upperValue: Double
    let bounds: ClosedRange<Double>

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Slider(value: $lowerValue, in: bounds)
                    .onChange(of: lowerValue) { newValue in
                        if newValue == upperValue {
                            lowerValue = min(newValue, upperValue)
                        }
                    }
                    .frame(width: geometry.size.width / 2)

                Slider(value: $upperValue, in: bounds)
                    .onChange(of: upperValue) { newValue in
                        if newValue == lowerValue {
                            upperValue = max(newValue, lowerValue)
                        }
                    }
                    .frame(width: geometry.size.width / 2)
            }
        }
    }
}


#Preview {
    SwiftUIView()
}
