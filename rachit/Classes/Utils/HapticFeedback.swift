import Foundation

public enum NotificationFeedbackType {
    case success, error, warning
    
    @available(iOS 10.0, *)
    func testForNotificationFeedbackGeneratorFeedbackTypeCases() {
        let a = UINotificationFeedbackGenerator.FeedbackType.success
        switch a {
        case .success, .warning, .error :
            debugPrint("implemented")
        @unknown default:
            debugPrint("not implemented")
        }
    }
    
    
    @available(iOS 10.0, *)
    func notificationFeedbackGeneratorFeedbackType() -> UINotificationFeedbackGenerator.FeedbackType {
        switch self {
        case .success:
            return UINotificationFeedbackGenerator.FeedbackType.success
        case .warning:
            return UINotificationFeedbackGenerator.FeedbackType.warning
        case .error:
            return UINotificationFeedbackGenerator.FeedbackType.error
        }
    }
}

public enum ImpactFeedbackStyle {
    case light, medium, heavy, soft, rigid
    
    @available(iOS 10.0, *)
    func testForImpactFeedbackGeneratorFeedbackStyle() {
        let a = UIImpactFeedbackGenerator.FeedbackStyle.light
        switch a {
        case .light, .medium, .heavy: //.soft, .rigid :
            debugPrint("implemented")
        default :
            debugPrint("not implemented")
        }
    }
    
    @available(iOS 10.0, *)
    func impactFeedbackGeneratorFeedbackStyle() -> UIImpactFeedbackGenerator.FeedbackStyle {
        switch self {
        case .light:
            return .light
        case .medium:
            return .medium
        case .heavy:
            return .heavy
        case .soft:
            return .light
        case .rigid:
             return .heavy
        }
    }
}

public enum HapticFeedback {
    case notification(NotificationFeedbackType)
    case selectionChanged
    case impact(ImpactFeedbackStyle)
    
    public func provideFeedback() {
        if #available(iOS 10.0, *) {
            switch self {
            case .notification(let type):
                provideNotificationFeedback(for: type.notificationFeedbackGeneratorFeedbackType())
            case .selectionChanged:
                provideSelectionChangedFeedback()
            case .impact(let style):
                provideImpactFeedback(for: style.impactFeedbackGeneratorFeedbackStyle())
            }
        }
    }
    
    @available(iOS 10.0, *)
    private func provideNotificationFeedback(for type: UINotificationFeedbackGenerator.FeedbackType) {
        DispatchQueue.main.async {
            let feedbackGenerator = UINotificationFeedbackGenerator()
            feedbackGenerator.notificationOccurred(type)
        }
    }
    
    @available(iOS 10.0, *)
    private func provideSelectionChangedFeedback() {
        DispatchQueue.main.async {
            let feedbackGenerator = UISelectionFeedbackGenerator()
            feedbackGenerator.selectionChanged()
        }
    }
    
    @available(iOS 10.0, *)
    private func provideImpactFeedback(for style: UIImpactFeedbackGenerator.FeedbackStyle) {
        DispatchQueue.main.async {
            let feedbackGenerator = UIImpactFeedbackGenerator(style: style)
            feedbackGenerator.impactOccurred()
        }
    }
}
