#!/usr/bin/env sh

##############################################
#"Settar" algumas variáveis para uma execução "perfeita"  do Otto:
##Exportar as duas variaveis de linguagem como "C", para maior performance e velocidade do script.
export LANG=C
export LC_ALL=C

##Especificações do Otto no código do Otto:
export PROG='Otto' 
export VER='0.1.alpha'
export PKG_FORMT='.otpm' #hu3, essa extensão pode mudar no futuro talvez...
export PKG_COMPSS='7z' #irei comprimir o código-fonte do pacote e os OttoBuilds.sh usando o 7z, por conta de sua alta-compressão até em binários.
export HOST_OS=$(uname -s) #Se aparecer "muh GANOO/Lincucks" é por conta de seu sistema usar as coreutils GNU ou por simplesmente autismo de sua distribuição, e não porque o Linux (Kernel) pertence ao GNU.
#^Dica para os outros desenvolvedores: para variáveis simples como essas- exceto pela última onde estou puxando um subshell-, usem sempre aspas simples. 
#O motivo eu possivelmente explicarei na documentação, se não alguém o explicará... mas se resume em velocidade na execução.  

#Carregar biblioteca de variáveis externas, do sistema e do usuário
#configuradas já na instalação do sistema ou do Otto em si: 
source $OTTOETC/make.cfg 

############## FUNÇÕES DO SCRIPT #############
#Aqui é onde fica o "coração" do Otto. 
#function update(){
#}
function pkgdown(){
for torrent in $@; do
	#Estou sem muita certeza do que realmente quero nessa parte...
	#Velocidade:
	#pkgnm=$(echo $torrent | cut -d "/" -f 2)# 
	#...ou desempenho:
	pkgnm=$(cut -d "/" -f 2 <<< $(echo $torrent))
	curl $MIRROR/packages/$torrent.otlnk -O /tmp/$pkgnm.torrent
	sh -c 'python3.8 otto-torrent.py -s -f /tmp/$pkgnm.torrent -d $SRCDIR'
done 
}
#estou enrolando muito para fazer tudo, eu sei. 
function install(){
#A parte mais importante de um gerenciador de pacotes...
#Deixarei-a em branco por enquanto, pois não sei como será a montagem dos pacotes ainda.
#Eu sei, é um buraco de planejamento enorme.
}
function remove(){
}
function upgrade(){
}
function mkpkg(){
}

###############################################
