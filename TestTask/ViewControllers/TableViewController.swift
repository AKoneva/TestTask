//
//  TableViewController.swift
//  TestTask
//
//  Created by Macbook Pro on 10.08.2020.
//  Copyright © 2020 Macbook Pro. All rights reserved.
//

import UIKit


class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    //    getMostEmailed()
      //  getMostShared()
        getMostViewed()
        // Uncomment the following line to preserve selection between presentations
       // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tabBarController?.selectedIndex {
              case 0:
                return favorites.count
              case 1:
                return mostEmailed.count
              case 2:
                return mostShared.count
              case 3:
                
                return mva.numResults
                
              default:
                  return 5
              }
              
        
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        switch tabBarController?.selectedIndex {
        case 0:
             cell.textLabel?.text = favorites[indexPath.row]
             return cell
        case 1:
             cell.textLabel?.text = mostEmailed[indexPath.row]
             return cell
        case 2:
             cell.textLabel?.text = mostShared[indexPath.row]
             return cell
        case 3:
            cell.textLabel?.text = mostViewed[indexPath.row]
            return cell
        default:
            return cell
        }
        
    }
        
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        tableView.deselectRow(at: indexPath, animated: true)
  var currentItem = "Here is name!"
   
   switch tabBarController?.selectedIndex {
          case 0:
              currentItem = favorites[indexPath.row]
          case 1:
              currentItem = mostEmailed[indexPath.row]
          case 2:
              currentItem = mostShared[indexPath.row]
          case 3:
              currentItem = mostViewed[indexPath.row]
          default:
             currentItem = "Here is name of your articl!"
          }
          
     // Safe Push VC
     if let viewController = UIStoryboard(name: "Main", bundle: nil)
        .instantiateViewController(withIdentifier: "DetailVC") as? DetailViewController {
         viewController.ItemName =  currentItem
         
         if let navigator = navigationController {
             navigator.pushViewController(viewController, animated: true)
         }
     }
    
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

}
