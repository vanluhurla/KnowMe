//
//  KMEducationViewController.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 11/12/2023.
//

import UIKit

class KMEducationViewController: UIViewController {
    
    private var collectionView: UICollectionView = {
        let layout = KMEducationCollectionViewLayout.layout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        collectionView.register(KMEducationAnimationCell.self, forCellWithReuseIdentifier: KMEducationAnimationCell.identifier)
        collectionView.register(KMEducationCell.self, forCellWithReuseIdentifier: KMEducationCell.identifier)
        return collectionView
    }()
    
    private lazy var dataSource: KMEducationDataSource = {
        let dataSource = KMEducationDataSource(collectionView: collectionView) { [weak self] collectionView, indexPath, itemIdentifier in
            guard let self else {
                return UICollectionViewCell()
            }
            switch itemIdentifier {
            case .animation(let item):
                return educationAnimation(collectionView: collectionView, indexPath: indexPath, item: item)
            case .cell(let item):
                return educationCell(collectionView: collectionView, indexPath: indexPath, item: item)
            }
        }
        return dataSource
    }()
    
    let viewModel: KMEducationViewModel
    
    init(viewModel: KMEducationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.loadData()
        setupUI()
        
    }
}
extension KMEducationViewController: KMEducationViewModelDelegate {
    func didReceiveEducationDetails() {
        applySnapshot()
    }
}

extension KMEducationViewController {
    func setupUI() {
        setupViews()
        layoutViews()
    }
    
    func setupViews() {
        view.addSubview(collectionView)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    func applySnapshot() {
        var snapshot = KMEducationSnapshot()
        snapshot.appendSections(EducationSection.allCases)
        snapshot.appendItems(viewModel.buildAnimationItem(), toSection: EducationSection.animation)
        snapshot.appendItems(viewModel.buildCells(), toSection: EducationSection.cell)
        dataSource.apply(snapshot)
    }
}

extension KMEducationViewController {
    func educationAnimation(collectionView: UICollectionView, indexPath: IndexPath, item: EducationAnimationItem) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KMEducationAnimationCell.identifier, for: indexPath) as? KMEducationAnimationCell else {
            return UICollectionViewCell()
        }
        cell.setupCellContent()
        return cell
    }
    
    func educationCell(collectionView: UICollectionView, indexPath: IndexPath, item: EducationCellItem) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KMEducationCell.identifier, for: indexPath) as? KMEducationCell else {
            return UICollectionViewCell()
        }
        cell.setupCellContent(item: item)
        return cell
        
    }
}
