//
//  BL.swift
//  TestTask
//
//  Created by Macbook Pro on 07.08.2020.
//  Copyright © 2020 Macbook Pro. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import CoreData

public let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
var favorites : [FavoriteArticles]?
 var mostEmailedArticles: [Articles] = []
 var mostSharedArticles: [Articles] = []
 var mostViewedArticles: [Articles] = []
 let decoder = JSONDecoder()

 // MARK: - getMostEmailed
func getMostEmailed(){
    Alamofire.request("https://api.nytimes.com/svc/mostpopular/v2/emailed/30.json?api-key=1P0w450CnIPDkC0wapET8prY75GyrrRl").responseJSON { response in
        let json = response.data!
        switch response.result {
        case .success:
         do {
            let request: requestAnswerArticles = try decoder.decode(requestAnswerArticles.self, from: json)
            for item in request.results! {
                       mostEmailedArticles.append(Articles(publishedDate: item.publishedDate ?? " ", byline: item.byline, title: item.title, abstract: item.abstract))
                    
                }
            
         }
           catch let error{
                               print(error)
                                                                   }
                                                                
        case .failure(let error):
            print(error)
            return
                                       
        }
    }
}
// MARK: - getMostShared
func getMostShared(){
      Alamofire.request("https://api.nytimes.com/svc/mostpopular/v2/shared/30.json?api-key=1P0w450CnIPDkC0wapET8prY75GyrrRl").responseJSON { response in
        let json = response.data!
        switch response.result {
         case .success:
             do {
                 let request: requestAnswerArticles = try decoder.decode(requestAnswerArticles.self, from: json)
                           for item in request.results! {
                                      mostSharedArticles.append(Articles(publishedDate: item.publishedDate ?? " ", byline: item.byline, title: item.title, abstract: item.abstract))
                                   
                               }                    } catch let error{
                               print(error)
                                                                   }
                                     
        case .failure(let error):
            print(error)
            return
        }
    }
}
// MARK: - getMostViewed()
func getMostViewed(){
   let request = Alamofire.request("https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json?api-key=1P0w450CnIPDkC0wapET8prY75GyrrRl").validate()
    request.responseJSON{ response in
        let json = response.data!
    switch response.result {
    case .success:
    do {
         let request: requestAnswerArticles = try decoder.decode(requestAnswerArticles.self, from: json)
                   for item in request.results! {
                    mostViewedArticles.append(Articles(publishedDate: item.publishedDate ?? " ", byline: item.byline, title: item.title, abstract: item.abstract))
                           
        }}
        catch let error{
        print(error)
                                            }
    case .failure(let error):
        print(error)
        return
                   
                   }
    
    }
}



