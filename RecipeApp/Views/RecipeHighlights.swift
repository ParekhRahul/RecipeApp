//
//  RecipeHighlights.swift
//  RecipeApp
//
//  Created by Rahul Parekh on 2021-04-27.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(hightlights:[String]) {
        // loop through the highlights and build the string
        for index in 0..<hightlights.count{
            
            // if this is the last item, dont add comma
            if index == hightlights.count - 1{
                allHighlights += hightlights[index]
            }
            else
            {
                allHighlights += hightlights[index] + ", "
            }
            
        }
    }
    
    var body: some View {
        Text(allHighlights)
            //.font(Font.custom("Avenir", 15))
            
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(hightlights: ["test1","text2","text3"])
    }
}
