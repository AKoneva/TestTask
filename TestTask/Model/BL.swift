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
let favorites : [String] = ["Что ","за","херня","происходит","здесь","блять"]
 let decoder = JSONDecoder()
var mea = MostEmailedArticles(status: "", copyright: "", numResults: 0, results: nil)
var msa = MostSharedArticles(status: "", copyright: "", numResults: 0, results: nil)
var mva = MostViewedArticles(status: "", copyright: "", numResults: 0, results: nil)

func getMostEmailed(){

    AF.request("https://api.nytimes.com/svc/mostpopular/v2/emailed/30.json?api-key=1P0w450CnIPDkC0wapET8prY75GyrrRl").response { response in
       let json = response.data!
                         switch response.result {
                                       case .success:
                                          do {
                                           
                                            let mea_req: MostEmailedArticles = try decoder.decode(MostEmailedArticles.self, from: json)
                                            fillDataTheMostEmailedArticles(fix_mea: mea_req)
                                           
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
                                    let msa_req: MostSharedArticles = try decoder.decode(MostSharedArticles.self, from: json)
                                    fillDataTheMostSharedArticles(fix_msa: msa_req)
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
                        let mva: MostViewedArticles = try decoder.decode(MostViewedArticles.self, from: json)
                       fillDataTheMostViewedArticles(fix_mva: mva)
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
func fillDataTheMostEmailedArticles(fix_mea: MostEmailedArticles){
    mea = fix_mea
    
}
func fillDataTheMostSharedArticles(fix_msa: MostSharedArticles){
    msa = fix_msa
   
}
func fillDataTheMostViewedArticles(fix_mva: MostViewedArticles){
    mva = fix_mva
   
}

