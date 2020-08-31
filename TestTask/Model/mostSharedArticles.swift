// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mostSharedArticls = try? newJSONDecoder().decode(MostSharedArticls.self, from: jsonData)

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseMostSharedArticls { response in
//     if let mostSharedArticls = response.result.value {
//       ...
//     }
//   }

import Foundation

// MARK: - MostSharedArticles
public struct MostSharedArticles {
    let status, copyright: String
    let numResults: Int
    let results: [Result]
}

// MARK: - Result
struct Result {
    let uri: String
    let url: String
    let id, assetID: Int
    let source: String
    let publishedDate, updated, section: String
    let subsection: String
    let nytdsection, adxKeywords: String
    let column: NSNull
    let byline: String
    let title, abstract: String
    let desFacet, orgFacet, perFacet, geoFacet: [String]
  
}



