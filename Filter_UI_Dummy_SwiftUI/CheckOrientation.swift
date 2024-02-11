//
//  CheckOrientation.swift
//  Filter_UI_Dummy_SwiftUI
//
//  Created by Satyabrata Das on 01/02/24.
//

import SwiftUI

struct OrientationChangeView: View {
    
    @State var orientation = UIDeviceOrientation.portrait
    @State var frame: CGRect = .zero
    
    var body: some View {
        Group {
            if orientation.isPortrait {
                ZStack {
                    Color.green.ignoresSafeArea()
                    Text("Portrait \(frame.width),\(UIScreen.screenWidth)")
                        .frame(width: UIScreen.screenWidth/2, height: UIScreen.screenHeight/2)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.white)
                        .padding(50)
                }
            } else if orientation.isLandscape {
                ZStack {
                    Color.cyan.ignoresSafeArea()
                    Text("Landscape \(frame.width), \(UIScreen.screenWidth)")
                        .frame(width: UIScreen.screenWidth/2, height: UIScreen.screenHeight/2)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.white)
                        .padding(50)
                }
            } else if orientation.isFlat {
                ZStack {
                    Color.blue.ignoresSafeArea()
                        .frame(width: UIScreen.main.bounds.size.width/2, height: UIScreen.main.bounds.size.height/2)
                }
            }
            else {
                ZStack {
                    Color.yellow.ignoresSafeArea()
                        .frame(width: UIScreen.main.bounds.size.width/2, height: UIScreen.main.bounds.size.height/2)
                }
            }
        }
        .onChangeOrientation { newOrientation in
            orientation = newOrientation
            frame = UIScreen.main.bounds
            print(orientation.rawValue)
        }
    }
}

struct OrientationViewModifier: ViewModifier {
    
    let action: (UIDeviceOrientation) ->()
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification), perform: { _ in
                action(UIDevice.current.orientation)
            })
    }
}

extension View {
    func onChangeOrientation(perform action: @escaping(UIDeviceOrientation)->()) -> some View {
        self
            .modifier(OrientationViewModifier(action: action))
    }
}


//#Preview {
////    OrientationChangeView()
//}
