//
//  UrlsInfo.swift
//  ChallengeWebmotors
//
//  Created by Josias Fabrício on 09/12/21.
//

import UIKit

public class UrlsInfo: NSObject {
    
    static func url(fromKey key: String) -> String {
        guard
            let path = R.file.urlsPlist.path(),
            let dict = NSDictionary(contentsOfFile: path) as? [String: String]
            else {
                return ""
        }
        
        if let url = dict[key] {
            return url
        } else {
            return ""
        }
        
    }
    
}
