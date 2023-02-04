//
//  CardView.swift
//  Gallery
//
//  Created by youme on 2023/02/04.
//

import SwiftUI

final class UICardView: UIView {
    private let padding: CGFloat = 16

    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.backgroundColor = .white
        image.layer.cornerRadius = 8
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override private init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        self.setupConstraints()
    }

    convenience init(with type: CardType) {
        self.init(frame: .zero)
        self.configureCard(with: type)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        self.addSubviews(self.imageView, self.textLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.padding),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.padding),
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -self.padding),

            self.textLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: self.padding),
            self.textLabel.leadingAnchor.constraint(equalTo: self.imageView.leadingAnchor),
            self.textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -self.padding),
            self.textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -self.padding)
        ])
        self.textLabel.setContentHuggingPriority(.defaultLow + 1, for: .vertical)
        self.textLabel.setContentCompressionResistancePriority(.defaultHigh + 1, for: .vertical)
    }

}

// MARK: - View Configuration

extension UICardView {
    func configureCard(with type: CardType) {
        let model = Card.getCardDetails(for: type)
        self.imageView.image = UIImage(named: model.imageName)
        self.textLabel.text = model.characterName
        backgroundColor = model.backgroundColor
    }
}

struct CardView: UIViewRepresentable {
    let with: CardType
    func makeUIView(context _: Context) -> UICardView {
        UICardView(with: self.with)
    }

    func updateUIView(_: UICardView, context _: Context) {}
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(with: .skeleton)
    }
}
