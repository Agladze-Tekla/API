//
//  MovieInfoCell.swift
//  anything
//
//  Created by Tekla on 11/3/23.
//

import UIKit

final class MovieInfoCell: UICollectionViewCell {
 
    static let identifier = "MovieCollectionCell"
    private let movieList = MovieInfo.movieList
    
    //MARK: - Properties
    private let cellStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let poster: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.layer.masksToBounds = true
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 2
        return label
        
    }()
    
    //MARK: - SetUp
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addSubViews() {
        contentView.addSubview(cellStackView)
        cellStackView.addArrangedSubview(poster)
        cellStackView.addArrangedSubview(titleLabel)
        cellStackView.addArrangedSubview(genreLabel)
    }
    
    func configurate(movieList: MovieInfo) {
        poster.image = movieList.image
        titleLabel.text = movieList.title
        genreLabel.text = movieList.genre
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            cellStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellStackView.heightAnchor.constraint(equalToConstant: 370)
        ])
    }
    
    // MARK: - CellLifeCycle
      override func prepareForReuse() {
          super.prepareForReuse()
          
          poster.image = nil
          genreLabel.text = nil
          titleLabel.text = nil
      }
}
