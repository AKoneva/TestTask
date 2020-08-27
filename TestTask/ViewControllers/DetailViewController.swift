//
//  DetailViewController.swift
//  TestTask
//
//  Created by Macbook Pro on 07.08.2020.
//  Copyright © 2020 Macbook Pro. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
 
    public var ItemName :String = ""
   
  
    
    @IBOutlet weak var LableContent: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        LableContent.text = ItemName
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
