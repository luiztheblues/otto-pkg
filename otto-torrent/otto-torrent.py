'''
NÃO EDITAR ESSE ARQUIVO MANUALMENTE (use Otto.cfg para configurar suas opções)
otto-torrent, feito para ser usado na distro brasileira, Pindorama Linux.
Desenvolvido por: Chexier e Jazz_Man (pseudônimo)
Baseado no seguinte exemplo: https://www.libtorrent.org/python_binding.html

Requisitos:
 - Ter no mínimo o Python 3.4 instalado, porém recomenda-se usar a versão 3.8+.
 - Ter instalado a biblioteca libtorrent-rasterbar.

Modo de uso: python3.8 otto-torrent.py -f NOMEDOARQUIVO
'''

import libtorrent as lt
from sys import argv

seed = True
sessao = lt.session({'listen_interfaces': '0.0.0.0:10880'})
info = lt.torrent_info(argv[2]) # Irá mostrar infos sobre o torrent na memória
# ex: 0x55bed417ab00>. O "argv[2]" é o diretório do torrent

try:
    if argv[1] == '-f':
        local = sessao.add_torrent({'ti': info, 'save_path': '/tmp/otto_pkg/'})
        torrent = local.status() # Irá mostrar o nome do arquivo (não será nome do arquivo
        # que está no computador, e sim, o que está no torrent final após ser baixado)

except Exception as error:
    print('Algum erro ocorreu: {}'.format(error))

print('Baixando o pacote: {}'.format(torrent.name))

while True:
    torrent = local.status()
    print('\r%.2f%% complete (down: %.1f kB/s up: %.1f kB/s peers: %d) %s' % (
        torrent.progress * 100, torrent.download_rate / 1000, torrent.upload_rate / 1000,
        torrent.num_peers, torrent.state), end=' ')
    if torrent.is_seeding and seed == False:
        break
print('Download de {} concluído!'.format(torrent.name))
