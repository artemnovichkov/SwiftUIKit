import UIKit
import PlaygroundSupport

@_functionBuilder
struct ViewBuilder {

    static func buildBlock(_ children: UIView...) -> UIView {
        let view = UIView()
        for child in children {
            view.addSubview(child)
        }
        return view
    }
}

extension UIView {

    static func make(frame: CGRect = .zero, @ViewBuilder builder: () -> UIView) -> UIView {
        let view = builder()
        view.frame = frame
        return view
    }

    func frame(_ frame: CGRect) -> UIView {
        self.frame = frame
        return self
    }

    func foregroundColor(_ color: UIColor) -> UIView {
        backgroundColor = color
        return self
    }

    func cornerRadius(_ cornerRadius: CGFloat) -> UIView {
        layer.cornerRadius = cornerRadius
        return self
    }
}

let view = UIView.make(frame: .init(x: 0, y: 0, width: 100, height: 100)) {
    UIView.make(frame: .init(x: 0, y: 0, width: 100, height: 50)) {
        UILabel()
            .frame(.init(x: 0, y: 0, width: 100, height: 50))
            .foregroundColor(.red)
            .cornerRadius(8)
    }
    UILabel()
        .frame(.init(x: 0, y: 50, width: 100, height: 50))
        .foregroundColor(.green)
}

PlaygroundPage.current.liveView = view
