import UIKit
import AVFoundation
import CoreMedia

class MovieViewController: UIViewController {
    var playerItem : AVPlayerItem!
    var videoPlayer : AVPlayer!
    var seekBar : UISlider!
    
    override func viewDidLoad() {
        
        let path = Bundle.main.path(forResource: "mov", ofType: "mov")
        let fileURL = NSURL(fileURLWithPath: path!)
        let avAsset = AVURLAsset(url: fileURL as URL, options: nil)
        
        playerItem = AVPlayerItem(asset: avAsset)
        
        videoPlayer = AVPlayer(playerItem: playerItem)

        let videoPlayerView = AVPlayerView(frame: CGRect(x: 0,y: 0,width: 300,height: 300))
        let layer = videoPlayerView.layer as! AVPlayerLayer
        layer.videoGravity = AVLayerVideoGravityResizeAspect
        layer.player = videoPlayer
        
        self.view.layer.addSublayer(videoPlayerView.layer)
        self.play()
    }
    
    @IBAction func tapPlayButton(_ sender: UIButton) {
        self.play()
    }
    
    func play(){
        self.videoPlayer.seek(to: CMTimeMake(1, 1000))
        self.videoPlayer.play()
    }
}
