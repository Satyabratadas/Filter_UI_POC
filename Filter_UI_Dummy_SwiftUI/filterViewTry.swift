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
                
            }else{
                FilterViewForIphone()
            }
    }
}


struct FilterViewForIphone: View {
    @State private var landscapeOrientation = false
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
        GeometryReader { geometry in
            let screenWidth = horizontalSizeClass == .compact ? geometry.size.height : geometry.size.width
            
            VStack {
                if landscapeOrientation{
                    FilterOptionListIphoneLandScape(screenWidth: screenWidth)
                    ApplyBtnViewIphoneLandScape()
                        
                    
                }else{
                    if geometry.size.width <= 320 {
                        Text("iPhone SE (1st generation)")
                        FilterOptionListIphone(screenWidth: 280)
                    } else if geometry.size.width <= 375 {
                        Text("iPhone SE (2nd generation), iPhone 8, 7, 6s, 6, iPhone XS, X, 11 Pro")
                        FilterOptionListIphone(screenWidth: 300)
                    } else if geometry.size.width <= 390 {
                        Text("iPhone 12, 12 Pro")
                        FilterOptionListIphone(screenWidth: 310)
                    } else if geometry.size.width <= 414 {
                        Text("iPhone 8 Plus, 7 Plus, 6s Plus, 6 Plus, iPhone XR, 11, iPhone XS Max, 11 Pro Max")
                        FilterOptionListIphone(screenWidth: 300)
                    } else if geometry.size.width <= 428 {
                        Text("iPhone 12 Pro Max")
                        FilterOptionListIphone(screenWidth: 310)
                    } else {
                        Text("Unknown iPhone model or future models")
                        FilterOptionListIphone(screenWidth: 350)
                    }
                    
                    ApplyBtnViewIphone()
                    
                    
                }
            }
            .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
            .onAppear {
                landscapeOrientation = geometry.size.width > geometry.size.height
            }
            .onChange(of: geometry.size) { oldValue, newValue in
                landscapeOrientation = geometry.size.width > geometry.size.height
            }
        }
        
    }
    func checkDifferentDevices(geometry: GeometryProxy){
        
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
                    .frame(width: UIScreen.screenWidth * 0.2,height: 40)
                    .foregroundColor(.white)
            }
            .background(Color.red)
            .cornerRadius(8)
            
            .padding(EdgeInsets(top: 2, leading: 470 , bottom: 10, trailing: 0))
        
    }
}

struct FilterOptionListIphone :View{
    
    @State private var minPrice: Double = 0
    @State private var maxPrice: Double = 5000
    @Environment(\.presentationMode) var presentationMode
    
    let categories = ["Acrylic Clocks", "Acrylic Medals", "Banners", "Bookmarks",
                             "Canvas Photo Frame", "Cap based Lid Water Bottles",
                             "Carabiner Water Bottles", "Certificate", "Coasters",
                          "Coffee Mugs", "Dangler", "Desk Calendars", "Envelope"]
    
    let sortBy = ["Price low to high","Price high to low","Added new to old","Added old to new","Alphabetical A-Z","Alphabetical Z-A"]
    
    let type = ["Rectangle","Circle","Triangle"]
    
    let color = ["Red","Green","Blue"]
    
    let size = ["Large","Medium","Small"]
    
    let screenWidth: CGFloat  //310
    init(screenWidth: CGFloat) {
        self.screenWidth = screenWidth
    }
    var body: some View {
        List{
            HStack{
                Text("FILTER")
                    .font(.title3)
                Spacer()
                Button(action: {
                    print("button pressed")
                    presentationMode.wrappedValue.dismiss()
                    
                }) {
                    Image(systemName: "xmark")
                        .resizable()
                        .colorInvert()
                        .frame(width: 10,height: 10)
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
            FilterOptionsCell(title: "CATEGORIES",options: categories)
                .listRowSeparator(.hidden)
            SliderViewRepresent(screenWidth: screenWidth)
                .padding(.leading, -10)
//            SliderViewRepresent()
            FilterOptionsCell(title: "SORT BY", options: sortBy)
                .listRowSeparator(.hidden)
            FilterOptionsCell(title: "Type", options: type)
                .listRowSeparator(.hidden)
            FilterOptionsCell(title: "Color", options: color)
                .listRowSeparator(.hidden)
            FilterOptionsCell(title: "Size", options: size)
                .listRowSeparator(.hidden)
        }
        .frame(width: UIScreen.screenWidth * 0.95)
        .accentColor(.black)
        .listStyle(InsetListStyle())
    }
}

struct FilterOptionListIphoneLandScape :View{
    
    @State private var minPrice: Double = 0
    @State private var maxPrice: Double = 5000
    @Environment(\.presentationMode) var presentationMode
    
    
    let categories = ["Acrylic Clocks", "Acrylic Medals", "Banners", "Bookmarks",
                             "Canvas Photo Frame", "Cap based Lid Water Bottles",
                             "Carabiner Water Bottles", "Certificate", "Coasters",
                          "Coffee Mugs", "Dangler", "Desk Calendars", "Envelope"]
    
    let sortBy = ["Price low to high","Price high to low","Added new to old","Added old to new","Alphabetical A-Z","Alphabetical Z-A"]
    
    let type = ["Rectangle","Circle","Triangle"]
    
    let color = ["Red","Green","Blue"]
    
    let size = ["Large","Medium","Small"]
    
    let screenWidth: CGFloat
    init(screenWidth: CGFloat) {
        self.screenWidth = screenWidth
    }
    var body: some View {
        List{
            HStack{
                Text("FILTER")
                    .font(.title3)
                Spacer()
                Button(action: {
                    print("button pressed")
                    presentationMode.wrappedValue.dismiss()
                    
                }) {
                    Image(systemName: "xmark")
                        .resizable()
                        .colorInvert()
                        .frame(width: 10,height: 10)
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
            FilterOptionsCell(title: "CATEGORIES",options: categories)
                .listRowSeparator(.hidden)
            SliderViewRepresent(screenWidth: screenWidth )
                .padding(.leading, -10)
//            SliderViewRepresent()
            FilterOptionsCell(title: "SORT BY", options: sortBy)
                .listRowSeparator(.hidden)
            FilterOptionsCell(title: "Type", options: type)
                .listRowSeparator(.hidden)
            FilterOptionsCell(title: "Color", options: color)
                .listRowSeparator(.hidden)
            FilterOptionsCell(title: "Size", options: size)
                .listRowSeparator(.hidden)
        }
        .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
        .accentColor(.black)
        .listStyle(InsetListStyle())
    }
}




#Preview {
    PresentFilterView()
}


