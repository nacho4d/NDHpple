//
//  NDHpple.swift
//  NDHpple
//
//  Created by Nicolai on 24/06/14.
//  Copyright (c) 2014 Nicolai Davidsson. All rights reserved.
//

import Foundation

public class NDHpple {
    
    private let data: String
    private let isXML: Bool
    
    public init(data: String, isXML: Bool) {
        self.data = data
        self.isXML = isXML
    }
    
    public convenience init(XMLData: String) {
        self.init(data: XMLData, isXML: true)
    }
    
    public convenience init(HTMLData: String) {
        self.init(data: HTMLData, isXML: false)
    }

    /// Perform an Xpath query search
    public func search(withQuery query: String) -> [NDHppleElement] {
        let nodes = try? PerformXPathQuery(data: data, query: query, isXML: isXML)
        return nodes?.map{ NDHppleElement(node: $0) } ?? []
    }

    /// Perform an Xpath query search then return the first element
    public func peekAtSearch(withQuery query: String) -> NDHppleElement? {
        let results = search(withQuery: query)
        return results.first
    }
}
