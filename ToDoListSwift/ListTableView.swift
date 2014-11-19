//
//  ListTableView.swift
//  ToDoListSwift
//
//  Created by Tony's Mac on 10/1/14.
//  Copyright (c) 2014 DeAnza. All rights reserved.
//

import Foundation
import UIKit

class ListTableView: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    var listArray = [ToDoItem]()
    var filteredItems = [ToDoItem]()
    let identifier = "Cell2"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createInitalItems()
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "1star0.png"))
        
        tableView.reloadData()
        
        tableView.registerNib(UINib(nibName:"CustomTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
        searchDisplayController!.searchResultsTableView.registerNib(UINib(nibName:"CustomTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return filteredItems.count
        }else{
            return listArray.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var item : ToDoItem
        let identifier = "Cell2"
        var cell: CustomTableViewCell! = tableView.dequeueReusableCellWithIdentifier(identifier) as? CustomTableViewCell
        if cell == nil {
            tableView.registerNib(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? CustomTableViewCell
        }
        
        if tableView == self.searchDisplayController!.searchResultsTableView {
            item = filteredItems[indexPath.row]
            
            cell.customTitleLabel.text = item.listItems
            cell.customSubtitleLabel.text = item.capitalCities
            cell.customImageView.image = UIImage(named: item.listPictures)
            
        }else {
            item = listArray[indexPath.row]

            cell.customTitleLabel!.text = item.listItems
            cell.customSubtitleLabel!.text = item.capitalCities
            cell.customImageView!.image = UIImage(named: item.listPictures)
        }
        
        // cell color
            cell.backgroundColor = UIColor.clearColor()
            cell.customTitleLabel.textColor = UIColor.blackColor()
            cell.customSubtitleLabel.textColor = UIColor.blackColor()
        
        //  Fix incorrect checkmark
        if item.itemChecked == true {
            cell?.accessoryType = .Checkmark
        }else{
            cell?.accessoryType = .DisclosureIndicator
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var myCell = tableView.cellForRowAtIndexPath(indexPath) as? CustomTableViewCell
        var tappedItem: ToDoItem = listArray[indexPath.row]
        
        if tableView == self.tableView {
            
            if tappedItem.itemChecked == true {
                tappedItem.itemChecked = false
                myCell?.accessoryType = .DisclosureIndicator
                
            } else {
                tappedItem.itemChecked = true
                myCell?.accessoryType = .Checkmark
            }
            
            performSegueWithIdentifier("showDetail", sender: listArray[indexPath.row])
            
        } else {
            performSegueWithIdentifier("showDetail", sender: filteredItems[indexPath.row])
        }
    
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        listArray.removeAtIndex(indexPath.row)
        
        tableView.deleteRowsAtIndexPaths(NSArray(object:indexPath), withRowAnimation: UITableViewRowAnimation.Fade)
        tableView.endUpdates()
    }
    
    func filterContentForSearchText(searchText: String!, scope: String = "All") {
        filteredItems = listArray.filter({( item : ToDoItem) -> Bool in
            var categoryMatch = (scope == "All")
            var listItemsToLowercase = item.listItems.lowercaseString   // database to lowercase
            var stringMatch = listItemsToLowercase.rangeOfString(searchText.lowercaseString)    // user input to lowercase (lowercase compare lowercase)
//            if stringMatch == nil
//            {
//                stringMatch = listItemsToLowercase.rangeOfString(searchText.uppercaseString)
//                
//                    if stringMatch == nil
//                    {
//                        stringMatch = listItemsToLowercase.rangeOfString(searchText.lowercaseString)
//                    }
//            }
            
            return categoryMatch && (stringMatch != nil)
        })
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        let scopes = self.searchDisplayController!.searchBar.scopeButtonTitles as [String]
        let selectedScope = scopes[self.searchDisplayController!.searchBar.selectedScopeButtonIndex] as String
        filterContentForSearchText(searchString, scope: selectedScope)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController!,
        shouldReloadTableForSearchScope searchOption: Int) -> Bool {
            let scope = self.searchDisplayController!.searchBar.scopeButtonTitles as [String]
            filterContentForSearchText(self.searchDisplayController!.searchBar.text, scope: scope[searchOption])
            return true
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if (segue.identifier == "showDetail") {
            
            var detailView = segue.destinationViewController as DetailViewController
            let todoitem = sender as ToDoItem
            detailView.title = todoitem.listItems
            detailView.itemName = todoitem.listItems
            detailView.subItemName = "Capital City: \(todoitem.capitalCities)"
            detailView.itemImage = UIImage(named: todoitem.listPictures)
            detailView.continent = todoitem.continent
        }
    }
    
    func createInitalItems (){
        var item0 = ToDoItem(listItems: "United States" , listPictures: "United_States.jpg", capitalCities: "Washington", continent: "North America", population: "322,583,006")
        var item1 = ToDoItem(listItems: "Brazil" , listPictures: "Brazil.jpg", capitalCities: "Brasília", continent: "South America", population: "202,033,670")
        var item2 = ToDoItem(listItems: "United Kingdom" , listPictures: "United_Kingdom.jpg", capitalCities: "London", continent: "Europe", population: "63,489,234")
        var item3 = ToDoItem(listItems: "France" , listPictures: "France.jpg", capitalCities: "Paris", continent: "Europe", population: "64,641,279")
        var item4 = ToDoItem(listItems: "Germany" , listPictures: "Germany.jpg", capitalCities: "Berlin", continent: "Europe", population: "82,652,256")
        var item5 = ToDoItem(listItems: "Portugal" , listPictures: "Portugal.jpg", capitalCities: "Lisbon", continent: "Europe", population: "10,610,304")
        var item6 = ToDoItem(listItems: "Switzerland" , listPictures: "Switzerland.jpg", capitalCities: "Bern", continent: "Europe", population: "8,157,896")
        var item7 = ToDoItem(listItems: "Japan" , listPictures: "Japan.jpg", capitalCities: "Tokyo", continent: "Asia", population: "126,999,808")
        var item8 = ToDoItem(listItems: "New Zealand" , listPictures: "New_Zealand.jpg", capitalCities: "Wellington", continent: "Australia", population: "23,630,169")
        var item9 = ToDoItem(listItems: "South Korea" , listPictures: "South_Korea.jpg", capitalCities: "Seoul", continent: "Asia", population: "49,512,026")
        
        listArray.append(item0)
        listArray.append(item1)
        listArray.append(item2)
        listArray.append(item3)
        listArray.append(item4)
        listArray.append(item5)
        listArray.append(item6)
        listArray.append(item7)
        listArray.append(item8)
        listArray.append(item9)

    }
    
    
}

















