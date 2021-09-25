import UIKit
extension CGFloat {
  var deg2rad: CGFloat {
    return self * .pi / 180
  }
}

extension Int {
  var deg2rad: CGFloat {
    return CGFloat(self) * .pi / 180
  }
}


extension CALayer {
  typealias AnimationCompletion = (() -> Void)?
  func animateRotateFrames(values: [CGFloat], times: [Double], duration: Double, delay: Double = 0, repeatCount: Float = 0, completion: AnimationCompletion = nil) {
    CATransaction.begin()
    let animation = CAKeyframeAnimation(keyPath: "transform.rotation")
    animation.values = values
    animation.keyTimes = times.map { NSNumber(value: $0) }
    animation.duration = CFTimeInterval(duration)
    animation.fillMode = .forwards
    animation.beginTime = CACurrentMediaTime() + delay
    CATransaction.setCompletionBlock(completion)
    animation.isRemovedOnCompletion = false
    animation.repeatCount = repeatCount
    animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    self.add(animation, forKey: nil)
    CATransaction.commit()

  }
}
extension CAShapeLayer {
  func strokeAnimation(values: [CGFloat], times: [Double], duration: Double, repeatCount: Float = 0) {
    CATransaction.begin()
    let animation = CAKeyframeAnimation(keyPath: "strokeEnd")
    animation.values = values
    animation.keyTimes = times.map { NSNumber(value: $0) }
    animation.duration = duration
    animation.fillMode = .forwards
    animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    animation.isRemovedOnCompletion = false
    animation.repeatCount = repeatCount
    CATransaction.setCompletionBlock {
    }
    self.add(animation, forKey: "line")
    CATransaction.commit()
  }

}
