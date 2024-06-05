//
//  DMNewsModel.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 05.06.2024.
//

import Foundation

struct DMNewsModel: Decodable {
    
    let status: String?
    
    // for error {
    let code: String?
    let message: String?
    //}
    
    let totalResults: Int?
    let articles: [Articles]?
    
    struct Articles: Decodable {
        
        let source: Source?
        let author: String?
        let title: String?
        let description: String?
        let url: String?
        let urlToImage: String?
        let publishedAt: String?
        let content: String?
        
        struct Source: Decodable {
            let id: String?
            let name: String?
        }
    }
}

/*
 {
 status: "ok",
 totalResults: 3,
 articles: [
 {
 source: {
 id: null,
 name: "Overclockers.ua"
 },
 author: "siruf",
 title: "Gigabyte демонструє материнські плати на чипсетах Intel Z890 під Arrow Lake та AMD X870E для Zen 5 - Overclockers.ua",
 description: "Gigabyte на виставці Computex 2024 показала широку лінійку материнських плат на чипсеті Intel Z890, обладнаних роз'ємом Intel LGA1851 та готових прийняти на борт процесори серії Intel Core Ultra (Arrow Lake-S). Справжні назви системних...",
 url: "https://www.overclockers.ua/ua/news/hardware/2024-06-03/134883/",
 urlToImage: "https://www.overclockers.ua/news/motherboard/134883-Z890AORUSTachyon-01.jpg",
 publishedAt: "2024-06-03T11:04:00Z",
 content: "Gigabyte Computex 2024 Intel Z890, ' Intel LGA1851 Intel Core Ultra (Arrow Lake-S). , Z890 . ' LGA1851 LGA1700, .
 , Z890 Aorus Tachyon. . ' . ' DDR5 ( DIMM , '), PCIe Gen 5 M.2 NVMe , ' . ' NVMe PCI… [+372 chars]"
 }
 ]
 }
 */
