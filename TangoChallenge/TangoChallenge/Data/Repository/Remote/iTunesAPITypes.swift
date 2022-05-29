//
//  iTunesAPITypes.swift
//  TangoChallenge
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-05-28.
//

import Foundation


public enum iTunesSearchError: Error {
    case emptyData
    case parsingData(Error?)
    case unknown(Error?)
}

public struct iTunesSearchResponse: Codable {
    let results: [iTunesSearchResult]
}

public struct iTunesSearchResult: Codable {
    public let artistId:            Int
    public let artistName:          String
    public let artistViewUrl:       URL?
    public let artworkUrl100:       URL?
    public let collectionType:      iTunesSearchResultCollectionType?
    public let collectionName:      String?
    public let collectionPrice:     Float?
    public let trackCount:          Int?
    public let releaseDate:         String?
    public let collectionViewUrl:   String?
    public let wrapperType: iTunesSearchResultType

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        artistId = try container.decode(Int.self, forKey: .artistId)
        artistName = try container.decode(String.self, forKey: .artistName)
        artistViewUrl = try container.decodeIfPresent(URL.self, forKey: .artistViewUrl) ?? nil
        artworkUrl100 = try container.decodeIfPresent(URL.self, forKey: .artworkUrl100) ?? nil
        wrapperType = try container.decode(iTunesSearchResultType.self, forKey: .wrapperType)
        collectionType = try container.decodeIfPresent(iTunesSearchResultCollectionType.self, forKey: .collectionType) ?? nil
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName) ?? nil
        collectionPrice = try container.decodeIfPresent(Float.self, forKey: .collectionPrice) ?? nil
        trackCount = try container.decodeIfPresent(Int.self, forKey: .trackCount) ?? nil
        releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate) ?? nil
        collectionViewUrl = try container.decodeIfPresent(String.self, forKey: .collectionViewUrl) ?? nil
    }
}

public enum iTunesSearchResultCollectionType: String, Codable {
    case album = "Album"
    case unknown
}

public enum iTunesSearchResultType: String, Codable {
    case track, collection, artist, unknown
}
