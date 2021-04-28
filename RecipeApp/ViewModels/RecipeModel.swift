//
//  RecipeModel.swift
//  RecipeApp
//
//  Created by Rahul Parekh on 2021-04-13.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    init() {
        self.recipes = DataServices.getLocalData()
    }
    
    static func getPortion( ingredient:Ingredients, recipeServings:Int, targerServings:Int ) -> String{
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortion = 0
        
        if ingredient.num != nil {
            
            // Get the single serving size by multiplying denomirator by target servings
            denominator *= recipeServings
            
            // Get target portion by multiplying numerator by target servings
            numerator *= targerServings
            
            // reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator,denominator)
            
            numerator /= divisor
            denominator /= divisor
            
            // Get the whole portion if the numerator Greater then denominator
            
            if numerator >= denominator{
                
               //Calculated whole portion
                wholePortion = numerator/denominator
                
                // Calculate the remainder
                numerator = numerator % denominator
                
                // Assign to portion String
                portion += String(wholePortion)
                
            }
            // Express the remainder as a fration
            
            if numerator > 0 {
                
                // Assign remainder as fration to the portion string
                portion += wholePortion > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
                
            }
            
            
        }
        
        if var unit = ingredient.unit{
            
            // if we need to pluralize
            if wholePortion > 1 {
                
                // Calculate appropriate suffix
                if unit.suffix(2) == "ch"{
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else{
                    unit += "s"
                }
                    
            }
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            return portion + unit
        }
        
        return portion
    }
    
    
}
