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
    public var ImageUrl: String = ""
    public var Author:String = ""
    public var data: String = ""
    
    
    @IBOutlet weak var dataTime: UILabel!
    @IBOutlet weak var byAuthor: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var articleText: UILabel!
    @IBOutlet weak var title_detail: UILabel!
  
    @IBAction func addToFavourite(_ sender: Any) {
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title_detail.text = ItemName
        dataTime.text = data
        articleText.text = ContextOfArticle
        byAuthor.text = Author
        setImage (from: ImageUrl)
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
      // MARK: - set image
    func setImage(from url: String) {
            guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
            DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.image.image = image
            }
        }
    }

}
