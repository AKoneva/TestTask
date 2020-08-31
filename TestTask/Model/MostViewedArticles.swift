// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mostViewedArticles = try? newJSONDecoder().decode(MostViewedArticles.self, from: jsonData)

import Foundation

// MARK: - MostViewedArticles
 struct MostViewedArticles: Codable {
    let status :String
    let copyright: String
    let numResults: Int = 10
    let results: [Results]
    
    
}
 enum CodingKeys: String, CodingKey{
        case status
        case copyright
        case numResults
        case results
       
}

// MARK: - Result
struct Results: Codable  {
    let uri: String
    let url: String
    let id: Int
    let assetID: Int?
    let source: String
    let publishedDate: String?
    let updated: String
    let section: String
    let subsection: String
    let nytdsection: String
    let adxKeywords: String?
    let column: String?
    let byline: String
    let type: String
    let title: String
    let abstract: String
    let desFacet: [String]?
    let orgFacet: [String]?
    let perFacet: [String]?
    let geoFacet: [String]?
    let media: [Media]?
    let etaID: Int?

    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_ID"
        case source
        case publishedDate
        case updated, section, subsection, nytdsection
        case adxKeywords
        case column, byline, type, title, abstract
        case desFacet
        case orgFacet
        case perFacet
        case geoFacet
        case media
        case etaID
    }
}

// MARK: - Media
struct Media: Codable  {
    let type: String
    let subtype: String
    let caption, copyright: String
    let approvedForSyndication: Int?
    let mediaMetadata: [MediaMetadatum]?

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication
        case mediaMetadata
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String
    let format: String
    let height, width: Int
}

