//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by Elizeu RS on 11/06/23.
//

import UIKit

enum Sections: Int {
  case TrendingMovies = 0
  case TrendingTv = 1
  case Popular = 2
  case Upcoming = 3
  case TopRated = 4
}

class HomeViewController: UIViewController {
  
  let sectionTitles: [String] = ["Trending  Movies", "Trending Tv", "Popular", "Upcoming Movies", "Top rated"]
  
  private let homefeedTable: UITableView = {
    let table = UITableView(frame: .zero, style: .grouped)
    table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
    return table
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //      view.backgroundColor = .systemRed
    view.backgroundColor = .systemBackground
    view.addSubview(homefeedTable)
    
    homefeedTable.delegate = self
    homefeedTable.dataSource = self
    
    configureNavBar()
    
    let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
    homefeedTable.tableHeaderView = headerView
        
//    APICaller.shared.getMovie(with: "Harry potter")
//    APICaller.shared.getMovie(with: "Harry potter") { result in
//      //
//    }
    
    //    getTrendingMovies()
//    fetchData()
  }
  
  private func configureNavBar() {
    var image = UIImage(named: "netflixLogo")
    image = image?.withRenderingMode(.alwaysOriginal)
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
    
    navigationItem.rightBarButtonItems = [
      UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
      UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
    ]
    navigationController?.navigationBar.tintColor = .white
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    homefeedTable.frame = view.bounds
  }
  
//  private func fetchData() {
//
//    //  private func getTrendingMovies() {
//    //    //    APICaller.shared.getTrendingMovies { _ in
//    //    APICaller.shared.getTrendingMovies { results in
//    //      switch results {
//    //      case .success(let movies):
//    //        print(movies)
//    //      case .failure(let error):
//    //        print(error)
//    //      }
//    //    }
//    //  }
//
//
////    APICaller.shared.getTrendingTvs { result in
//        //
////    }
//
////    APICaller.shared.getUpcomingMovies { _ in
//        //
////    }
//
////    APICaller.shared.getPopular { _ in
//       //
////    }
//
////        APICaller.shared.getTopRated { _ in
////
////        }
//  }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return sectionTitles.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//    cell.textLabel?.text = "Hello world"
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
      return UITableViewCell()
      
    }
    
    cell.delegate = self
    
    switch indexPath.section {
    case Sections.TrendingMovies.rawValue:
      
      APICaller.shared.getTrendingMovies { result in
        switch result {
        case .success(let titles):
          cell.configure(with: titles)
        case .failure(let error):
          print(error.localizedDescription)
        }
      }
      
    case Sections.TrendingTv.rawValue:
      APICaller.shared.getTrendingTvs { result in
        switch result {
        case .success(let titles):
          cell.configure(with: titles)
        case .failure(let error):
          print(error.localizedDescription)
        }
      }
      
    case Sections.Popular.rawValue:
      APICaller.shared.getPopular { result in
        switch result {
        case .success(let titles):
          cell.configure(with: titles)
        case .failure(let error):
          print(error.localizedDescription)
        }
      }
      
    case Sections.Upcoming.rawValue:
      APICaller.shared.getUpcomingMovies { result in
        switch result {
        case .success(let titles):
          cell.configure(with: titles)
        case .failure(let error):
          print(error.localizedDescription)
        }
      }
      
    case Sections.TopRated.rawValue:
      APICaller.shared.getTopRated { result in
        switch result {
        case .success(let titles):
          cell.configure(with: titles)
        case .failure(let error):
          print(error.localizedDescription)
        }
      }
    default:
      return UITableViewCell()
    }
    
//    cell.backgroundColor = .red
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 40
  }
  
  func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    guard let header = view as? UITableViewHeaderFooterView else { return }
    header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
    header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
    header.textLabel?.textColor = .white
    header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return sectionTitles[section]
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let defaultOffset = view.safeAreaInsets.top
    let offset = scrollView.contentOffset.y + defaultOffset
    
    navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
  }
}

extension HomeViewController: CollectionViewTableViewCellDelegate {
  func CollectionViewTableViewCellDidTapCell(_ cell: CollectionViewTableViewCell, viewModel: TitlePreviewViewModel) {
    DispatchQueue.main.async { [weak self] in
      let vc = TitlePreviewViewController()
      vc.configure(with: viewModel)
      self?.navigationController?.pushViewController(vc, animated: true)
    }
  }
}

