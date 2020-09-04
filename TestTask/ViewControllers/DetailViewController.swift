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
    public var ContextOfArticle:String = ""
    public var ImageUrl: String = "https://cdn.shopify.com/s/files/1/0533/2089/files/placeholder-images-image_large.png?format=jpg&qu"
    public var Author:String = ""
    @IBOutlet weak var byAuthor: UILabel!
    @IBOutlet weak var ImageOfArticle: UIImageView!
    
    @IBOutlet weak var articleText: UILabel!
    @IBOutlet weak var title_detail: UILabel!
    @IBAction func saveToFavourite(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title_detail.text = ItemName
        articleText.text = ContextOfArticle
        byAuthor.text = Author
       
       let url = URL(string: "https://cdn.shopify.com/s/files/1/0533/2089/files/placeholder-images-image_large.png?format=jpg&quality=90&v=1530129081")
        if let data = try? Data(contentsOf: url!)
       {
           ImageOfArticle.image = UIImage(data: data)
       }
       else {
        print("Couldnt dowload image")
        }
            }
       
        


}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

