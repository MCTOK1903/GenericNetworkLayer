//
//  HomeViewController.swift
//  NetworkLayer
//
//  Created by Celal Tok on 5.12.2020.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Service.movie { (result) in
            switch result {
            case Result.success(let response):
                print("response = \(response[0].title)")
                break
            case Result.failure(let error):
                print("error = \(error)")
                break
            }
        }
    }
}
