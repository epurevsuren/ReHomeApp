import UIKit

class ViewController: UIViewController {
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(logoImageView)
        
        // Center the logo in the view
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // Start the animation
        animateLogo()
    }
    
    func animateLogo() {
        // Fade-in animation
        logoImageView.alpha = 0
        UIView.animate(withDuration: 1.0, animations: {
            self.logoImageView.alpha = 1.0
        }) { _ in
            // Rotate animation
            let rotation = CABasicAnimation(keyPath: "transform.rotation")
            rotation.fromValue = 0
            rotation.toValue = Double.pi * 2
            rotation.duration = 2
            rotation.repeatCount = .infinity
            self.logoImageView.layer.add(rotation, forKey: "rotationAnimation")
            
            // Scale animation
            let scale = CABasicAnimation(keyPath: "transform.scale")
            scale.fromValue = 1.0
            scale.toValue = 1.5
            scale.duration = 1.0
            scale.autoreverses = true
            scale.repeatCount = .infinity
            self.logoImageView.layer.add(scale, forKey: "scaleAnimation")
        }
    }
}
