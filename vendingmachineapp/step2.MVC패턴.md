**요구사항**

- MVC패턴을 이용하여 구현
- 자판기 화면을 만들고 기능구현

**문제해결**

1. 오토레이아웃을 이용하여 음료 이미지뷰들을 예쁘게 정렬

   이미지들을 `stack view`에 넣고 stack view에 Add new constraints를 추가 해주면 자동으로 이미지들의 사이즈와 위치가 고정됨

   - 양 옆, 위 의 사이즈
   - 높이

2. 추가 버튼을 누르면 어떤 음료의 재고가 추가되는지 어떻게 알지?

   2-1. 이미지들을 collectionView 사용하여 로드시키기

   ```swift
   import UIKit
   
   class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
       
       private var beverageImg = ["딸기우유.jpg","스프라이트.jpg","초코우유.jpg","카누아이스블랜드.jpg","콜라.jpeg","TOP라떼.jpeg"]
       
       override func viewDidLoad() {
           super.viewDidLoad()
       }
   
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return beverageImg.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeverageCell", for: indexPath) as! BeverageCellCV
           cell.img.image = UIImage(named: beverageImg[indexPath.row])
           return cell
       }
   }
   
   class BeverageCellCV: UICollectionViewCell {
       @IBOutlet weak var img: UIImageView!
   }
   ```

   <img width="897" src="https://user-images.githubusercontent.com/31604976/61434147-25602500-a970-11e9-8631-ce6113ede5d1.png">

   <img src="https://user-images.githubusercontent.com/31604976/61434485-1168f300-a971-11e9-9639-c141111ee6af.png">

   참고 :

   https://medium.com/yay-its-erica/creating-a-collection-view-swift-3-77da2898bb7c

   https://abc1211.tistory.com/461

   https://iw90.tistory.com/241

   https://marlboroyw.tistory.com/529

3. 이미지뷰 테두리 둥글게 하기

   ```swift
    @IBOutlet weak var img: UIImageView! { didSet { setImgCornerRound() } }
       
       func setImgCornerRound() {
           img.layer.cornerRadius = 10
           //img.layer.masksToBounds = true
         img.layer.borderColor = UIColor.black.cgColor
           img.layer.borderWidth = 1.0
       }
   ```

   **masksToBounds의 역할**

   masksToBounds이 없어도 이미지뷰의 테두리는 둥글게 만들어지는데 이 메소드를 사용하는 이유! 뷰위의 콘텐츠가 영향을 받게 할지 안할지에 대한 옵션 같은 것.

   true로 설정하면 콘텐츠에 영향이 가게 되고 false로 하면 영향이 안감.

   참고 : https://zeddios.tistory.com/37

   

   **masksToBounds는 사용하지 않고 이미지뷰의 테두리색을 넣어봄**

   borderColor를 사용하면 되는데 이것을 사용하기 위해선 borderWidth를 꼭 같이 사용해줘야 한다.

   <img src="https://user-images.githubusercontent.com/31604976/61512647-91f12780-aa35-11e9-842c-823da12508a7.png">

4. 추가 버튼을 누르면 객체 생성 -> 각 버튼에 tag를 부여해서 이벤트 연결?

   addTarget을 이용하여 해결