#!/usr/bin/env sh

#Otto-PKG - Ein Paketmanager, der Pakete �ber BitTorrent herunterl�dt.

#BSD 2-Clause License

#Copyright (c) 2019~2020, Luiz Ant�nio Rangel et Projeto Pindorama
#All rights reserved.
#
#Redistribution and use in source and binary forms, with or without
#modification, are permitted provided that the following conditions are met:
#
#1. Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.
#
#2. Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
#
#THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
#AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
#IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
#FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
#DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
#SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
#CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
#OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
#OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#Depend�ncias: 
#Python 3.{4 or 8}
#Libtorrent and Libtorrent bindings for Python 3.x
#cURL
#POSIX 7-Zip (p7zip)

#TO DO
#Deixar essa merda em alpha pelo menos.
#Tentar portar para outros UNIX-Compat�veis.
#Deixar o mais otimizado o poss�vel.

##############################################
#"Settar" algumas variáveis para uma execução "perfeita"  do Otto:
##Exportar as duas variaveis de linguagem como "C", para maior performance e velocidade do script.
export LANG=C
export LC_ALL=C

##Especificações do Otto no código do Otto:
export PROG='Otto' 
export VER='0.1.alpha'
export PKG_FORMT='.otpm' 
export PKG_COMPSS='7z' 
export HOST_OS=$(uname -s) 
#^Dica para os outros desenvolvedores: para variáveis simples como essas- exceto pela última onde estou puxando um subshell-, usem sempre aspas simples. 
#O motivo eu possivelmente explicarei na documentação, se não alguém o explicará... mas se resume em velocidade na execução.  

#Carregar biblioteca de variáveis externas, do sistema e do usuário
#configuradas já na instalação do sistema ou do Otto em si: 
source $OTTOETC/make.cfg 

############## FUNÇÕES DO SCRIPT #############

function chkroot(){
if 	[ `id -u` -eq 0 ] 
then 
	echo "Login wie root user."
	exit 1
fi
}

function pkgdown(){
for torrent in $@; do
	#Estou sem muita certeza do que realmente quero nessa parte...
	#Velocidade:
	#pkgnm=$(echo $torrent | cut -d "/" -f 2) 
	#...ou desempenho:
	pkgnm=$(cut -d '/' -f 2 <<< $(echo $torrent))
	curl $MIRROR/packages/$torrent.otlnk -O /tmp/$pkgnm.torrent
	sh -c 'python3.8 otto-torrent.py -s -f /tmp/$pkgnm.torrent -d $SRCDIR'
done 
}

#estou enrolando muito para fazer tudo, eu sei. 
function install(){
    chkroot
}
function remove(){
    chkroot
}
function upgrade(){
    chkroot
}
function mkpkg(){

}

function info(){
    printf 'Otto Paketmanager version $VER.'
    printf 'LÃ¤uf t@ $HOST_OS.'
    printf 'Paketformat $PKG_FORMT.'
    printf 'Copyright (c) 2019~2020 Luiz AntÃnio Rangel et Project Pindorama.'
}
###############################################
