//
//  PageViewController.swift
//  PageView
//
//  Created by Deepa Bhan on 7/11/22.
//

import Foundation
import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    var pages = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
                
        let first = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "page1")
        let second = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "page2")
        let third = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "page3")
        
        pages.append(first)
        pages.append(second)
        pages.append(third)
        
        if let first = pages.first {
            setViewControllers([first], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        let cur = pages.firstIndex(of: viewController)!
        
        if cur == 0 { return nil }
        
        var prev = (cur - 1) % pages.count
        if prev < 0 {
            prev = pages.count - 1
        }
        return pages[prev]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        let cur = pages.firstIndex(of: viewController)!
        
        if cur == (pages.count - 1) { return nil }
        
        let nxt = abs((cur + 1) % pages.count)
        return pages[nxt]
    }
    
    /// dbhan:
    /// A page indicator will be visible if both methods are implemented,
    /// transition style is 'UIPageViewControllerTransitionStyleScroll',
    /// and navigation orientation is 'UIPageViewControllerNavigationOrientationHorizontal'.
    func presentationIndex(for pageViewController: UIPageViewController)-> Int {
        return 1
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        3
    }
}
