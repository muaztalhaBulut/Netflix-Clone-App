//
//  TitleTabelViewCell.swift
//  Netflix Clone App
//
//  Created by Muaz Talha Bulut on 3.05.2022.
//

import UIKit
import SDWebImage


class TitleTabelViewCell: UITableViewCell {
    
    static let identifier = "titleTableViewCell"
    
    private let PlaytitleButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titlesPosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlesPosterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(PlaytitleButton)
        
        applyConstraits()
    }
    
   private func applyConstraits() {
        let titlesPosterUIImageViewConstraits = [
            titlesPosterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlesPosterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titlesPosterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            titlesPosterImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
       
       let titleLabelContstaits = [
        titleLabel.leadingAnchor.constraint(equalTo: titlesPosterImageView.trailingAnchor, constant: 10),
        titleLabel.widthAnchor.constraint(equalToConstant: 200),
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
       ]
       
        let playTitleButtonConstraints = [
         PlaytitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
         PlaytitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
             ]
     
       NSLayoutConstraint.activate(titlesPosterUIImageViewConstraits)
       NSLayoutConstraint.activate(titleLabelContstaits)
       NSLayoutConstraint.activate(playTitleButtonConstraints)
    }
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
        
        titlesPosterImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//2.45
