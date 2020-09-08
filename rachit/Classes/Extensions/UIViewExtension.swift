import UIKit

public extension UIView {
    
    class func loadFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }

    func makeRoundWithColor(color : UIColor){
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 1.0
    }
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    class func nib() -> UINib {
        return UINib(nibName: className, bundle: nil)
    }
    
    func addCornerRadiusAnimation(from: CGFloat, to: CGFloat, duration: CFTimeInterval)
    {
        let animation = CABasicAnimation(keyPath:"cornerRadius")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.fromValue = from
        animation.toValue = to
        animation.duration = duration
        layer.add(animation, forKey: "cornerRadius")
        layer.cornerRadius = to
    }
    
    func initialize(withOwnerName ownerName: String) {
        let contentView = UINib(nibName: ownerName, bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
        contentView.frame = bounds
        contentView.isUserInteractionEnabled = self is UIControl != true
        contentView.backgroundColor = UIColor.clear
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(contentView)
    }
    
    var screenshot: UIImage{
        self.setNeedsLayout()
        self.layoutIfNeeded()
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext();
        self.layer.render(in: context!)
        let screenShot = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return screenShot!
    }
    
    func prepareForCustomConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func makeDashedBorderLine(lineDashPattern : [NSNumber], lineDashWidth : CGFloat) {
        let path = CGMutablePath()
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = lineDashWidth
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineDashPattern = lineDashPattern
        path.addLines(between: [CGPoint(x: bounds.minX, y: bounds.height/2),
                                CGPoint(x: bounds.maxX, y: bounds.height/2)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
    
    func setGradient(colors : [UIColor], startPoint : CGPoint, endPoint : CGPoint) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = colors.map({ $0.cgColor })
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func makeViewRound(color: UIColor) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 1.0
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.width/2
    }
    
    func rotateTo(angle: CGFloat, duration: TimeInterval = 0.0) {
        UIView.animate(withDuration: duration) {
            let degrees: CGFloat = angle //the value in degrees
            let radians: CGFloat = degrees * (.pi / 180)
            self.transform = CGAffineTransform(rotationAngle: radians)
        }
    }
    
    func scaleIntoTopLeftCorner(){
        let positionAnimation = CABasicAnimation(keyPath: "bounds")
        positionAnimation.fromValue =  self.bounds
        positionAnimation.toValue = CGRect.zero
        positionAnimation.duration = 1
        self.layer.animation(forKey: "bounds")
    }
    
    func scaleBackFromTopLeftCorner(){
        
        let positionAnimation = CABasicAnimation(keyPath: "bounds")
        positionAnimation.toValue =  self.superview!.bounds
        positionAnimation.fromValue = CGRect.zero
        positionAnimation.duration = 1
        self.layer.animation(forKey: "bounds")
    }
    
    func applyTransform(withScale scale: CGFloat, anchorPoint: CGPoint) {
        let xPadding = (scale - 1) * (anchorPoint.x - 0.5) * bounds.width
        let yPadding = (scale - 1) * (anchorPoint.y - 0.5) * bounds.height
        transform = CGAffineTransform(scaleX: scale, y: scale).translatedBy(x: xPadding, y: yPadding)
    }
    
}
