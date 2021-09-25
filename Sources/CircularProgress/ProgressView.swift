import UIKit
@IBDesignable
public final class ProgressView: UIView {
  
  //MARK:- properties
  public var lineWidth: CGFloat = 15.0
  { didSet { allLayers.forEach { $0.lineWidth = lineWidth } } }

  public var frontColor = #colorLiteral(red: 0.999904573, green: 1, blue: 0.9998808503, alpha: 1)
  { didSet { allLayers.forEach { $0.strokeColor = frontColor.cgColor } } }

  public var speed = 1.5
  
  public typealias completion = () -> Void
  
  // MARK: - Layers
  private lazy var circularLayerA = CAShapeLayerFactory.createShapeLayer(strokeColor: frontColor, lineWidth: lineWidth)
  
  private lazy var circularLayerB = CAShapeLayerFactory.createShapeLayer(strokeColor: frontColor, lineWidth: lineWidth)
  
  private lazy var circularLayerC = CAShapeLayerFactory.createShapeLayer(strokeColor: frontColor, lineWidth: lineWidth)
  
  private lazy var allLayers = [circularLayerA, circularLayerB, circularLayerC]
  
  // MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    updatePaths()
  }
}

private extension ProgressView {
  func commonInit() {
    backgroundColor = .clear
    allLayers.forEach(layer.addSublayer)
  }
  
  func updatePaths() {
    
    allLayers.forEach { $0.frame = bounds }
    
    let center = CGPoint(x: bounds.maxX / 2, y: bounds.maxY / 2)
    let maximumRadius =  min(bounds.maxX,bounds.maxY)/2 - (lineWidth / 2.0)
    let startAngleA = (200 + lineWidth/3).deg2rad
    let endAngleA = (316 - lineWidth/3).deg2rad
    
    let startAngleB = (320 + lineWidth/3).deg2rad
    let endAngleB = (436 - lineWidth/3).deg2rad
    
    let startAngleC = (440 + lineWidth/3).deg2rad
    let endAngleC = (556 - lineWidth/3).deg2rad
    
    circularLayerA.path = UIBezierPath(arcCenter: center, radius: maximumRadius, startAngle: startAngleA, endAngle: endAngleA, clockwise: true).cgPath
    
    circularLayerB.path = UIBezierPath(arcCenter: center, radius: maximumRadius, startAngle: startAngleB, endAngle: endAngleB, clockwise: true).cgPath
    
    circularLayerC.path = UIBezierPath(arcCenter: center, radius: maximumRadius, startAngle: startAngleC, endAngle: endAngleC, clockwise: true).cgPath
    
  }
}

public extension ProgressView {
  func startAnimating(repeatCount: Float = 0, completion: completion? = nil) {
    circularLayerA.animateRotateFrames(values: [0, 170.deg2rad, 245.deg2rad, 345.deg2rad, 360.deg2rad], times: [0, 0.3, 0.7, 0.9, 1], duration: speed, repeatCount: repeatCount, completion: completion)
    circularLayerB.animateRotateFrames(values: [0, 170.deg2rad, 245.deg2rad, 345.deg2rad, 360.deg2rad], times: [0, 0.3, 0.7, 0.9, 1], duration: speed, repeatCount: repeatCount, completion: completion)
    circularLayerC.animateRotateFrames(values: [0, 170.deg2rad, 245.deg2rad, 345.deg2rad, 360.deg2rad], times: [0, 0.3, 0.7, 0.9, 1], duration: speed, repeatCount: repeatCount, completion: completion)
    
    circularLayerA.strokeAnimation(values: [1, 0.1, 0, 0.95, 1], times: [0, 0.3, 0.7, 0.9, 1], duration: speed, repeatCount: repeatCount)
    circularLayerB.strokeAnimation(values: [1, 0.1, 0, 0.95, 1], times: [0, 0.3, 0.7, 0.9, 1], duration: speed, repeatCount: repeatCount)
    circularLayerC.strokeAnimation(values: [1, 0.1, 0, 0.95, 1], times: [0, 0.3, 0.7, 0.9, 1], duration: speed, repeatCount: repeatCount)
  }
  
  func stopAnimation() {
    allLayers.forEach { $0.removeAllAnimations() }
  }
}
