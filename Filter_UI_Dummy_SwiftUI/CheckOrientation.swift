//
//  CheckOrientation.swift
//  Filter_UI_Dummy_SwiftUI
//
//  Created by Satyabrata Das on 01/02/24.
//

import SwiftUI

struct CheckOrientation: View {
    @State private var landscapeOrientation = false
    
    var body: some View {
        GeometryReader { geometry in
                    VStack {
                        Text("Hello, World!")
                        
                        if landscapeOrientation {
                            HStack {
                                Text("This is landscape mode")
                            }
                            .padding(20)
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.2) // Adjust frame for landscape
                        } else {
                            HStack {
                                Text("This is portrait mode")
                            }
                            .padding(10)
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.1) // Adjust frame for portrait
                        }
                    }
                    .onAppear {
                        landscapeOrientation = geometry.size.width > geometry.size.height
                    }
                    .onChange(of: geometry.size) { oldValue, newValue in
                        landscapeOrientation = geometry.size.width > geometry.size.height
                    }
                }
    }
}

#Preview {
    CheckOrientation()
}
