//
//  Common_UserInterface.swift
//  Filter_UI_Dummy_SwiftUI
//
//  Created by Satyabrata Das on 23/01/24.
//

import Foundation
import UIKit



func isCurrentDeviceIpad()-> Bool{
    
    return UIDevice.current.userInterfaceIdiom == .pad
    
}

func isLandscapeMode()-> Bool{
    
    if UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height {
        
        return true
        
    }else {
        
         return false
        
    }
}
