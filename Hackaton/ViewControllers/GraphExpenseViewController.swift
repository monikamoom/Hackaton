//
//  GraphExpenseViewController.swift
//  Procket
//
//  Created by s89506 on 25/7/2562 BE.
//  Copyright © 2562 s89506. All rights reserved.
//

import UIKit
import PieCharts

class GraphExpenseViewController: UIViewController {
    @IBOutlet weak var graphView: UIView!
    let chartView: PieChart = PieChart(frame: CGRect(x: 0, y: 50, width: 310, height: 307 ))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.graphView.addSubview(chartView)

        
    }
    override func viewWillDisappear(_ animated: Bool) {
        chartView.clear()
        self.chartView.removeFromSuperview()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        
        chartView.layers = [createCustomViewsLayer(), createTextLayer()]
        //chartView.delegate = self
        chartView.models = createModels() // order is important - models have to be set at the end
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewDidLoad()
    }
    //    override func viewWillDisappear(_ animated: Bool) {
    //        chartView.layers = []
    //    }
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    //        viewDidLoad()
    //
    //        chartView.layers = [createCustomViewsLayer(), createTextLayer()]
    ////        chartView.delegate = self
    //        chartView.models = createModels() // order is important - models have to be set at the end
    //
    //    }
    
    fileprivate func createModels() -> [PieSliceModel] {
        let alpha: CGFloat = 0.5
        
        return [
            PieSliceModel(value: 20, color: UIColor.yellow.withAlphaComponent(alpha)),
            PieSliceModel(value: 30, color: UIColor.blue.withAlphaComponent(alpha)),
            PieSliceModel(value: 1, color: UIColor.green.withAlphaComponent(alpha)),
            PieSliceModel(value: 20, color: UIColor.cyan.withAlphaComponent(alpha)),
            PieSliceModel(value: 20, color: UIColor.red.withAlphaComponent(alpha)),
            PieSliceModel(value: 1.5, color: UIColor.magenta.withAlphaComponent(alpha))
//            PieSliceModel(value: 0.5, color: UIColor.orange.withAlphaComponent(alpha))
        ]
    }
    fileprivate func createCustomViewsLayer() -> PieCustomViewsLayer {
        let viewLayer = PieCustomViewsLayer()
        
        let settings = PieCustomViewsLayerSettings()
        settings.viewRadius = 100
        settings.hideOnOverflow = false
        viewLayer.settings = settings
        
        viewLayer.viewGenerator = createViewGenerator()
        
        return viewLayer
    }
    
    fileprivate func createTextLayer() -> PiePlainTextLayer {
        let textLayerSettings = PiePlainTextLayerSettings()
        textLayerSettings.viewRadius = 65
        textLayerSettings.hideOnOverflow = true
        textLayerSettings.label.font = UIFont.systemFont(ofSize: 12)
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        textLayerSettings.label.textGenerator = {slice in
            return formatter.string(from: slice.data.percentage * 100 as NSNumber).map{"\($0)%"} ?? ""
        }
        
        let textLayer = PiePlainTextLayer()
        textLayer.settings = textLayerSettings
        return textLayer
    }
    
    fileprivate func createViewGenerator() -> (PieSlice, CGPoint) -> UIView {
        return {slice, center in
            
            let container = UIView()
            container.frame.size = CGSize(width: 30, height: 30)
            container.center = center
            let view = UIImageView()
            view.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            container.addSubview(view)
           
            let imageName: String? = {
                switch slice.data.id {
                case 0: return "foodIcon"
                case 1: return "shopIcon"
                case 2: return "entIcon"
                case 3: return "tranIcon"
                case 4: return "mediIcon"
                case 5: return "otherExIcon"
                default: return nil
                }
            }()
            
            view.image = imageName.flatMap{UIImage(named: $0)}
            
            return container
        }
    }

}
