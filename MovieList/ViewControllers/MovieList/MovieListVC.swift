//
//  ViewController.swift
//  MovieList
//
//  Created by Andy Orphan on 15.03.2021.
//

import UIKit

class MovieListVC: UIViewController {

    @IBOutlet weak var movieListTableView: UITableView!
    
    private var movies: [Movie]? {
        didSet {
            movieListTableView.reloadData()
        }
    }
    
    private let requestManager = MovieListRequestsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMovies()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        ImageLoader.shared.clearCache()
    }
    
    private func getMovies() {
        requestManager.refreshMovies { (movies, errorString) in
            self.movies = movies?.results
        }
    }
    
    private func loadNext() {
        requestManager.loadNextMovies { (movies, errorString) in
            guard let movies = movies?.results else { return }
            self.movies?.append(contentsOf: movies)
        }
    }

}

//MARK: - Segue
extension MovieListVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifiers.openPoster.rawValue {
            guard let movie = sender as? Movie else { return }
            guard let moviePosterVC = segue.destination as? PosterVC else { return }
            moviePosterVC.movie = movie
        }
    }
}

//MARK: - TableView
extension MovieListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.movieListCell.rawValue, for: indexPath) as? MovieListCell else { return UITableViewCell() }
        
        if let movie = movies?[indexPath.row] {
            cell.configure(with: movie)
        }
        
        if self.isLastCell(indexPath) {
            self.loadNext()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movie = movies?[indexPath.row] else { return }
        performSegue(withIdentifier: SegueIdentifiers.openPoster.rawValue, sender: movie)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


//MARK: - Helpers
extension MovieListVC {
    private func isLastCell(_ indexPath: IndexPath) -> Bool {
        return indexPath.row >= (movies?.count ?? 0) - 2
    }
}
