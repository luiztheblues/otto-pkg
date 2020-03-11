'''
otto-torrent.py.
Criado para ser usado no Gerenciador de Pacotes OTTO. 
Desenvolvido por: Caio Novais e Jazz_Man (pseudônimo)
Adaptado a partir do seguinte exemplo: https://www.libtorrent.org/python_binding.html
Licença: 
Copyright © 2020 Projeto Pindorama.
OTTO_PKG está sobre a Licença BSD Clause-2 (Simplificada).

Dependências:

>python 3.4=< 
>libtorrent-rasterbar

Notas para próximas versões:
>ajustar manualmente a prioridade de banda do download;
>começar a se usar link magnético como uma opção para os arquivos .torrent;
>modo para criação de .torrents (acionado via uma flag);
>adicionar suporte à criptografia (se possível);
>criar patch para tradução em inglês e em outros idiomas;

Sintaxe:
python3.? otto-torrent.py -s -f <file> -o <directory | file-basename>
'''


import libtorrent as lt
import argparse, os


argumento = argparse.ArgumentParser()
argumento.add_argument("--file", "-f", required=True,
                       help="Arquivo torrent para fazer download")
argumento.add_argument("--seeding", "-S", action="store_true",
                       help="Continuar semeando após o término do download")
argumento.add_argument("--infos", "-i",
                       help="Mostrar informações do torrent")
argumento.add_argument("--output", "-O", action="store_true",
                       help="Saída final do arquivo; nome")
#argumento.add_argument("--download-priority", "-P", default=lt.pri,
#                       help="Definir prioridade ao download")
#argumento.add_argument("--link", "-L",
#                       help="Criar um link magnético através de um arquivo")
argumento.add_argument("--dir", "-d",
					   help="Especificar diretório onde o donwload ficará salvo")
argumentos = argumento.parse_args()

sessao = lt.session({'listen_interfaces': '0.0.0.0:10881'})


def iniciar_download(arquivo):
    try:
        info = lt.torrent_info(arquivo)
        if argumentos.dir:
            if os.path.isdir(argumentos.dir):
                local = sessao.add_torrent({'ti': info, 'save_path': argumentos.dir})
            else:
                print(">>> Diretório inválido")
        else:
            local = sessao.add_torrent({'ti': info, 'save_path': '/tmp/otto_pkg/'})
        torrent = local.status()
        if argumentos.file and argumentos.seeding:
            while True:
                torrent = local.status()
                print("\r%.2f%% complete (down: %.1f kB/s up: %.1f kB/s peers: %d) %s" % (
                 torrent.progress * 100, torrent.download_rate / 1000, torrent.upload_rate / 1000,
                 torrent.num_peers, torrent.state), end=" ")
            print("\n>>> Download concluído.\n>>>Semeando")
        elif argumentos.file:
            while not torrent.is_seeding:
                torrent = local.status()
                print("\r%.2f%% complete (down: %.1f kB/s up: %.1f kB/s peers: %d) %s" % (
        		 torrent.progress * 100, torrent.download_rate / 1000, torrent.upload_rate / 1000,
        		 torrent.num_peers, torrent.state), end=" ")
        print("\n>>> Download concluído!")
    except KeyboardInterrupt:
        print("\n>>> Saindo do programa...\n")
    except Exception as error:
        print(">>> Houve algum erro: {}".format(error))

iniciar_download(argumentos.file)
