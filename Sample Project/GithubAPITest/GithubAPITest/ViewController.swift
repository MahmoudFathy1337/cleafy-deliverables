//
//  ViewController.swift
//  GithubAPITest
//
//  Created by Mahmoud Fathy on 09/02/2022.
//

import UIKit
import GithubAPI

class ViewController: UIViewController {

    let activityRepository = GithubAPIRepositoryFactory.makeActivityRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Task {
            do {
                let request = GetStargazersRequest(owner: "octocat", repository: "hello-world")
                let stargazers = try await activityRepository.getStargazers(request: request)
                print(stargazers)
            } catch {
                debugPrint(error)
            }
            
        }
    }


}

