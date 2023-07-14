<h1 align="center">
	✏️ Inception
</h1>

<p align="center"><br>
Esse projeto visa ampliar seu conhecimento em administração de sistemas usando Docker.
Você vai virtualizar diversas imagens Docker, criando Docker Containers em sua nova máquina virtual.<br>
</p>

<p align="center">
	<img alt="GitHub code size in bytes" src="https://img.shields.io/github/languages/code-size/rafaelabdm/Inception?color=lightblue" />
	<img alt="Code language count" src="https://img.shields.io/github/languages/count/rafaelabdm/Inception?color=yellow" />
	<img alt="GitHub top language" src="https://img.shields.io/github/languages/top/rafaelabdm/Inception?color=blue" />
	<img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/rafaelabdm/Inception?color=green" />
</p>

---

<h2>📦 Sobre o projeto</h2>

> _One container is not enogh. We need to go deeper_
<p>
Nesse projeto temos que criar uma pequena infraestrutura composta de diferentes serviços, seguindo regras específicas:<br><br>
REGRAS GERAIS<br>
  • Usar docker-compose;<br>
  • Cada imagem Docker tem que ter o nome igual ao de seu serviço;<br>
  • Cada serviço tem que rodar em seu próprio container;<br>
  • Os containers tem que ser construídos a partir da penúltima versão estável de Debian ou Alpine;<br>
  • Escrever nossos próprios Dockerfiles;<br>
  • Chamar os Dockerfiles através do docker-compose.yml que, por sua vez, é chamado pelo Makefile;<br>
  • Nenhuma credencial deve estar exposta fora do arquivo .env!!!!!!!!!!!!<br>
  <br>
REGRAS INFRAESTRUTURA:<br>
  • Um container com NGINX usando apenas o protocolo TLSv1.2 ou TLSv1.3;<br>
  • Um container com WordPress + php-fpm, sem NGINX;<br>
  • Um container com MariaDB, sem NGINX;<br>
  • Um volume com a base de dados do WordPress;<br>
  • Um segundo volume com os arquivos do site do WordPress;<br>
  • Uma docker-network que estabelece a conexão entre os containers.<br>

</p>

<h2>🔨 Um pouco sobre os serviços</h2>

<p>
💾<b> MARIADB:</b> Banco de dados, necessário para a instalação do Wordpress (os requisitos são PHP e um banco MySQL já instalados e configurados). Precisamos intalar, 
fazer uma pequena configuração e criar a tabela que o Wordpress vai usar.<br>
🌐<b> WORDPRESS:</b> Nosso site! Ele precisa de um banco de dados e php instalados para conseguir ser usado. Também precisa já estar instalado quando subirmos o container, 
para isso, usaremos wp-cli.<br>
🔒<b> NGINX:</b> Nosso servidor de HTTP e proxy. Vai ser nossa porta de entrada para a infraestrutura que estamos criando. Ele vai lidar com o protocolo de acesso ao nosso site. <br>
</p>

<h2>🤓 Ta, mas e agora? </h2>
<p>
<b>Minha primeira recomendação:</b> estude sobre Docker, se não teve nenhum contato com ele antes desse projeto vai ficar muito complicado de entender o que está acontecendo. Aqui vai um 
vídeo que me ajudou muito, sem preguiça, força... tem 3 horas rs. <br>
[Docker Tutorial for Beginners] (https://www.youtube.com/watch?v=3c-iBn73dDE&list=PLy7NrYWoggjxtN4YbSMYFFdpaxb-fR4zC&ab_channel=TechWorldwithNana "Docker Tutorial for Beginners").
<br><br>
Ok, agora já sabemos sobre Docker, para que serve, como é usado e como facilitou muito a vida dos DevOps. Bora montar nosso próprio Docker?<br>
Eu sinceramente recomendo começar a montar tudo em apenas um container. Principalmente se você nunca tinha mexido com nada parecido com nenhum dos serviços antes (eu mesma). 
Assim podemos ver quais arquivos são gerados quando instalamos algum serviço, onde podemos mexer para conseguir configurar alguma coisa que precisamos e conseguir ver as 
estrutura das pastas geradas.<br>
</p>

<h2>💻 PASSO A PASSO (DEBIAN):</h2>
  1. Instalar o Docker na sua máquina;<br>
  2. Rodar um container base pra começarmos a montá-lo como queremos: <TT> docker run --name mycontainer -p443:443 -p80:80 -dt debian:oldstable </TT>; <br>
  Isso vai procurar a imagem "debian:oldstable" do DockerHub, baixar e subir um container com Debian rodando e com as portas 443 e 80 expostas pra nossa máquina local.<br>
  3. Entrar no container: <TT> docker exec -it mycontainer /bin/bash </TT>; <br>
  Agora você está dentro do container. Qualquer alteração e instalação será feita no container e não na sua máquina local.<br>
  4. Dentro do container, vamos instalar o primeiro serviço, NGINX. Porque? Porque é o único que conseguimos ver funcionando de forma muito simples e sem precisar de nenhum requisito 
  anterios. O Wordpress também é facil de visualizar, mas pracisa do MariaDB instalado.<br> 





