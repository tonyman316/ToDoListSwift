//
//  DetailViewController.swift
//  ToDoListSwift
//
//  Created by Tony's Mac on 10/9/14.
//  Copyright (c) 2014 DeAnza. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTitleLbl: UILabel!
    @IBOutlet weak var detailSubtitleLbl: UILabel!
    @IBOutlet var detailContinentLbl: UILabel!
    
    var itemName : String?
    var subItemName : String?
    var itemImage : UIImage?
    var continent: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        if (itemName != nil){
            detailTitleLbl.text = itemName
        } else {
            detailTitleLbl.text = "Unknown"
        }
        
        if (subItemName != nil){
            detailSubtitleLbl.text = subItemName
        } else {
            detailSubtitleLbl.text = "Unknown"
        }
        
        if (continent != nil) {
            detailContinentLbl.text = continent
        } else {
            detailContinentLbl.text = "Unknown"
        }
        
        if (itemImage != nil){
            detailImageView.image = itemImage
        } else {
            detailImageView.image = UIImage(named: "Unknown")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func alert(sender: AnyObject) {
        
        //let todoitem = sender as ToDoItem
        //var populationValue = todoitem.population
        //var populationValue = "21311241"
        
        let detailViewAlert = UIAlertController(title: "Population", message: "Still working on it", preferredStyle: UIAlertControllerStyle.Alert)
        
        let okButton = UIAlertAction(title: "OK", style: .Default, handler: nil)
        detailViewAlert.addAction(okButton)
//        let cancelButton = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//        detailViewAlert.addAction(cancelButton)
        
        self.presentViewController(detailViewAlert, animated: true, completion: nil)
       
    }

}
