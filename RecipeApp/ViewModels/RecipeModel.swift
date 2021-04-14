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
}
