# ixtrator

![GitHub stars](https://img.shields.io/github/stars/matiasdev30/ixtrator?style=flat-square)
![GitHub forks](https://img.shields.io/github/forks/matiasdev30/ixtrator?style=flat-square)
![GitHub issues](https://img.shields.io/github/issues/matiasdev30/ixtrator?style=flat-square)
![GitHub license](https://img.shields.io/github/license/matiasdev30/ixtrator?style=flat-square)

**ixtrator** é uma ferramenta que simplifica a geração de classes abstratas em Dart a partir de classes concretas. Com este utilitário, você pode automatizar a criação de interfaces abstratas para suas classes, economizando tempo e reduzindo erros.

## Como usar

1. **Instalação**: Você pode instalar o **ixtrator** via Pub, o gerenciador de pacotes do Dart. Basta adicionar o seguinte ao seu `pubspec.yaml`:

    ```yaml
    dev_dependencies:
      ixtrator: ^versão
    ```

2. **Execução**: Após a instalação, você pode usar o **ixtrator** para gerar classes abstratas. Por exemplo:

    ```bash
    pub run ixtrator --input=<caminho_do_arquivo> --output=<caminho_de_saída>
    ```

    Certifique-se de substituir `<caminho_do_arquivo>` pelo caminho para o arquivo de origem e `<caminho_de_saída>` pelo caminho onde você deseja salvar a classe abstrata gerada.

3. **Exemplo**: Aqui está um exemplo de uso básico:

    ```dart
    // Classe de origem
    class MinhaClasse {
      int soma(int a, int b) => a + b;
    }

    // Após a execução do ixtrator, você obtém uma classe abstrata correspondente:
    abstract class IMinhaClasse {
      int soma(int a, int b);
    }
    ```

## Contribuição

Contribuições são bem-vindas! Se você encontrar algum problema, tiver uma ideia de melhoria ou desejar contribuir com código, fique à vontade para abrir uma *issue* ou enviar um *pull request*.

## Licença

Este projeto é licenciado sob a [Licença MIT](LICENSE).
