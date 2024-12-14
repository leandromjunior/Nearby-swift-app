//
//  WelcomeView.swift
//  NearbyApp NLW
//
//  Created by Leandro Motta Junior on 11/12/24.
//

import Foundation
import UIKit

class WelcomeView: UIView {
    
    var didTapButton: (() -> Void?)?
    
    private let logoImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "homeLogo"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private let welcomeLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Boas Vindas ao Nearby"
        label.font = Typography.titleXL
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        
        let descLabel = UILabel()
        descLabel.text = "Tenha cupons de vantagem para usar em seus estabelecimentos favoritos."
        descLabel.font = Typography.textMD
        descLabel.numberOfLines = 0
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return descLabel
    }()
    
    private let subTextForTips: UILabel = {
        
        let subLabel = UILabel()
        subLabel.text = "Veja como funciona:"
        subLabel.font = Typography.textMD
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return subLabel
    }()
    
    private let tipsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 24
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let startButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Começar", for: .normal)
        button.backgroundColor = Colors.greenBase
        button.titleLabel?.font = Typography.action
        button.setTitleColor(Colors.gray100, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        addSubview(logoImageView)
        addSubview(welcomeLabel)
        addSubview(descriptionLabel)
        addSubview(subTextForTips)
        addSubview(tipsStackView)
        addSubview(startButton)
        setupTips()
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            logoImageView.widthAnchor.constraint(equalToConstant: 48),
            logoImageView.heightAnchor.constraint(equalToConstant: 48),
            
            welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 28),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            
            descriptionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 12),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            subTextForTips.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            subTextForTips.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            tipsStackView.topAnchor.constraint(equalTo: subTextForTips.bottomAnchor, constant: 24),
            tipsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            tipsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            startButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            startButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    @objc
    private func didTap() {
        didTapButton?()
    }
    
    private func setupTips() {
        guard let icon1 = UIImage(named: "mapIcon") else { return } // Uma forma de lidar com optionals
        let tip1 = TipsView(icon: icon1,
                            title: "Encontre Estabelecimentos",
                            description: "Veja locais perto de você que são parceiros Nearby")
        
        // Outra forma de lidar com Optionals
        let tip2 = TipsView(icon: UIImage(named: "qrcode") ?? UIImage(),
                            title: "Ative o cupom com o qrcode",
                            description: "Escaneie o código no estabelecimento para usar o benefício")
        
        let tip3 = TipsView(icon: UIImage(named: "ticket") ?? UIImage(),
                            title: "Garanta vantagens perto de vocë",
                            description: "Ative cupons onde estiver, em diferentes tipos de estabelecimento")
        
        tipsStackView.addArrangedSubview(tip1)
        tipsStackView.addArrangedSubview(tip2)
        tipsStackView.addArrangedSubview(tip3)
    }
}


