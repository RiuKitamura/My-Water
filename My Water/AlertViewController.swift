//
//  AlertViewController.swift
//  My Water
//
//  Created by M Habib Ali Akbar on 05/03/20.
//  Copyright © 2020 M Habib Ali Akbar. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    @IBOutlet weak var buttonOk: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonOk.layer.cornerRadius = 20
        buttonOk.layer.shadowColor = UIColor.gray.cgColor
        buttonOk.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        buttonOk.layer.shadowRadius = 12.0
        buttonOk.layer.shadowOpacity = 0.7

        // Do any additional setup after loading the view.
    }
    
    @IBAction func exit(_ sender: Any) {
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
