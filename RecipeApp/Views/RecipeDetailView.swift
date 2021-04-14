//
//  RecipeDetailView.swift
//  RecipeApp
//
//  Created by Rahul Parekh on 2021-04-13.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView{
            
            VStack(alignment: .leading){
                
                //MARK: Recipe Image
                
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    
                //MARK: Ingredients
                
                VStack(alignment:.leading){
                    
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top],5)
                    
                    ForEach(recipe.ingredients){ item in
                        Text(item.name)
                    }
                    .padding(.horizontal)
                }
                
                //MARK: Divider
                Divider()
                
                //MARK: Directions
                
                VStack(alignment:.leading){
                    
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top],5)
                    
                    ForEach(0..<recipe.directions.count, id:\.self){index in
                        
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding(.bottom,5)
                            .font(.body)
                        
                    }
                    .padding(.horizontal)
                    
                    
                    
                    
                }
                
                
            }
            
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}