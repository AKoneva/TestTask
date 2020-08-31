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

var favorites: [String] = ["Articl1","Articl2","Articl3","Articl4","Articl5","Articl6","Articl7","Articl8","Articl9","Articl10","Articl11","Articl12"]

var mostEmailed: [String] = ["Aaaaaa","Aaaaaaa","aaaaaaaaa","aaaaaaaa","Aaaaaaaa","aaaaaaa6"]

var mostShared: [String] = ["Aftghssfcl1","Asthsrtgbrtth2","Arsthtrl3","Artbhrttrhrt","Arsthr","rthrtrs6","Articl7","Arsthtrthrt","rthsrgtrtr","Atrshtrshtrft10","rthtrsth11","Arthrfshtrst"]

var mostViewed: [String] = ["kll","Arsthtrl3","Artbhrttrhrt","Arsthr","rthrtrs6","Articl7","Arsthtrthrt","rthsrgtrtr"]

func getMostEmailed(){

    AF.request("https://api.nytimes.com/svc/mostpopular/v2/emailed/30.json?api-key=1P0w450CnIPDkC0wapET8prY75GyrrRl").response { response in 
       let json = response.data!
                         switch response.result {
                                       case .success:
                                          do {
                                            let decoder = JSONDecoder()
                                            let mea: MostSharedArticles = try decoder.decode(MostSharedArticles.self, from: json)
                                            let mostEmailed = mea.results.count
                                            print("Description emailed: \(mostEmailed )")
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
        func getMostShared(){
           
            AF.request("https://api.nytimes.com/svc/mostpopular/v2/shared/1.json?api-key=1P0w450CnIPDkC0wapET8prY75GyrrRl").responseJSON { response in
                let json = response.data!
                 switch response.result {
                               case .success:
                                  do {
                                    let decoder = JSONDecoder()
                                    let msa: MostSharedArticles = try decoder.decode(MostSharedArticles.self, from: json)
                                    let mostShared = msa.results.count
                                    print("Description shared: \(mostShared )")
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
func getMostViewed(){
    
    let request = AF.request("https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=1P0w450CnIPDkC0wapET8prY75GyrrRl").validate()
   request.responseJSON{ response in
    let json = response.data!
     switch response.result {
                   case .success:
                      do {
                        let decoder = JSONDecoder()
                        let mva: MostViewedArticles = try decoder.decode(MostViewedArticles.self, from: json)
                        let mostViewed = mva.results.count
                        print("Description viewed: \(mostViewed)")
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

        
