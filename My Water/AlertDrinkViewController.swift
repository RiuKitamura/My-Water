//
//  AlertDrinkViewController.swift
//  My Water
//
//  Created by M Habib Ali Akbar on 06/03/20.
//  Copyright © 2020 M Habib Ali Akbar. All rights reserved.
//

import UIKit

class AlertDrinkViewController: UIViewController {

    @IBOutlet weak var buttonOk: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        buttonOk.layer.cornerRadius = 20
        buttonOk.layer.shadowColor = UIColor.gray.cgColor
        

        // Do any additional setup after loading the view.
    }
    @IBAction func buttonOk(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
