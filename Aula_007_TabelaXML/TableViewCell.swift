
import UIKit

class TableViewCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var labelEsquerda: UILabel!
    @IBOutlet weak var labelDireita: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    

}
