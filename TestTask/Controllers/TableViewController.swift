//
//  TableViewController.swift
//  TestTask
//
//  Created by Macbook Pro on 10.08.2020.
//  Copyright © 2020 Macbook Pro. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

   public let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
 
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFavoriteArticles()
    
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tabBarController?.selectedIndex {
              case 0:
                return favorites?.count ?? 0
           
              case 1:
                return mostEmailedArticles.count
              case 2:
                return mostSharedArticles.count
              case 3:
               return mostViewedArticles.count
                
              default:
                  return 5
              }
              
        
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        switch tabBarController?.selectedIndex {
        case 0:
            
             cell.textLabel?.text = favorites![indexPath.row].title
             cell.imageView?.image = UIImage(named: "favorite")
              
             return cell
        case 1:
            cell.textLabel?.text = mostEmailedArticles[indexPath.row].title
             cell.imageView?.image = UIImage(named: "emailed")
             return cell
        case 2:
             cell.textLabel?.text = mostSharedArticles[indexPath.row].title
             cell.imageView?.image = UIImage(named: "shared")
             return cell
        case 3:
            cell.textLabel?.text = mostViewedArticles[indexPath.row].title
            cell.imageView?.image = UIImage(named: "viewed")
            return cell
        default:
            return cell
        }
        
    }
        
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        tableView.deselectRow(at: indexPath, animated: true)
        var currentItem = ""
        var textOfArticl = ""
        var authorOfArticl = ""
        var datatime = ""
   switch tabBarController?.selectedIndex {
          case 0:
            currentItem = favorites![indexPath.row].title!
            textOfArticl = favorites![indexPath.row].abstract!
            authorOfArticl = favorites![indexPath.row].byline!
            datatime = favorites![indexPath.row].publishedDate ?? " "
       fetchFavoriteArticles()
          case 1:
              currentItem = mostEmailedArticles[indexPath.row].title
              textOfArticl = mostEmailedArticles[indexPath.row].abstract
              authorOfArticl = mostEmailedArticles[indexPath.row].byline
              datatime = mostEmailedArticles[indexPath.row].publishedDate ?? " "
    
          case 2:
              currentItem = mostSharedArticles[indexPath.row].title
              textOfArticl = mostSharedArticles[indexPath.row].abstract
              authorOfArticl = mostSharedArticles[indexPath.row].byline
              datatime = mostSharedArticles[indexPath.row].publishedDate ?? " "
    
          case 3:
              currentItem = mostViewedArticles[indexPath.row].title
              textOfArticl = mostViewedArticles[indexPath.row].abstract
              authorOfArticl = mostViewedArticles[indexPath.row].byline
              datatime = mostViewedArticles[indexPath.row].publishedDate ?? " "
          default: break
           
        }
          
      // MARK: -  Safe Push VC
     if let viewController = UIStoryboard(name: "Main", bundle: nil)
        .instantiateViewController(withIdentifier: "DetailVC") as? DetailViewController {
        viewController.ItemName =  currentItem
        viewController.ContextOfArticle = textOfArticl
        viewController.Author = authorOfArticl
        viewController.ImageUrl = "https://www.tadviser.ru/images/5/54/The_New_York_Times.png"
        viewController.data = datatime
         if let navigator = navigationController {
             navigator.pushViewController(viewController, animated: true)
         }
     }
       fetchFavoriteArticles()
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        switch tabBarController?.selectedIndex {
                    case 0:
                            return true
                    default:
                            return false
            
        }
        
    }
    

     // MARK: -  Edit favorite tab
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
         
    
                       let removeThisArticle = favorites![indexPath.row]
                       self.context.delete(removeThisArticle)
                       do{
                           try self.context.save()
                       }catch{}
                   fetchFavoriteArticles()
            tableView.reloadData()
                   }
                 
               }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
 public func fetchFavoriteArticles(){
      do{
          let request = FavoriteArticles.fetchRequest() as NSFetchRequest<FavoriteArticles>
          favorites = try context.fetch(request)
      }
      catch{
          
    }}
  
    
  

