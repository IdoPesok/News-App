//
//  Article.swift
//  NewsApp
//
//  Created by Ido Pesok on 1/26/19.
//  Copyright © 2019 IdoPesok. All rights reserved.
//

import UIKit

struct Article: Decodable {
    let source: Source?
    let title: String?
    let url: String?
    let urlToImage: String?
    let author: String?
    let description: String?
    let publishedAt: String?
}
