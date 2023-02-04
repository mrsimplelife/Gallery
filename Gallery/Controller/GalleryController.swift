//
//  ViewController.swift
//  Gallery
//
//  Created by youme on 2023/02/04.
//

import SwiftUI

class GalleryController: UIViewController {
    lazy var cardView1: UICardView = {
        let cardView = UICardView(with: .skeleton)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()

    lazy var cardView2: UICardView = {
        let cardView = UICardView(with: .owl)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()

    lazy var cardView3: UICardView = {
        let cardView = UICardView(with: .panda)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()

    lazy var cardView4: UICardView = {
        let cardView = UICardView(with: .monkey)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.setupConstraints()
        self.view.backgroundColor = .white
    }

    // MARK: - Setting Views

    private func setupViews() {
        self.view.addSubviews(self.cardView1, self.cardView2, self.cardView3, self.cardView4)
    }

    // MARK: - Setting Constraints

    private func setupConstraints() {
        let safeArea = self.view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            self.cardView1.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.cardView1.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.cardView1.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5),
            self.cardView1.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),

            self.cardView2.leadingAnchor.constraint(equalTo: self.cardView1.trailingAnchor),
            self.cardView2.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.cardView2.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5),
            self.cardView2.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),
            self.cardView2.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),

            self.cardView3.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.cardView3.topAnchor.constraint(equalTo: self.cardView1.bottomAnchor),
            self.cardView3.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5),
            self.cardView3.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),
            self.cardView3.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),

            self.cardView4.leadingAnchor.constraint(equalTo: self.cardView3.trailingAnchor),
            self.cardView4.topAnchor.constraint(equalTo: self.cardView2.bottomAnchor),
            self.cardView4.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5),
            self.cardView4.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),
            self.cardView4.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }

}

struct GalleryView: UIViewControllerRepresentable {
    func makeUIViewController(context _: Context) -> GalleryController {
        GalleryController()
    }

    func updateUIViewController(_: GalleryController, context _: Context) {}
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
