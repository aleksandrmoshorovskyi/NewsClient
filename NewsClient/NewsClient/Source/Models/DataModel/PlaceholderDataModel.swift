//
//  PlaceholderDataModel.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 12.07.2024.
//

import Foundation

//typealias buttonAction = ()

struct PlaceholderDataModel {
    
    let imageSystemName: String
    let titleText: NSAttributedString
    let descriptionText: NSAttributedString
    
    var buttonTitle: String?
    //var buttonAction: Selector?
    var buttonActionCompletion: (() -> ())?
}
