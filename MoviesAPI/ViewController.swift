//
//  ViewController.swift
//  MoviesAPI
//
//  Created by Tekla on 11/10/23.
//

import UIKit

final class ViewController: UIViewController {

    //MARK: - Properties
    private var movieList = MovieInfo.movieList
    
    private let profileBarButton: UIBarButtonItem = {
        let button = UIButton()
        button.setTitle("Profile", for: .normal)
        button.backgroundColor = .orange
        NSLayoutConstraint.activate([button.widthAnchor.constraint(equalToConstant: 77), button.heightAnchor.constraint(equalToConstant: 40)])
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        let barButton = UIBarButtonItem(customView: button)
        return barButton
    }()
    
    private let logoImageView: UIImageView = {
           let imageView = UIImageView()
           imageView.image = UIImage(named: "Logo.png")
           imageView.contentMode = .scaleAspectFill
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
           imageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
           return imageView
       }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Now In Cinemas"
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let movieCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var movies = [Movie]()
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchMovies()
    }

    //MARK: - Private Methods
    private func setupView() {
        setUpBackground()
        addSubViews()
        setUpNavigationBar()
        setUpCollectionView()
        setUpConstraints()    }
    
    private func setUpBackground() {
        view.backgroundColor = UIColor(red: 26/255, green: 34/255, blue: 50/255, alpha: 1)
    }
    
    private func addSubViews() {
        view.addSubview(headerLabel)
        view.addSubview(movieCollectionView)
    }
    
    private func setUpNavigationBar() {
        navigationItem.setRightBarButton(profileBarButton, animated: true)
        let logoItem = UIBarButtonItem(customView: logoImageView)
        navigationItem.leftBarButtonItem = logoItem
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 31/255, green: 41/255, blue: 61/255, alpha: 0.7)
    }
    
    private func setUpCollectionView() {
       movieCollectionView.dataSource = self
       movieCollectionView.delegate = self
       movieCollectionView.register(MovieInfoCell.self, forCellWithReuseIdentifier: "MovieCollectionCell")
    }
    
    private func setUpConstraints() {
        setupHeaderLabel()
        setupMovieCollectionViewConstraints()
    }
    
    private func setupHeaderLabel() {
        NSLayoutConstraint.activate([
        headerLabel.widthAnchor.constraint(equalToConstant: 342),
        headerLabel.heightAnchor.constraint(equalToConstant: 29),
        headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
        headerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
    private func setupMovieCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            movieCollectionView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 15),
            movieCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            movieCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            movieCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func fetchMovies() {
        NetworkManager.shared.fetchMovies { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies //It doesn't even come here, not sure if the url is written correctly or the jason decoder.
                DispatchQueue.main.async {
                    self?.movieCollectionView.reloadData()
                }
            case .failure(_):
                break
            }
        }
    }
 
}
//MARK: - CollectionView DataSource
    extension ViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           movieList.count
       }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionCell", for: indexPath) as? MovieInfoCell else {
                return UICollectionViewCell()
            }
            cell.configurate(movieList: movieList[indexPath.row])
           return cell
       }
    }

// MARK: - CollectionView Delegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieDetailVC = MovieDetailViewController()
        //movieDetailVC.configure(movies: movieList[indexPath.row])
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}

// MARK: - CollectionView FlowLayoutDelegate
//I got this from the resourceHub code, for some reason the cells were not showing up, thought it was because of this extension and after trying and failing, I copied the code from the resourceHub (still did not work). Turned out just forgot to configurate the cells in func collectionView (And I'm too tired to change this extension to what it was before, so enjoy) :)
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let totalSpace = flowLayout.sectionInset.left
        + flowLayout.sectionInset.right
        + flowLayout.minimumInteritemSpacing
        
        let width = Int((collectionView.bounds.width - totalSpace) / 2)
        let height = 378
        
        return CGSize(width: width, height: height)
    }
}
