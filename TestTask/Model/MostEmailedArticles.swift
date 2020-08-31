// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:


import Foundation
import Alamofire

// MARK: - MostEmailedArticles
struct MostEmailedArticles: Codable {
    let status, copyright: String
    let numResults: Int
    let results: [_Result]

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults
        case results
    }
}


// MARK: - Result
struct _Result: Codable {
    let uri: String
    let url: String
    let id, assetID: Int?
    let source:String
    let publishedDate, updated, section, subsection: String?
    let nytdsection, adxKeywords: String?
    let column: Int?
    let byline: String
    let type: String
    let title, abstract: String
    let desFacet, orgFacet, perFacet, geoFacet: [String]?
    let media: [Media_]?
    let etaID: Int?

    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID
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
struct Media_: Codable {
    let type:String
    let subtype: String
    let caption, copyright: String
    let approvedForSyndication: Int?
    let mediaMetadata: [MediaMetadat]

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication
        case mediaMetadata
    }
}


// MARK: - MediaMetadatum
struct MediaMetadat: Codable {
    let url: String
    let format: String
    let height, width: Int
}



// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
