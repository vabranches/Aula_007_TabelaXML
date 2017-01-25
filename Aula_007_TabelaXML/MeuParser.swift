
import UIKit

class MeuParser: NSObject , XMLParserDelegate {
    
    //MARK: Propriedades
    var arrayPessoas : [Dictionary<String, String>] = []
    var dicionarioAluno = [String : String]()
    var tagAtual = String()
    var conteudoTag = String()
    var delegate : MeuParserDelegate?
    
    
    //MARK: Métodos de XMLParserDelegate
    func parserDidStartDocument(_ parser: XMLParser) {
        print("Iniciou a leitura do documento XML")
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        self.delegate?.meuParserFinalizou(arrayPessoas)
        print(arrayPessoas)
        print("Finalizou a leitura do documento XML")
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        tagAtual = elementName
        if elementName == "nome" || elementName == "idade" {
            conteudoTag = ""
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "nome" || elementName == "idade" {
            dicionarioAluno[elementName] = conteudoTag
            conteudoTag = ""
            tagAtual = ""
        }
        
        if elementName == "aluno"{
            arrayPessoas += [dicionarioAluno]
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if tagAtual == "nome" || tagAtual == "idade" {
            conteudoTag = string
        }
    }
    
    
    //MARK: Métodos Personalizados
    func inciarParse() {
        let caminhoArquivo = Bundle.main.path(forResource: "dados", ofType: "xml")
        let urlArquivo = URL(fileURLWithPath: caminhoArquivo!)
        let meuXMLParser = XMLParser(contentsOf: urlArquivo)
        meuXMLParser?.delegate = self
        meuXMLParser?.parse()
    }
}
