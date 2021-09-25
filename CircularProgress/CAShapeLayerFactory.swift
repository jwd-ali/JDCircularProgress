import UIKit
public class CAShapeLayerFactory {

  public class func createShapeLayer<T: CAShapeLayer>(withFillColor fillColor: UIColor = .clear, strokeColor: UIColor, lineCap: CAShapeLayerLineCap = .round, lineWidth: CGFloat = 15) -> T {
    let shapeLayer = T()
    shapeLayer.fillColor = fillColor.cgColor
    shapeLayer.strokeColor = strokeColor.cgColor
    shapeLayer.lineCap = lineCap
    shapeLayer.lineWidth = lineWidth
    shapeLayer.shadowOffset = .zero
    shapeLayer.shadowOpacity = 0.8
    shapeLayer.shadowColor = UIColor.white.cgColor
    shapeLayer.shadowRadius = 10
    return shapeLayer
  }
}
