import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black87),
          bodyMedium: TextStyle(color: Colors.black54),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.blueAccent),
      ),
      home: PguploadPage(),
    );
  }
}

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
                    
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Ação do botão aqui
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900],
                            foregroundColor: Colors.white,
                          ),
                          icon: const Icon(Icons.check),
                          label: const Text("Cadastrar"),
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

  // Função para construir os campos lado a lado
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
  Widget _buildPessoaFisicaFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Documentos para Pessoa Física', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,)),
        SizedBox(height: 8),
        _buildSingleTextField('Número do CPF'),
        _buildSingleTextField('Número da Carteira de Identidade'),
        _buildSingleTextField('Endereço'),
        _buildSingleTextField('UF'),
        _buildSingleTextField('Bairro'), 
        _buildSingleTextField('CEP'),
        
        SizedBox(height: 16),
        _buildUploadButton('Cópia do CPF'),
        _buildUploadButton('Cópia da Carteira de Identidade'),
        _buildUploadButton('Cópia do comprovante de residência (EM NOME DO CONTRATADO)'),
        _buildUploadButton('Certidão Negativa de Débitos junto à Secretaria de Estado de Fazenda do DF'),
      ],
    );
  }

  Widget _buildPessoaJuridicaPrivadaFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Documentos para Pessoa Jurídica de Direito Privado', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,)),
        SizedBox(height: 8),
        _buildSingleTextField('Número do CNPJ'),
        _buildSingleTextField( 'Número de Inscrição (INSS)'),
        _buildSingleTextField('Endereço'),
        _buildSingleTextField('UF'),
        _buildSingleTextField('Bairro'),
        _buildSingleTextField('CEP'),


        SizedBox(height: 16),
        _buildUploadButton('Cópia do CNPJ - Comprovante de Inscrição e Situação Cadastral'),
        _buildUploadButton('Contrato Social e suas alterações'),
        _buildUploadButton('Certidão Negativa de Débitos Relativos aos Tributos Federais'),
        _buildUploadButton('Cópia do comprovante de endereço (EM NOME DA EMPRESA)'),
        _buildUploadButton('Certidão Negativa de Débitos junto à Secretaria de Estado de Fazenda do DF'),
      ],
    );
  }

  Widget _buildPessoaJuridicaPublicaFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Documentos para Pessoa Jurídica de Direito Público', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,)),
        SizedBox(height: 8),
        _buildSingleTextField('Número do CNPJ'),
        _buildSingleTextField('Número do Cartão de Cadastro (CF/DF)'),
        _buildSingleTextField('Endereço'),
        _buildSingleTextField('UF'),
        _buildSingleTextField('Bairro'),
        _buildSingleTextField( 'CEP'),
        SizedBox(height: 16),
        _buildUploadButton('Cópia do CNPJ - Comprovante de Inscrição e Situação Cadastral'),
        _buildUploadButton('Ato de instituição e suas alterações'),
        _buildUploadButton('Cópia do comprovante de endereço (EM NOME DA ENTIDADE)'),
        _buildUploadButton('Cópia do Cartão de Cadastro Fiscal do DF (CF/DF)'),
        _buildUploadButton('Guias de Recolhimento do ISS ou ICMS'),
      ],
    );
  }

  // Função para exibir o botão de upload com a funcionalidade de alterar/excluir o arquivo
  Widget _buildUploadButton(String label) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label),
      SizedBox(height: 8),
      Center(
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
              child: Icon(
                _uploadedFiles[label] == null ? Icons.attach_file : Icons.edit,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(), backgroundColor: Color(0xFF005EB8),
                padding: EdgeInsets.all(10), // Azul da página
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
//nadinha
