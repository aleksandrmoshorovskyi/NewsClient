//
//  DMNewsError.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 05.06.2024.
//

import Foundation

struct DMNewsError: Decodable {
    
    let status: String?
    let code: String?
    let message: String?
}
