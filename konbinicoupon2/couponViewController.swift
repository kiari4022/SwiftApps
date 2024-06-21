import UIKit



class couponViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    {
        didSet {
            pageControl.isUserInteractionEnabled = false
        }
    }
    
    @IBOutlet weak var scrollVIew: UIScrollView!
    {
        didSet {
            scrollVIew.delegate = self
            scrollVIew.isPagingEnabled = true
            scrollVIew.showsHorizontalScrollIndicator = false
        }
    }
    
    private let scrollHeight: CGFloat = 698.0
    private let imageWidth: CGFloat = UIScreen.main.bounds.width
    
    private lazy var images: [UIImage] = {
        return [UIImage(named: "0")!,
                UIImage(named: "1")!,
                UIImage(named: "2")!,
                UIImage(named: "3")!]
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImages()
    }
    

    
    
    func setupImages() {
           scrollVIew.contentSize = CGSize(width: imageWidth * CGFloat(images.count),
                                                 height: scrollHeight)
           images.enumerated().forEach { index, image in
               let imageView = UIImageView(frame: CGRect(x: imageWidth * CGFloat(index),
                                                         y: 0,
                                                         width: imageWidth,
                                                         height: scrollHeight))
               imageView.image = image
               imageView.contentMode = .scaleAspectFit
               scrollVIew.addSubview(imageView)
           }
           pageControl.numberOfPages = images.count
       }
   }
    
extension couponViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
    }
    
    
    
    
    
}
