//
//  ViewController.swift
//  My Water
//
//  Created by M Habib Ali Akbar on 05/03/20.
//  Copyright © 2020 M Habib Ali Akbar. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myViewTarget: UIView!
    @IBOutlet weak var myViewIntakeTarget: UIView!
    @IBOutlet weak var buttonDrink: UIButton!
    @IBOutlet weak var labelIntake: UILabel!
    @IBOutlet weak var labelTarget: UILabel!
    @IBOutlet weak var labelIntakeTarget: UILabel!
    
    var targetInput = Int()
    var intakeInput = Int()
    var intake = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiBuild()
        
        targetInput = 2000
        intakeInput = 225
        intake = 0
        
        getData()
        
        labelIntake.text = "\(intake)"
        labelTarget.text = "\(targetInput)ml"
        labelIntakeTarget.text = "\(intakeInput)ml"
        buttonDrink.setTitle("Drink \(intakeInput)ml", for: .normal)
        
    }
    @IBAction func buttonPlusTarget(_ sender: Any) {
        if targetInput < 3000 {
            targetInput += 500
            labelTarget.text = "\(targetInput)ml"
            //            saveData()
        }
    }
    @IBAction func buttonMinusTarget(_ sender: Any) {
        if targetInput > 1000 {
            targetInput -= 500
            labelTarget.text = "\(targetInput)ml"
            //            saveData()
        }
        
    }
    @IBAction func buttonPlusIntakeTarget(_ sender: Any) {
        if intakeInput < 600 {
            intakeInput += 75
            labelIntakeTarget.text = "\(intakeInput)ml"
            buttonDrink.setTitle("Drink \(intakeInput)ml", for: .normal)
            //            saveData()
        }
    }
    
    @IBAction func buttonMinusIntakeTarget(_ sender: Any) {
        if intakeInput > 75 {
            intakeInput -= 75
            labelIntakeTarget.text = "\(intakeInput)ml"
            buttonDrink.setTitle("Drink \(intakeInput)ml", for: .normal)
            //            saveData()
        }
    }
    
    @IBAction func buttonDrink(_ sender: Any) {
        intake += intakeInput
        
        if intake > targetInput {
            intake = targetInput
        }
        
        labelIntake.text = "\(intake)"
        
        if intake == targetInput {
            intake = 0
            saveData()
            labelIntake.text = "\(intake)"
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let myAlert = storyBoard.instantiateViewController(withIdentifier: "alert")
            myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(myAlert, animated: true, completion: nil)
        } else {
            saveData()
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let myAlert = storyBoard.instantiateViewController(identifier: "alertDrink")
            myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(myAlert, animated: true, completion: nil)
        }
        
        
        
    }
    
    func uiBuild() {
        myView.layer.cornerRadius = 20
        myView.layer.shadowColor = UIColor.gray.cgColor
        myView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        myView.layer.shadowRadius = 12.0
        myView.layer.shadowOpacity = 0.7
        
        myViewTarget.layer.cornerRadius = 20
        myViewTarget.layer.shadowColor = UIColor.gray.cgColor
        myViewTarget.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        myViewTarget.layer.shadowRadius = 12.0
        myViewTarget.layer.shadowOpacity = 0.5
        
        myViewIntakeTarget.layer.cornerRadius = 20
        myViewIntakeTarget.layer.shadowColor = UIColor.gray.cgColor
        myViewIntakeTarget.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        myViewIntakeTarget.layer.shadowRadius = 12.0
        myViewIntakeTarget.layer.shadowOpacity = 0.5
        
        buttonDrink.layer.cornerRadius = 20
        buttonDrink.layer.shadowColor = UIColor.gray.cgColor
        buttonDrink.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        buttonDrink.layer.shadowRadius = 12.0
        buttonDrink.layer.shadowOpacity = 0.7
        
    }
    
    func saveData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context)
        let newEntity = NSManagedObject(entity: entity!, insertInto: context)
        
        newEntity.setValue(targetInput, forKey: "target")
        newEntity.setValue(intakeInput, forKey: "intake_input")
        newEntity.setValue(intake, forKey: "intake")
        
        do {
            try context.save()
            print("saved")
        } catch {
            print("failed saving")
        }
        
    }
    
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                targetInput = data.value(forKey: "target") as! Int
                intakeInput = data.value(forKey: "intake_input") as! Int
                intake = data.value(forKey: "intake") as! Int
                
                print("target input \(targetInput) intake input\(intakeInput) intake\(intake)")
            }
        } catch {
            print("Failed")
        }
    }
    
    
    
    
    
    
}

