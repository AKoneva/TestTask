//
//  DetailViewController.swift
//  TestTask
//
//  Created by Macbook Pro on 07.08.2020.
//  Copyright © 2020 Macbook Pro. All rights reserved.
//

import UIKit
import CoreData


class DetailViewController: UIViewController {
 //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  var isfavorite = false
    public var ItemName :String = ""
    public var ContextOfArticle:String = ""
    public var ImageUrl: String = ""
    public var Author:String = ""
    public var data: String = ""
    
    @IBOutlet weak var navigation_item: UINavigationItem!
    
    @IBOutlet weak var barButtonItem: UIBarButtonItem!
    @IBOutlet weak var dataTime: UILabel!
    @IBOutlet weak var byAuthor: UILabel!
    @IBOutlet weak var image_of_articl: UIImageView!
    @IBOutlet weak var articleText: UILabel!
 
    @IBOutlet weak var title_detail: UILabel!
  
  
    // MARK: - Add Button
    @IBAction func addToFavorite(_ sender: Any) {
        if !isfavorite{
            favoriteTrue()
        } else {
            favoriteFalse()
        }
    }
    
    
    func favoriteTrue(){
        isfavorite = true
       // var items =  self.navigation_item.rightBarButtonItem?
       // items = UIImage(systemName: "done")
       // var items = self.navigationController?.navigationBar.items
        var items = navigation_item.rightBarButtonItems
        items![0] = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector (DetailViewController.addToFavorite(_:)))
        let newFavorite = FavoriteArticles(context: context)
          newFavorite.title = title_detail.text
          newFavorite.publishedDate = dataTime.text
          newFavorite.abstract = articleText.text
          newFavorite.byline = byAuthor.text
            do{
                       try context.save()

                    }
             catch let error{
                print(error)
                  
        }
    }
    func favoriteFalse(){
        isfavorite = false
          let newFavorite = FavoriteArticles(context: context)
        
        do {
            context.delete(newFavorite)
           try  context.save()
        }
        catch let error{
        print(error)
        }
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
                self.image_of_articl.image = image
            }
        }
    }

}
