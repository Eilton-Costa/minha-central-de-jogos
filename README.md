# 🎮 Minha Central de Jogos

Uma central de jogos para organizar sua biblioteca, acompanhar suas atividades e reunir seus jogos favoritos em um único lugar.

## ✨ Funcionalidades

- 📚 Biblioteca para organizar jogos.
- ⭐ Sistema de favoritos.
- 🕹️ Integração com controles, incluindo GameSir.
- 📊 Histórico e registro do tempo de jogo.
- 🏆 Sistema de conquistas.
- 💾 Backup e restauração de dados.
- 🎨 Personalização visual.
- 🎬 Protetor de tela com vídeos do YouTube.
- 👤 Personalização do nome do jogador.

## 🖥️ Requisitos

- Windows 10 ou superior.
- Para executar o instalador: não é necessário instalar Python separadamente.
- Para desenvolver ou gerar o executável:
  - Python 3.11 ou superior.
  - Inno Setup para gerar o instalador.

## 📥 Instalação

1. Acesse a seção **Releases** deste repositório.
2. Baixe o instalador mais recente.
3. Execute `Instalador_Minha_Central_de_Jogos.exe`.
4. Informe seu nome durante a instalação.
5. Conclua a instalação e abra o aplicativo.

## 🛠️ Como gerar seu próprio instalador

1. Instale o Python 3.11 ou superior.
2. Baixe ou clone este repositório.
3. Execute o arquivo `PREPARAR_INSTALADOR.bat`.
4. Aguarde a instalação das dependências e a geração do executável.
5. Abra `installer/MinhaCentralDeJogos.iss` no Inno Setup Compiler.
6. Compile o instalador.

O executável será gerado na pasta `output`.

## 🔑 Integração com YouTube

A funcionalidade de vídeos do YouTube pode exigir uma chave própria da API do YouTube Data API v3.

A chave deve ser cadastrada nas configurações do aplicativo. Não compartilhe sua chave pessoal.

## 📂 Estrutura do projeto

```text
Minha_Central_de_Jogos/
├── app/
│   └── main.py
├── assets/
│   ├── branding/
│   └── capas/
├── database/
├── installer/
│   └── MinhaCentralDeJogos.iss
├── PREPARAR_INSTALADOR.bat
├── requirements.txt
├── .gitignore
└── README.md
```

## 📌 Versão

**1.0.0**

## 👨‍💻 Sobre o projeto

Minha Central de Jogos é um projeto independente, desenvolvido para uso e distribuição gratuita, conforme os termos da licença.

## 🤝 Contribuições

Sugestões, melhorias e contribuições são bem-vindas!

## 📄 Licença

Este projeto utiliza a licença **PolyForm Noncommercial 1.0.0**.

É permitido utilizar, estudar, modificar e compartilhar o projeto conforme os termos da licença.

O uso comercial não é permitido. Consulte o arquivo [LICENSE](LICENSE) para conhecer os termos completos.