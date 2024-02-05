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
                FilterOptionListIphoneLandScape()
                ApplyBtnViewIphoneLandScape()
                
            }else{
                FilterViewForIphone()
            }
    }
}


struct FilterViewForIphone: View {
    @State private var landscapeOrientation = false
    @State private var sizeChanged = false
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if geometry.size.width > geometry.size.height{
                    FilterOptionListIphoneLandScape()
                    ApplyBtnViewIphoneLandScape()
                }else{
                    
                    FilterOptionListIphone()
                    ApplyBtnViewIphone()
                }
            }
            .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
        }
        
    }
    
}

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
    @State private var listWidth: CGFloat = 0
    
    let categories = ["Acrylic Clocks", "Acrylic Medals", "Banners", "Bookmarks",
                             "Canvas Photo Frame", "Cap based Lid Water Bottles",
                             "Carabiner Water Bottles", "Certificate", "Coasters",
                          "Coffee Mugs", "Dangler", "Desk Calendars", "Envelope"]
    
    let sortBy = ["Price low to high","Price high to low","Added new to old","Added old to new","Alphabetical A-Z","Alphabetical Z-A"]
    
    let type = ["Rectangle","Circle","Triangle"]
    
    let color = ["Red","Green","Blue"]
    
    let size = ["Large","Medium","Small"] 
   
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
            .background(
                GeometryReader { geometry in
                    Color.clear
                        .preference(key: ListWidthPreferenceKey.self, value: geometry.size.width)
                }
                    .onPreferenceChange(ListWidthPreferenceKey.self) { listWidth in
                        self.listWidth = listWidth
                    }
            )
            FilterOptionsCell(title: "CATEGORIES",options: categories)
                .listRowSeparator(.hidden)
            SliderViewRepresent(screenWidth: listWidth - 20)
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
    
    @Environment(\.presentationMode) var presentationMode
    @State private var listWidth: CGFloat = 0
    
    
    let categories = ["Acrylic Clocks", "Acrylic Medals", "Banners", "Bookmarks",
                             "Canvas Photo Frame", "Cap based Lid Water Bottles",
                             "Carabiner Water Bottles", "Certificate", "Coasters",
                          "Coffee Mugs", "Dangler", "Desk Calendars", "Envelope"]
    
    let sortBy = ["Price low to high","Price high to low","Added new to old","Added old to new","Alphabetical A-Z","Alphabetical Z-A"]
    
    let type = ["Rectangle","Circle","Triangle"]
    
    let color = ["Red","Green","Blue"]
    
    let size = ["Large","Medium","Small"]
 
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
            .background(
                GeometryReader { geometry in
                    Color.clear
                        .preference(key: ListWidthPreferenceKey.self, value: geometry.size.width)
                }
                    .onPreferenceChange(ListWidthPreferenceKey.self) { listWidth in
                        self.listWidth = listWidth
                    }
            )
            FilterOptionsCell(title: "CATEGORIES",options: categories)
                .listRowSeparator(.hidden)
            SliderViewRepresent(screenWidth: listWidth - 20)
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
        .accentColor(.black)
        .listStyle(InsetListStyle())
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


