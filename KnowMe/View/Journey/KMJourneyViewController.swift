//
//  KMJourneyViewController.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 11/12/2023.
//

import UIKit

class KMJourneyViewController: UIViewController {
    
    private var collectionView: UICollectionView = {
        let layout = KMJourneyCollectionViewLayout.layout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        collectionView.register(KMJourneyAnimationCell.self, forCellWithReuseIdentifier: KMJourneyAnimationCell.identifier)
        collectionView.register(KMJourneyCardCell.self, forCellWithReuseIdentifier: KMJourneyCardCell.identifier)
        collectionView.register(KMJourneyHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: KMJourneyHeader.identifier)
        return collectionView
    }()
    
    private lazy var dataSource: KMJourneyDataSource = {
        let dataSource = KMJourneyDataSource(collectionView: collectionView) { [weak self] collectionView, indexPath, itemIdentifier in
            guard let self else {
                return UICollectionViewCell()
            }
            switch itemIdentifier {
            case .animation(let item):
                return journeyAnimation(collectionView: collectionView, indexPaht: indexPath, item: item)
            case .card(let item):
                return journeyCardCell(collectionView: collectionView, indexPath: indexPath, item: item)
            }
        }
        dataSource.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let self else {
                return nil
            }
            return header(collectionView: collectionView, kind: kind, indexPath: indexPath)
        }
        return dataSource
    }()
    
    let viewModel: KMJourneyViewModel
    
    init(viewModel: KMJourneyViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundPrimary
        viewModel.loadData()
        setupCollectionView()
        setupUI()
    }
}
extension KMJourneyViewController: KMJourneyViewModelDelegate {
    func didReceiveJourneyDetails() {
        applySnapshot()
    }
}

extension KMJourneyViewController {
    func setupCollectionView() {
        collectionView.delegate = self
    }
    
    func setupUI() {
        setupView()
        layoutView()
    }
    
    func setupView() {
        view.addSubview(collectionView)
    }
    
    func layoutView() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    func applySnapshot() {
        var snapshot = KMJourneySnapshot()
        snapshot.appendSections(JourneySection.allCases)
        snapshot.appendItems(viewModel.buildAnimationItem(), toSection: JourneySection.animation)
        snapshot.appendItems(viewModel.buildCards(), toSection: JourneySection.card)
        dataSource.apply(snapshot)
    }
}

extension KMJourneyViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectItem(indexPath: indexPath)
    }
}

private extension KMJourneyViewController {
    func header(collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? {
        guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: KMJourneyHeader.identifier, for: indexPath) as? KMJourneyHeader,
              let section = JourneySection(rawValue: indexPath.section) else {
            return nil
        }
        sectionHeader.setupHeader(title: section.sectionTitle)
        return sectionHeader
    }
    
    func journeyAnimation(collectionView: UICollectionView, indexPaht: IndexPath, item: JourneyAnimationItem) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KMJourneyAnimationCell.identifier, for: indexPaht) as? KMJourneyAnimationCell else {
            return UICollectionViewCell()
        }
        cell.setupCellContent()
        return cell
    }
    
    func journeyCardCell(collectionView: UICollectionView, indexPath: IndexPath, item: JourneyCard) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KMJourneyCardCell.identifier, for: indexPath) as? KMJourneyCardCell else {
            return UICollectionViewCell()
        }
        cell.setupCellContent(item: item)
        return cell
    }
}
