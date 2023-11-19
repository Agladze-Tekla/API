//
//  MovieDetailVieController.swift
//  anything
//
//  Created by Tekla on 11/3/23.
//

import UIKit

final class MovieDetailViewController: UIViewController {

     // MARK: - UI Components
     private let mainStackView: UIStackView = {
         let stackView = UIStackView()
         stackView.axis = .vertical
         stackView.translatesAutoresizingMaskIntoConstraints = false
         return stackView
     }()
    
    private let bottomSectionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = UIColor(red: 31/255.0, green: 41/255.0, blue: 61/255.0, alpha: 1)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
     private let movieImageView: UIImageView = {
         let imageView = UIImageView()
         imageView.contentMode = .scaleAspectFill
         imageView.clipsToBounds = true
         imageView.heightAnchor.constraint(equalToConstant: 210).isActive = true
         return imageView
     }()
     
     private let descriptionLabel: UILabel = {
         let label = UILabel()
         label.numberOfLines = 0
         label.textColor = .white
         return label
     }()
     
     private let ratingLabel: UILabel = {
         let label = UILabel()
        label.text = "IMDB"
         label.textColor = .white
         return label
     }()
     
     private let ratingPlatformLabel: UILabel = {
         let label = UILabel()
         label.textColor = .white
         return label
     }()

     private let selectSessionButton: UIButton = {
         let button = UIButton()
         button.setTitle("Select session", for: .normal)
         button.titleLabel?.textColor = .white
         button.backgroundColor = .systemOrange
         button.layer.cornerRadius = 8
         button.heightAnchor.constraint(equalToConstant: 56).isActive = true
         return button
     }()
     
     private var movieList: MovieInfo?
     
     // MARK: - ViewLifecycle
     override func viewDidLoad() {
         super.viewDidLoad()
         setup()
     }
     
     // MARK: - Private Methods
     private func setup() {
         setupBackground()
         setupMainStackView()
         setupMovieRatingInformation()
         setupDescriptionLabel()
         setupBottomSectionStackView()
         setupSelectSessionButton()
         setupMovieWithInformation()
     }
    
    private func setupBackground() {
        view.backgroundColor = UIColor(red: 26/255, green: 34/255, blue: 50/255, alpha: 1)
    }
     
     private func setupMainStackView() {
         view.addSubview(mainStackView)
         mainStackView.addArrangedSubview(movieImageView)
         
         NSLayoutConstraint.activate([
             mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
         ])
     }
     
     private func setupMovieRatingInformation() {
         let stackView = UIStackView()
         stackView.axis = .vertical
         stackView.spacing = 4
         stackView.alignment = .center
         stackView.backgroundColor = UIColor(red: 99/255, green: 115/255, blue: 148/255, alpha: 0.1)
         stackView.isLayoutMarginsRelativeArrangement = true
         stackView.layoutMargins = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
         
         stackView.addArrangedSubview(ratingLabel)
         stackView.addArrangedSubview(ratingPlatformLabel)
         
         mainStackView.addArrangedSubview(stackView)
     }
     
     private func setupDescriptionLabel() {
         let stackView = UIStackView()
         stackView.isLayoutMarginsRelativeArrangement = true
         stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 12, right: 16)
         
         stackView.addArrangedSubview(descriptionLabel)
         mainStackView.addArrangedSubview(stackView)
     }
         
    private func setupMovieWithInformation() {
        // TODO: - Fix after network call
        /*
        navigationItem.title = movieList?.title
        descriptionLabel.text = movieList?.synopsis
        createInfoStackView("Genre", detail: movieList?.genre ?? "")
   */
    }
    
    //Didn't have this in the original code (Made every stack, label and movieInfo separately and frankly it looked like a mess) so I kinda used the resourceHub code, sorry, looked at it and couldn't think of another solution :\
     private func createInfoStackView(_ title: String, detail: String) {
         let stackView = UIStackView()
         stackView.spacing = 16
         stackView.alignment = .leading
         stackView.isLayoutMarginsRelativeArrangement = true
         stackView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 12, right: 16)
         
         let titleLabel = UILabel()
         titleLabel.text = title
         titleLabel.textColor = .white
         titleLabel.widthAnchor.constraint(equalToConstant: 86).isActive = true
         
         let detailLabel = UILabel()
         detailLabel.text = detail
         detailLabel.textColor = .white
         detailLabel.numberOfLines = 0
         
         stackView.addArrangedSubview(titleLabel)
         stackView.addArrangedSubview(detailLabel)
         
         mainStackView.addArrangedSubview(stackView)
     }
     
     private func setupBottomSectionStackView() {
         view.addSubview(bottomSectionStackView)
     
         NSLayoutConstraint.activate([
             bottomSectionStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             bottomSectionStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             bottomSectionStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             bottomSectionStackView.heightAnchor.constraint(equalToConstant: 114)
         ])
     }
     
     private func setupSelectSessionButton() {
         bottomSectionStackView.addArrangedSubview(selectSessionButton)
     }
    
     // MARK: - Configure
     func configure(movies: MovieInfo) {
         self.movieList = movies
     }
}
