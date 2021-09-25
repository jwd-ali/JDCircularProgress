//
//  ViewController.swift
//  Demo
//
//  Created by Jawad Ali on 25/09/2021.
//

import UIKit
import CircularProgress
final class ViewController: UIViewController {

  @IBOutlet private weak var progressView: ProgressView!

  @IBAction private func startAnimation(_ sender: UIButton) {
    progressView.startAnimating(repeatCount: .infinity)
  }


  @IBAction private func stopAnimation(_ sender: UIButton) {
    progressView.stopAnimation()
  }
}

