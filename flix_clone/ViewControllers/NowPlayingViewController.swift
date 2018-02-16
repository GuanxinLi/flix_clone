//
//  NowPlayingViewController.swift
//  flix_clone
//
//  Created by Guanxin Li on 2/1/18.
//  Copyright © 2018 Guanxin. All rights reserved.
//

import UIKit
import AlamofireImage
import PKHUD


class NowPlayingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var movies: [[String: Any]] = []
    var filteredData: [[String: Any]] = []
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        activityIndicator.startAnimating()
        refreshControl.addTarget(self, action: #selector (NowPlayingViewController.didPullToRefresh(_:)), for: .valueChanged)
        
        tableView.insertSubview(refreshControl, at: 0)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        searchBar.delegate = self
        /*
        searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        tableView.contentInset = UIEdgeInsets(top:40, left: 0, bottom: 0, right: 0)
        tableView.scrollIndicatorInsets = UIEdgeInsets(top:40, left: 0, bottom: 0, right: 0)
        tableView.addSubview(searchBar) */
        fetchMovies()
    }
    
    @objc func didPullToRefresh(_ refreshControll: UIRefreshControl) {
        fetchMovies()
    }
    
    // Update the new movies once the user pull down the screen
    func fetchMovies(){
        let url = URL(string:
            "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy:
            .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil,
                                 delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data: Data?, response, error) in
            // This will runs when network returns
            if let error = error {
                print(error.localizedDescription)
                let alertController = UIAlertController(title: "Cannot Get Movies", message: "The internet connection appears to be offline.", preferredStyle: .alert)
                
                // create a cancel action
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                    self.activityIndicator.stopAnimating()
                    self.refreshControl.endRefreshing()
                }
                // create an OK action
                let OKAction = UIAlertAction(title: "Try Again", style: .default) { (action) in
                    self.fetchMovies()
                }
                // add the cancel action to the alertController
                alertController.addAction(cancelAction)
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
            
                self.present(alertController, animated: true) {
                    self.fetchMovies()
                }
            }else if let data = data {
                self.updateMovies(data: data)
            }
        }
        task.resume()
    }
    
    func updateMovies(data: Data?){
        let dataDicationary = try! JSONSerialization
            .jsonObject(with: data!, options:[]) as! [String: Any]
        let movies = dataDicationary["results"] as! [[String: Any]]
        self.movies = movies
        // If no text, filteredData is the same as the original data
        self.filteredData = self.movies
        self.activityIndicator.stopAnimating()
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
        HUD.flash(.success, delay: 1.0)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    // Updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = searchText.isEmpty ? movies : movies.filter { (data: [String: Any]) -> Bool in
            // If dataItem matches the searchText, return true to include it
            if let item = data["title"] as? String {
                return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            }
            return false
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = filteredData[indexPath.row]
        let title = movie["title"] as! String
        let overview = movie["overview"] as! String
        cell.titleLabel.text = title
        cell.overviewLabel.text = overview
        
        let posterPathString = movie["poster_path"] as! String
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        let posterURL = URL(string: baseURLString + posterPathString)!
        cell.posterImageView.af_setImage(withURL: posterURL)
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.darkGray
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell){
            let movie = movies[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.movie = movie
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
