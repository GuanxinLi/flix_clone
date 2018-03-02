//
//  MovieCell.swift
//  flix_clone
//
//  Created by Guanxin Li on 2/5/18.
//  Copyright © 2018 Guanxin. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    var movie: Movie! {
        didSet {
            self.titleLabel.text = movie.title
            self.overviewLabel.text = movie.overView
            let posterPathString = movie.posterUrl
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            let posterURL = URL(string: baseURLString + posterPathString!)!
            self.posterImageView.af_setImage(withURL: posterURL)
            let backgroundView = UIView()
            backgroundView.backgroundColor = UIColor.darkGray
            self.selectedBackgroundView = backgroundView
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
