<p align="center"><img src="https://laravel.com/assets/img/components/logo-laravel.svg"></p>
<h2>API RESTFul em LARAVEL para utilização de uma enquete.</h2>

1º Crie o banco de dados, foi utilizado o MariaDB e o SQL para criação do mesmo se encontra na pasta database com o nome de: 
<strong>BD.SQL.</strong> Importe este arquivo.

<br>

2º Utilize um servidor web PHP de sua preferência, no meu caso eu utilizei o XAMPP.
Coloque todos os arquivos do .git dentro de uma pasta no servidor e ative o serviço do banco de dados e servidor.

<br>

3º Utilizando o git, vá até a pasta extraida e digite: php artisan serve

<br>

3º Rotas disponíveis:
<br>
- Criação de enquete:<br>
<strong>Método POST</strong><br>
/enquete/{desc}/{op1}/{op2}/{op3}<br>
Sendo:<br>
{desc} = Nome da Enquete<br>
{op1}  = Primeira opção da enquete<br>
{op2}  = Segunda opção da enquete<br>
{op3}  = Terceira da enquete
<br>

- Consultar todas as enquetes:<br>
<strong>Métodos GET</strong><br>
/enquetes
<br>

- Consultar uma enquete específica:<br>
/enquete/{id}<br>
Sendo:<br>
{id} = ID da enquete
<br>

- Consultar estatísticas:<br>
/enquete/{id}/stats<br>
Sendo:<br>
{id}   = ID da enquete
<br>

- Editar descrição de enquete específica:<br>
<strong>Método PUT</strong><br>
/enquete/{desc}/{id}<br>
Sendo:<br>
{desc} = Nome da Enquete<br>
{id}   = ID da enquete
<br>


- Excluir enquete específica:<br>
<strong>Método DELETE</strong><br>
/enquete/{id}<br>
Sendo:<br>
{id}   = ID da enquete
<br>




