//
//  RecipeListView.swift
//  RecipeApp
//
//  Created by Rahul Parekh on 2021-04-13.
//

import SwiftUI

struct RecipeListView: View {
        @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        List(model.recipes){ r in
            
            HStack(spacing:20.0){
                Image(r.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment:.center)
                    .clipped()
                    .cornerRadius(5)
                Text(r.name)
                
            }
            
        }
        
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
