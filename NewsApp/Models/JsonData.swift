//
//  JsonData.swift
//  NewsApp
//
//  Created by Ido Pesok on 1/26/19.
//  Copyright © 2019 IdoPesok. All rights reserved.
//

import UIKit

struct jsonData: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
