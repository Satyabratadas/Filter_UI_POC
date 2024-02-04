//
//  FilterOptionsCell.swift
//  Filter_UI_Dummy_SwiftUI
//
//  Created by Satyabrata Das on 23/01/24.
//

import SwiftUI

struct FilterOptionsCell: View {
    @State private var selectedCategories: Set<String> = []
    @State private var isCategoryExpanded: Bool = false
     var title : String
    
//    let categories = ["Acrylic Clocks", "Acrylic Medals", "Banners", "Bookmarks",
//                         "Canvas Photo Frame", "Cap based Lid Water Bottles",
//                         "Carabiner Water Bottles", "Certificate", "Coasters",
//                      "Coffee Mugs", "Dangler", "Desk Calendars", "Envelope"]
    var options : [String]
    
    var body: some View {
        
            FilterDisclosureSection(title: title, isExpanded: $isCategoryExpanded, selections: $selectedCategories, options: options)
//                .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 19))
            .tint(.black)
    }
}

struct FilterDisclosureSection: View {
    var title: String
    @State private var expandedGroup: Int?
    @Binding var isExpanded: Bool
    @Binding var selections: Set<String>
    var options: [String]
    
    var body: some View {
            
            DisclosureGroup(title) {
                List{
                    ForEach(options, id: \.self) { option in
                        
                        MultipleSelectionRow(
                            title: option,
                            isSelected: selections.contains(option)
                        ) {
                            if selections.contains(option) {
                                selections.remove(option)
                            } else {
                                selections.insert(option)
                                
                            }
                        }
                        
                    }
                    .listRowSeparator(.hidden)
                    .padding(EdgeInsets(top: 0, leading: -8, bottom: 0, trailing: -8))
                }.frame(height: 150)
                .padding(EdgeInsets(top: 0, leading: -30, bottom: 0, trailing: 0))
                    
            }
        
    }
}

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        HStack {
            if isSelected {
                Image(systemName:  "checkmark.square"  )
                    .resizable()
                    .frame(width: 24, height: 24)
            }else{
                Image(systemName:  "square"  )
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            Text(title)
        }
        .contentShape(Rectangle())
        .onTapGesture(perform: action)
    }
}
//
#Preview {
    FilterOptionsCell(title: "category", options: ["category"])
}
