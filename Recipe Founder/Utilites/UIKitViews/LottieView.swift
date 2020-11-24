//
//  LottieView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 24/11/2020.
//

import Lottie
import SwiftUI



struct LottieView : UIViewRepresentable{
    let fileName:String
    func makeUIView(context: Context) -> UIView {
        /// creating main view
        let view = UIView(frame: .zero)
        /// creating the animation view which will be inside our main view
        let animationView = AnimationView()
        
        /// selecting the animation file from lottties view
        let animation = Animation.named(fileName)
        
        /// setting the animation into the animation view
        animationView.animation = animation
        
        ///scaling the animation
        animationView.contentMode = .scaleAspectFit
        
        /// playing the animation
        animationView.play()
        
        ///enable constrains
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        /// adding the animation view to the main view
        view.addSubview(animationView)
        
        /// setting the constrains values
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo:  view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])
        
        return view
        
    }
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) { }
}
