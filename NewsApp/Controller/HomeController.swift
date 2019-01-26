//
//  ViewController.swift
//  NewsApp
//
//  Created by Ido Pesok on 7/4/18.
//  Copyright © 2018 IdoPesok. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTopStories()
        setupNavBar()
        configureTableView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! ArticleCell
        
        cell.setArticle(a: articles[indexPath.row])
        
        return cell
    }
    
    fileprivate func configureTableView() {
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.allowsSelection = false
        
        tableView.register(ArticleCell.self, forCellReuseIdentifier: "cellID")
    }
    
    fileprivate func setupNavBar() {
        navigationItem.title = "Top Stories"
    }
    
    fileprivate func getTopStories() {
        let fullURLString = api.baseURL.rawValue + api.topHeadlines.rawValue + api.apiKey.rawValue
        
        if let fullURL = URL(string: fullURLString) {
            decodeJSONWithURL(url: fullURL)
        }
    }
    
    fileprivate func decodeJSONWithURL(url: URL) {
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, err) in
            guard let data = data else { return }
            
            do {
                let data = try JSONDecoder().decode(jsonData.self, from: data)
                
                self.articles = data.articles
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.configureTableView()
                }
            }
            catch let jsonError {
                print(jsonError)
            }
        }).resume()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureTableView()
    }
}



