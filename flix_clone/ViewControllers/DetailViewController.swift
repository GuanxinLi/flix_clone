//
//  DetailViewController.swift
//  flix_clone
//
//  Created by Guanxin Li on 2/6/18.
//  Copyright © 2018 Guanxin. All rights reserved.
//

import UIKit

enum MovieKeys {
    static let title = "title"
    static let backdropPath = "backdrop_path"
    static let releaseDate  = "release_date"
    static let overview  = "overview"
    static let posterPath = "poster_path"
    
}

class DetailViewController: UIViewController {

    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie {
            //fetching the data for the movies from Move Datebase API
            titleLabel.text = movie.title
            releaseDateLabel.text = movie.releaseDate
            overViewLabel.text = movie.overView
            let backdropPathString = movie.backDropImageUrl
            let posterPathString = movie.posterUrl
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            
            // Link BackDrop URL
            let backdropURL = URL(string: baseURLString + backdropPathString!)!
            backDropImageView.af_setImage(withURL: backdropURL)
            
            // Link poster URL
            let posterURL = URL(string: baseURLString + posterPathString!)!
            posterImageView.af_setImage(withURL: posterURL)
 
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
