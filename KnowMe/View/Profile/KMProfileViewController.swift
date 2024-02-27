//
//  KMProfileViewController.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 11/12/2023.
//  
import UIKit

class KMProfileViewController: UIViewController {
    
    //MARK: Collection View
    private var collectionView: UICollectionView = {
        let layout = KMProfileCollectionViewLayout.layout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        collectionView.register(KMProfileAnimationCell.self, forCellWithReuseIdentifier: KMProfileAnimationCell.identifier)
        collectionView.register(KMProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: KMProfileHeader.identifier)
        collectionView.register(KMProfileContentCell.self, forCellWithReuseIdentifier: KMProfileContentCell.identifier)
        return collectionView
    }()
    //MARK: Data Source
    private lazy var dataSource: KMProfileDataSource = {
        let dataSource = KMProfileDataSource(collectionView: collectionView) { [weak self] collectionView, indexPath, itemIdentifier in
            guard let self else {
                return UICollectionViewCell()
            }
            switch itemIdentifier {
            case .animation(let item):
                return profileAnimation(collectionView: collectionView, indexPaht: indexPath, item: item)
            case .personalInfo(let item):
                return profileContentCell(collectionView: collectionView, indexPath: indexPath, item: item)
            case .professionalInfo(let item):
                return profileContentCell(collectionView: collectionView, indexPath: indexPath, item: item)
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
    
    //MARK: View Model
    let viewModel: KMProfileViewModel
    
    init(viewModel: KMProfileViewModel) {
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
        setupUI()
    }
}

//MARK: Delegate
extension KMProfileViewController: KMProfileViewModelDelegate {
    func didRecieveProfileDetails() {
        applySnapshot()
    }
}

//MARK: Collection View UI
extension KMProfileViewController {
    func setupUI() {
        setupViews()
        setupLayout()
    }
    
    func setupViews() {
        view.addSubview(collectionView)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    //MARK: Snapshot
    func applySnapshot() {
        var snapshot = KMProfileSnapshot()
        snapshot.appendSections(ProfileSection.allCases)
        snapshot.appendItems(viewModel.buildAnimationItem(), toSection: ProfileSection.animation)
        snapshot.appendItems(viewModel.buildPersonalItem(), toSection: ProfileSection.personalInfo)
        snapshot.appendItems(viewModel.buildProfessionalItem(), toSection: ProfileSection.professionalInfo)
        dataSource.apply(snapshot)
    }
}

//MARK: Cells
private extension KMProfileViewController {
    func profileAnimation(collectionView: UICollectionView, indexPaht: IndexPath, item: ProfileAnimationItem) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KMProfileAnimationCell.identifier, for: indexPaht) as? KMProfileAnimationCell else {
            return UICollectionViewCell()
        }
        cell.setupCellContent()
        return cell
    }
    
    func header(collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? {
        guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: KMProfileHeader.identifier, for: indexPath) as? KMProfileHeader,
              let section = ProfileSection(rawValue: indexPath.section) else {
            return nil
        }
        sectionHeader.setupHeader(title: section.sectionTitle)
        return sectionHeader
    }
    
    func profileContentCell(collectionView: UICollectionView, indexPath: IndexPath, item: ProfileContent) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KMProfileContentCell.identifier, for: indexPath) as? KMProfileContentCell else {
            return UICollectionViewCell()
        }
        cell.setupCellContent(item: item)
        cell.delegate = self
        return cell
    }
}

extension KMProfileViewController: KMProfileCellDelegate {
    func didTapReadMoreButton(type: ProfileContentType) {
        viewModel.didTapReadMeButton(type: type)
    }
}

