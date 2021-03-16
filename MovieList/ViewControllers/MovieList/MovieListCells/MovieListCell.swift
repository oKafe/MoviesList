//
//  MovieListCell.swift
//  MovieList
//
//  Created by Andy Orphan on 15.03.2021.
//

import UIKit

class MovieListCell: UITableViewCell {

    @IBOutlet weak var movieRateLabel: UILabel!
    @IBOutlet weak var movieGenresLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        movieImageView.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with movie: Movie) {
        let movieRating = movie.voteAverage ?? 0.0
        movieRateLabel.text = "\(movieRating)"
        movieRateLabel.setTextColor(movieRating / 10.0)
        
        movieTitleLabel.text = movie.title
        movieOverviewLabel.text = movie.overview
        
        movieImageView.loadImage(from: movie.backdropFullPath())
    }
    
}
