<p align="center"><img src="https://laravel.com/assets/img/components/logo-laravel.svg"></p>
<h1>API RESTFul em LARAVEL para utilização de uma enquete.</h1>

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
/enquete/{desc}/{op1}/{op2}/{op3}
<br>
Sendo:<br>
{desc} = Nome da Enquete<br>
{op1}  = Primeira opção da enquete<br>
{op2}  = Segunda opção da enquete<br>
{op3}  = Terceira da enquete<br>


- Para consulta de todas as enquetes:
<strong>Método GET</strong><br>
/enquetes
<br>


