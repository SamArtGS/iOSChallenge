//
//  APIEndPoints.swift
//  TangoChallenge
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-05-28.
//

import Foundation

protocol APIEndPoint{
    var host    : String      { get }
    var session : URLSession  { get }
    var decoder : JSONDecoder { get }
}

public final class iTunesAPI: APIEndPoint{
    
    var host: String = AppConfiguration.baseURL
    var session: URLSession = URLSession.shared
    var decoder: JSONDecoder = JSONDecoder()
    
    
    @discardableResult
    public func getResults(searchTerm: String,
                           parameters: [String: String]?,
                           completion: @escaping (Result<[iTunesSearchResult],
                                                          iTunesSearchError>) -> Void)
        -> URLSessionTask? {
        guard let url = buildSearchURL(searchTerm: searchTerm, parameters: parameters) else { return nil }
            
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }

            let result = self.parseResponse(data: data, response: response, error: error)
            DispatchQueue.main.async {
                completion(result)
            }
        }
        task.resume()
        return task
    }
    
    @discardableResult
    public func lookup(id: Int,
                       parameters: [String: String]?,
                       completion: @escaping (Result<[iTunesSearchResult], iTunesSearchError>) -> Void)
        -> URLSessionTask? {
        
        guard let url = buildLookupURL(id: id, parameters: parameters) else { return nil }
        
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            
            guard let self = self else { return }
            let result = self.parseResponse(data: data, response: response, error: error)
            DispatchQueue.main.async {
                completion(result)
            }
        }
        task.resume()
        return task
    }
    
    private func parseResponse(data: Data?,
                               response _: URLResponse?,
                               error: Error?) -> Result<[iTunesSearchResult], iTunesSearchError> {
        guard let jsonData = data else {
            return .failure(iTunesSearchError.emptyData)
        }

        if let error = error {
            return .failure(iTunesSearchError.unknown(error))
        }

        do {
            let searchResponse = try decoder.decode(iTunesSearchResponse.self, from: jsonData)
            return .success(searchResponse.results)
        } catch let jsonError {
            return .failure(iTunesSearchError.parsingData(jsonError))
        }
    }
    
    private func buildLookupURL(id: Int, parameters: [String: String]?) -> URL? {
        var queryParameters = ["id": "\(id)"]
        if let _ = parameters { queryParameters.merge(parameters!) { $1 } }
        return URLComponents(host: self.host, path: "/lookup", parameters: queryParameters).url
    }
    
    private func buildSearchURL(searchTerm: String, parameters: [String: String]?) -> URL? {
        var queryParameters = ["term": searchTerm]
        if let _ = parameters {
            queryParameters.merge(parameters!) { $1 }
        }
        return URLComponents(host: self.host, path: "/search", parameters: queryParameters).url
    }
    
}



