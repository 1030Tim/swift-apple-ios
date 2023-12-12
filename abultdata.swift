# swift-apple-ios
//
//  ContentView.swift
//  Constant
//
//  Created by juhn on 2023/11/19.
//

import Foundation
typealias Experience = (title:String , company:String , start:String , end:String)
struct Resume {
    static let shared = Resume()
    let name = " juhn chen"
    let title = "陸興高中"
    let location = " 位置：台灣"
    let bio = "bio:想讓備審資料以更創新的方式呈現，為此開發出app，app開發愛好者對於AI機器學習略有研究"
    let skills = ["python","C","swift"]
    let experiences:[Experience]=[("APCS",
                                   "juhn chen",
                                  "2023 年 1 月",
                                  "現在"),(
                                  "APCS",
                                  "2023 年 10月",
                                  "1級分2級分",
                                  "pandas")]
    let phoneUrl = "tel://0982918886"
    let socialMedia: [(name:String,url:String)] = [("ig","ozen.1105"),("LINE","https://line.me/D")]
}
