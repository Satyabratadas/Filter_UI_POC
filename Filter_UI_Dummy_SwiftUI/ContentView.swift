//
//  ContentView.swift
//  Filter_UI_Dummy_SwiftUI
//
//  Created by Satyabrata Das on 22/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresentingDetailView = false
       
       var body: some View {
           VStack {
               Button(action: {
                   // Toggle the state variable to present or dismiss the detail view
                   self.isPresentingDetailView.toggle()
               }) {
                   Text("Show Detail")
               }
               
               .fullScreenCover(isPresented: $isPresentingDetailView) {
                   PresentFilterView()
                       }
               
           }
       }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
