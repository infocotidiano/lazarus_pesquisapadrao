# Lazarus - Formulário de Pesquisa padrão
### PROGRAMA: Formulário de pesquisa padrão
## passando parâmetros entre formulários.

![Daniel de Morais - Infocotidiano](./telapesquisa.png)

# IDE LAZARUS 

### Autor: Daniel de Morais (https://www.youtube.com/user/infocotidiano/)

Exemplo de como criar um formulário de pesquisa padrão, podendo usar em todos sistemas.<br>
Banco de Dados criado em MySQL - Backup da base dentro da pasta basededados.
Componente para conexão com o banco de dados. ZEOSLib

Quando chamar o formulário de pesquisa, passar como parâmetros:<br>
* Array de Campos que serão exibidos<br>
* Nome da Tabela para pesquisa dinâmica<br>
* Campo de retorno<br>

Exemplo:
> frmPesquisa := tfrmPesquisa.Create(self,['codigo','nome','telefone'],'cliente','nome');


### Link para o meu video: (https://youtu.be/LIS3fJSkTL4)
