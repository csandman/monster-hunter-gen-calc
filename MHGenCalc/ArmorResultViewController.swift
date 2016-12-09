//
//  SecondViewController.swift
//  MHGenCalc
//
//  Created by Student on 11/17/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit
import CoreData

class ArmorResultViewController: UIViewController {
    
    var armorValue: String?
    
    

    @IBOutlet weak var armorLabel: UILabel!
   
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var iceLabel: UILabel!
    @IBOutlet weak var maxDefenseLabel: UILabel!
    
    @IBOutlet weak var thunderLabel: UILabel!
    @IBOutlet weak var dragonLabel: UILabel!
    
    @IBOutlet weak var waterLabel: UILabel!
    
    @IBOutlet weak var fireLabel: UILabel!
    
    @IBAction func addArmorToSet(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.addArmorPieceByName(self.armorValue!)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        armorLabel.text = armorValue
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Armor")
        do{
            let results = try! managedContext.fetch(fetchRequest)
            let armors = results as! [Armor]
            for armor in armors{
                if(armor.name == armorValue){
                        defenseLabel.text = "\(armor.defense!)"
                        maxDefenseLabel.text = "\(armor.max_defense!)"
                        iceLabel.text = "\(armor.ice_res!)"
                        thunderLabel.text = "\(armor.thunder_res!)"
                        dragonLabel.text = "\(armor.dragon_res!)"
                        waterLabel.text = "\(armor.water_res!)"
                        fireLabel.text = "\(armor.fire_res!)"

                }
            }
            
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
