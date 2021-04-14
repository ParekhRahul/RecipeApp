//
//  DataServices.swift
//  RecipeApp
//
//  Created by Rahul Parekh on 2021-04-13.
//

import Foundation

class DataServices {
    
    static func getLocalData() -> [Recipe]{
        
        // Parse local json file
        // get a url path of json file
        
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // check if the pathstring is not nil
        
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // create url object
        
        let url = URL(fileURLWithPath: pathString!)
        
        do{
            // create a data object
            let data = try Data(contentsOf: url)
            
            // decode data with json decoder
            let decoder = JSONDecoder()
            
            do{
                let recipeData = try decoder.decode([Recipe].self, from: data)
                // add unique id's
                
                for r in recipeData{
                    r.id = UUID()
                    
                    // add unique id's to ingredients
                    for i in r.ingredients{
                        i.id = UUID()
                    }
                }
                
                // return recipe data
                return recipeData
            }
            catch{
                print(error)
            }
        }
        catch{
            print(error)
        }
        
        return [Recipe]()
        
        
        
    }
    
}
