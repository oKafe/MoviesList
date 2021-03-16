//
//  MovieDetails.swift
//  MovieList
//
//  Created by Andy Orphan on 16.03.2021.
//

import UIKit

class PosterVC: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!

    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImage()
    }
    
    private func setImage() {
        guard let movie = movie else { return }
        posterImageView.loadImage(from: movie.posterFullPath())
    }

}
