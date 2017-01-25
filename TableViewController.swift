import UIKit

class TableViewController: UITableViewController, MeuParserDelegate {
    
    //MARK: Propriedades
    var arrayResultado : Array<Dictionary<String, String>> = []
    
    //MARK: Outlets
    @IBOutlet var minhaTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        registrarCelula()
        
        let parsear = MeuParser()
        parsear.delegate = self
        parsear.inciarParse()
        
        minhaTableView.delegate = self
        minhaTableView.dataSource = self
        

    }

    //MARK: TableView DataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayResultado.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celulaPersonalizada", for: indexPath) as! TableViewCell
        
        //var dicTemp = arrayResultado[indexPath.row]
        cell.labelDireita.text = arrayResultado[indexPath.row]["idade"]
        cell.labelEsquerda.text = arrayResultado[indexPath.row]["nome"]
       
        return cell
    }
    
    //MARK: Métodos Personalizados
    func registrarCelula() {
        minhaTableView.register(UINib(nibName: "celulaPersonalizada", bundle: nil), forCellReuseIdentifier: "celulaPersonalizada")
    }

    //MARK: Métodos de MeuPaserDelegate
    func meuParserFinalizou(_ resultado: Array<Dictionary<String, String>>) {
        arrayResultado = resultado
        minhaTableView.reloadData()
    }


}
