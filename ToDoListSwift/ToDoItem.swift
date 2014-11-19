//
//  ToDoItem.swift
//  ToDoListSwift
//
//  Created by Tony's Mac on 11/4/14.
//  Copyright (c) 2014 DeAnza. All rights reserved.
//

import UIKit

class ToDoItem {
   
    var listItems:String
    var listPictures:String
    var capitalCities:String
    var continent:String
    var population:String
    var itemChecked:Bool = false
    
    init(listItems: String, listPictures:String, capitalCities:String, continent: String, population: String ){
        self.listItems = listItems
        self.listPictures = listPictures
        self.capitalCities = capitalCities
        self.continent = continent
        self.population = population
    }
}
