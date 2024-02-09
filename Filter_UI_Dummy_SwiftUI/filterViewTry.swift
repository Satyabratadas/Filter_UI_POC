//
//  filterViewTry.swift
//  Filter_UI_Dummy_SwiftUI
//
//  Created by Satyabrata Das on 22/01/24.
//

import SwiftUI
import UIKit

struct PresentFilterView: View {
 
    var body: some View {
            if isCurrentDeviceIpad(){
//                FilterOptionListIphoneLandScape()
//                ApplyBtnViewIphoneLandScape()
                
            }else{
                FilterViewForIphone()
            }
    }
}


struct FilterViewForIphone: View {
    
    var body: some View{
        FilterOptionListIphone()
        }
        
    }
//    @State private var landscapeOrientation = false
//    @State private var sizeChanged = false
//    var body: some View {
//        GeometryReader { geometry in
//            VStack {
//                if geometry.size.width > geometry.size.height{
//                    FilterOptionListIphone()
//                    ApplyBtnViewIphoneLandScape()
//                }else{
//                    
//                    FilterOptionListIphone()
//                    ApplyBtnViewIphone()
//                }
//            }
//            .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
//        }
//        
//    }
    


struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct ApplyBtnViewIphone: View {
    var body: some View {
       
            Button {
                print("apply")
                
            }label: {
                Text("Apply")
                    .frame(width: UIScreen.screenWidth * 0.9,height: 40)
                    .foregroundColor(.white)
            }
            .background(Color.red)
            .cornerRadius(8)
            .padding(EdgeInsets(top: 2, leading: 5, bottom: 10, trailing: 5))
        
    }
}

struct ApplyBtnViewIphoneLandScape: View {
    var body: some View {
       
            Button {
                print("apply")
                
            }label: {
                Text("Apply")
                    .frame(width: UIScreen.screenWidth * 0.23,height: 40)
                    .foregroundColor(.white)
            }
            .background(Color.red)
            .cornerRadius(8)
            
            .padding(EdgeInsets(top: 2, leading: 470 , bottom: 10, trailing: 0))
        
    }
}

struct FilterOptionListIphone :View{
    
    @Environment(\.presentationMode) var presentationMode
    
    let categories = ["Acrylic Clocks", "Acrylic Medals", "Banners", "Bookmarks",
                             "Canvas Photo Frame", "Cap based Lid Water Bottles",
                             "Carabiner Water Bottles", "Certificate", "Coasters",
                          "Coffee Mugs", "Dangler", "Desk Calendars", "Envelope"]
    
    let sortBy = ["Price low to high","Price high to low","Added new to old","Added old to new","Alphabetical A-Z","Alphabetical Z-A"]
    
    let type = ["Rectangle","Circle","Triangle"]
    
    let color = ["Red","Green","Blue"]
    
    let size = ["Large","Medium","Small"] 
    @State private var screenWidth: CGFloat = 0
    @State var orientation = UIDeviceOrientation.portrait
    @State var frame: CGRect = .zero
   
    var body: some View {
        GeometryReader{ geometry in
            let listWidth = geometry.size.width * 0.95 // Calculate list width
            
            List {
                FilterOptionsCell(title: "CATEGORIES", options: categories)
                    .listRowSeparator(.hidden)
                
                SliderViewRepresent(screenWidth: listWidth - 70) // Pass screenWidth as screenWidth
                    .padding(.leading, -10)
                
                FilterOptionsCell(title: "SORT BY", options: sortBy)
                    .listRowSeparator(.hidden)
                
                FilterOptionsCell(title: "Type", options: type)
                    .listRowSeparator(.hidden)
                
                FilterOptionsCell(title: "Color", options: color)
                    .listRowSeparator(.hidden)
                
                FilterOptionsCell(title: "Size", options: size)
                    .listRowSeparator(.hidden)
            }
            .padding(5)
            .onAppear {
                screenWidth = listWidth // Set initial screenWidth
            }
            .onChange(of: geometry.size) { _ in
                screenWidth = geometry.size.width * 0.95 // Update screenWidth on orientation change
            }
            
            .frame(width: listWidth)
            .accentColor(.black)
            .listStyle(InsetListStyle())
        }
//        List{
//            FilterOptionsCell(title: "CATEGORIES", options: categories)
//                .listRowSeparator(.hidden)
//            SliderViewRepresent(screenWidth: 300)
//                .padding(.leading,-10)
//            FilterOptionsCell(title: "SORT BY", options: sortBy)
//                .listRowSeparator(.hidden)
//            
//            FilterOptionsCell(title: "Type", options: type)
//                .listRowSeparator(.hidden)
//            
//            FilterOptionsCell(title: "Color", options: color)
//                .listRowSeparator(.hidden)
//            
//            FilterOptionsCell(title: "Size", options: size)
//                .listRowSeparator(.hidden)
//            
//        }.onChangeOrientation { newOrientation in
//            orientation = newOrientation
//            frame = UIScreen.main.bounds
//            print(orientation.rawValue)
//        }
       
//                    let listWidth = geometry.size.width * 0.95 // Calculate list width
                    
//                    List {
//                        FilterOptionsCell(title: "CATEGORIES", options: categories)
//                            .listRowSeparator(.hidden)
//                        
//                        SliderViewRepresent(screenWidth: listWidth - 50) // Pass screenWidth as screenWidth
//                            .padding(.leading, -10)
//                        
//                        FilterOptionsCell(title: "SORT BY", options: sortBy)
//                            .listRowSeparator(.hidden)
//                        
//                        FilterOptionsCell(title: "Type", options: type)
//                            .listRowSeparator(.hidden)
//                        
//                        FilterOptionsCell(title: "Color", options: color)
//                            .listRowSeparator(.hidden)
//                        
//                        FilterOptionsCell(title: "Size", options: size)
//                            .listRowSeparator(.hidden)
//                    }
//                    .padding(5)
//                    .onAppear {
//                        screenWidth = listWidth // Set initial screenWidth
//                    }
//                    .onChange(of: geometry.size) { _ in
//                        screenWidth = geometry.size.width * 0.95 // Update screenWidth on orientation change
//                    }
                    
//                    .frame(width: listWidth)
//                    .accentColor(.black)
//                    .listStyle(InsetListStyle())
                
        
    }
}
struct ListWidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}




#Preview {
    PresentFilterView()
}


