import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';



class PguploadPage extends StatefulWidget {
  @override
  _PguploadPageState createState() => _PguploadPageState();

}

class _PguploadPageState extends State<PguploadPage> {
  String? _tipoOperadora = 'Pessoa Física';
  Map<String, String?> _uploadedFiles = {}; // Armazenar os nomes dos arquivos anexados

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Center(
          child: Text(
            '',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[300],
          padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logogdf.png',
                    width: 210,
                    height: 110,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SECRETARIA DE TRANSPORTE E MOBILIDADE',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontFamily: 'Open Sans',
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                        SizedBox(height: 0),
                        Text(
                          'SEMOB',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Open Sans',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                color: Color(0xFF005EB8),
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Cadastro de Operador',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tipo da Operadora',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Pessoa Física'),
                            value: 'Pessoa Física',
                            groupValue: _tipoOperadora,
                            onChanged: (value) {
                              setState(() {
                                _tipoOperadora = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Pessoa Jurídica de Direito Privado'),
                            value: 'Pessoa Jurídica de Direito Privado',
                            groupValue: _tipoOperadora,
                            onChanged: (value) {
                              setState(() {
                                _tipoOperadora = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Pessoa Jurídica de Direito Público'),
                            value: 'Pessoa Jurídica de Direito Público',
                            groupValue: _tipoOperadora,
                            onChanged: (value) {
                              setState(() {
                                _tipoOperadora = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    if (_tipoOperadora == 'Pessoa Física') _buildPessoaFisicaFields(),
                    if (_tipoOperadora == 'Pessoa Jurídica de Direito Privado') _buildPessoaJuridicaPrivadaFields(),
                    if (_tipoOperadora == 'Pessoa Jurídica de Direito Público') _buildPessoaJuridicaPublicaFields(),
                    
                    // Ação do botão
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            
                          //Personalização do botão  
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900],
                            foregroundColor: Colors.white,
                          ),
                          icon: const Icon(Icons.check),
                          label: const Text("Enviar"),
                          ),
                        ),
                      ), 
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//posicionar o botao de anexar 
Widget _buildColumnWithFieldAndButton(String title, String buttonLabel, String buttonText) {
  return Column(
    children: [
      _buildSingleTextField(title),
      SizedBox(height: 10),
      _buildUploadButton(buttonLabel, buttonText),
    ],
  );
}

  // Função para criar e personalizar os campos 
  Widget _buildSingleTextField(String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
  );
}
 //posicionar os campos um em baixo do outro
  Widget _buildPessoaFisicaFields() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Documentos para Pessoa Física', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,)),
      SizedBox(height: 8),

      // Campos com botões abaixo
      _buildSingleTextField('CPF'),
      _buildUploadButton('', 'inserir foto do CPF'),
      SizedBox(height: 25),

      _buildSingleTextField('RG'),
      _buildUploadButton('', 'inserir foto da Identidade'),
      SizedBox(height: 25),   
      // Nova linha com 4 campos
      Row(
        children: [
          Expanded(child: _buildSingleTextField('UF')),
          Expanded(child: _buildSingleTextField('Bairro')),
          Expanded(child: _buildSingleTextField('Endereço')),
          Expanded(child: _buildSingleTextField('CEP')),
        ],
      ),

      // Botões de upload separados
      _buildUploadButton('', 'inserir Comprovante de Residência'), //cep
      SizedBox(height: 25),
    ],
  );   
}

  Widget _buildPessoaJuridicaPrivadaFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Documentos para Pessoa Jurídica de Direito Privado', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,)),
        SizedBox(height: 8),

        //campos de linha unica e botao de upload abaixo
        _buildSingleTextField('cnpj'),
        _buildUploadButton('', 'inserir Comprovante de Inscrição e Situação Cadastral'),
        SizedBox(height: 25),

        _buildSingleTextField( 'Número de Inscrição (INSS)'),
        _buildUploadButton('', 'inserir Contrato Social e suas alterações'),
        SizedBox(height: 25),
      // Nova linha com 4 campos
      Row(
          children: [
             Expanded(child: _buildSingleTextField('UF')),
            Expanded(child: _buildSingleTextField('Bairro')),
            Expanded(child: _buildSingleTextField('Endereço')),
            Expanded(child: _buildSingleTextField('CEP')),
          ],
        ),  

        _buildUploadButton('', 'inserir Comprovante de Residência'),//cep
        SizedBox(height: 25),
      ],
    );
  }

  Widget _buildPessoaJuridicaPublicaFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Documentos para Pessoa Jurídica de Direito Público', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,)),
        SizedBox(height: 8),

          //campos de linha unica
        _buildSingleTextField('CNPJ'),
        _buildUploadButton('', 'inserir Comprovante de Inscrição e Situação Cadastral'),
        SizedBox(height: 25),

        _buildSingleTextField('Número do Cartão de Cadastro (CF/DF)'),
        _buildUploadButton('', 'inserir Ato de Instituição e suas Alterações'),
        SizedBox(height: 25),

       // Nova linha com 4 campos
       Row(
          children: [
            Expanded(child: _buildSingleTextField('UF')),
            Expanded(child: _buildSingleTextField('Bairro')),
            Expanded(child: _buildSingleTextField('Endereço')),
            Expanded(child: _buildSingleTextField('CEP')),
          ],
        ),  

         _buildUploadButton('', 'inserir Comprovante de Residência'), //cep
         SizedBox(height: 25),
      ],
    );
  }



  // Função para exibir o botão de upload com a funcionalidade de alterar/excluir o arquivo
  Widget _buildUploadButton(String label, String buttonText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label),
      SizedBox(height: 8),
      Center(
        child: SizedBox(
          width: 250, // Largura fixa para todos os botões
          child: Stack(
            alignment: Alignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  String? result = await _pickFile(); // Pegar o arquivo usando file_picker
                  if (result != null) {
                    setState(() {
                      _uploadedFiles[label] = result; // Armazenar o nome do arquivo
                    });
                  }
                },
                child: Container(
                  width: double.infinity, // Faz o conteúdo do botão ocupar toda a largura disponível
                  child: Text(
                    buttonText,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center, // Centraliza o texto
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  backgroundColor: Color(0xFF005EB8),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                ),
              ),
              if (_uploadedFiles[label] != null)
                Positioned(
                  right: 0,
                  top: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _uploadedFiles[label] = null; // Excluir o arquivo anexado
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.close, size: 12, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      if (_uploadedFiles[label] != null)
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Arquivo anexado: ${_uploadedFiles[label]}',
            style: TextStyle(fontSize: 14, color: Colors.blue),
            textAlign: TextAlign.center,
          ),
        ),
      SizedBox(height: 16),
    ],
  );
}

  // Função para abrir o File Picker e selecionar um arquivo PDF
  Future<String?> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      PlatformFile file = result.files.first;
      return file.name; // Retorna o nome do arquivo selecionado
    }
    return null; // Retorna null se nenhum arquivo for selecionado
  }
}