// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:


import Foundation
import Alamofire

// MARK: - MostSharedArticles
struct requestAnswerArticles: Codable {
    let status: String
    let copyright: String
    let numResults: Int?
    let results: [results]?

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults
        case results
    }
}

// MARK: - Result
struct results: Codable {
    let uri: String
    let url: String
    let id, assetID: Int?
    let source: String
    let publishedDate, updated, section, subsection: String?
    let nytdsection, adxKeywords: String?
    let column: Int?
    let byline: String
    let type: String
    let title, abstract: String
    let desFacet, orgFacet, perFacet, geoFacet: [String]?
    let media: [Medio]?
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
struct Medio: Codable {
    let type: String
    let subtype: String
    let caption, copyright: String
    let approvedForSyndication: Int?
    let mediaMetadata: [MediaMetadatu]?

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication
        case mediaMetadata
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatu: Codable {
    let url: String
    let format: String
    let height, width: Int
}


// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

