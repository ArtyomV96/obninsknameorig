//
//  NoticeController.swift
//  ObninskName
//
//  Created by Artyom Vlasov on 23.08.2018.
//  Copyright © 2018 midev. All rights reserved.
//

import UIKit

class NoticeController: UIViewController {

    let tags: [String] = ["All", "Huial", "Pizdal", "ddKaba", "Huial", "Pizdal"]
    let cll = TagCell()

    weak var collectionView: UICollectionView!

    override func loadView() {
        super.loadView()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: cll.tagView.frame.width, height: 36)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 75).isActive = true
           // collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true


        self.collectionView = collectionView
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.backgroundColor = .white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self

        self.collectionView.register(TagCell.self, forCellWithReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension NoticeController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TagCell
        cell.tagView.text = tags[indexPath.row]
        return cell
    }
}
