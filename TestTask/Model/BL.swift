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
var mva: MostViewedArticles {get{}}
var favorites: [String] = ["Articl1","Articl2","Articl3","Articl4","Articl5","Articl6","Articl7","Articl8","Articl9","Articl10","Articl11","Articl12"]

var mostEmailed: [String] = ["Aaaaaa","Aaaaaaa","aaaaaaaaa","aaaaaaaa","Aaaaaaaa","aaaaaaa6"]

var mostShared: [String] = ["Aftghssfcl1","Asthsrtgbrtth2","Arsthtrl3","Artbhrttrhrt","Arsthr","rthrtrs6","Articl7","Arsthtrthrt","rthsrgtrtr","Atrshtrshtrft10","rthtrsth11","Arthrfshtrst"]

var mostViewed: [String] = ["111","2222","33333","44444","555555","6666","777777","8888888","9999","10","11","12","12","12","12","12","777777","777777","777777","777777","777777","777777","777777"]

func getMostEmailed(){

    AF.request("https://api.nytimes.com/svc/mostpopular/v2/emailed/30.json?api-key=1P0w450CnIPDkC0wapET8prY75GyrrRl").response { response in 
        debugPrint(response)
    }
                   }
        func getMostShared(){
           
            AF.request("https://api.nytimes.com/svc/mostpopular/v2/shared/1.json?api-key=1P0w450CnIPDkC0wapET8prY75GyrrRl").responseJSON {
                data in
                debugPrint(data)
            }}
                       
func getMostViewed(){
    
    let request = AF.request("https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=1P0w450CnIPDkC0wapET8prY75GyrrRl").validate()
   request.responseJSON{ response in
    let json = response.data!
     switch response.result {
                   case .success:
                      do {
                        let decoder = JSONDecoder()
                           mva = try decoder.decode(MostViewedArticles.self, from: json)
                        print("Description: \(mva.numResults)")
                          }
                         
                         catch DecodingError.dataCorrupted(let context) {
                                                print(DecodingError.dataCorrupted(context))
                                            } catch DecodingError.keyNotFound(let key, let context) {
                                                print(DecodingError.keyNotFound(key,context))
                                            } catch DecodingError.typeMismatch(let type, let context) {
                                                print(DecodingError.typeMismatch(type,context))
                                            } catch DecodingError.valueNotFound(let value, let context) {
                                                print(DecodingError.valueNotFound(value,context))
                                            } catch let error{
                                                print(error)
                                            }
                         

                   case .failure(let error):
                     print(error)
                     return
                   
                   }
    
    }
}

        
