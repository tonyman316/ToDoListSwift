// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

str.lowercaseString

var listArray = ["A", "B", "C", 123]
var oldListArray: NSMutableArray
oldListArray = ["A", 124]

println(listArray.self)
listArray

enum CardinalPoint {
    case North
    case South
    case East
    case West
}

func headTo(direction: CardinalPoint) {
    switch direction {
    case .North: println("I am heading North")
    case .South: println("I am heading South")
    case .West: println("I am heading West")
    case .East: println("I am heading East")
    }
}

headTo(.North)
headTo(.West)

class ToDoItem {
    
    var listItems = ["United States", "Brazil", "England", "France", "Germany", "Portugal", "Switzerland"]
    var listPictures = ["United_States.jpg", "Brazil.jpg", "England.jpg", "France.jpg", "Germany.jpg", "Portugal.jpg", "Switzerland.jpg"]
    var capitalCities = ["Washington", "Brasília", "London", "Paris", "Berlin", "Lisbon", "Bern"]
    var itemChecked = Array(count: 7, repeatedValue: false)
    
    
}

var item1 = ToDoItem()

class ToDoItem2 {

    var listItems:String
    var listPictures:String
    var capitalCities:String
    var itemChecked:Bool
    
    init(listItems: String, listPictures:String, capitalCities:String, itemChecked:Bool){
        self.listItems = listItems
        self.listPictures = listPictures
        self.capitalCities = capitalCities
        self.itemChecked = itemChecked
    }

}
var item2 = ToDoItem2(listItems:"United States" , listPictures: "United States.jpg", capitalCities: "Washington", itemChecked: false)















