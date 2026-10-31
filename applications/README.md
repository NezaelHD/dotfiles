# Applications (non versionnées : artefacts de build / binaires)

- **openfortivpn** : clone upstream propre (sans modif locale), build installé dans `/usr/local/bin/openfortivpn`.
  `git clone https://github.com/adrienverge/openfortivpn ~/Applications/openfortivpn && cd ~/Applications/openfortivpn && git checkout a87b91e && ./autogen.sh && ./configure --prefix=/usr/local --sysconfdir=/etc && make && sudo make install`
  (paquet apt `openfortivpn` aussi installé).
- **openfortivpn-webview 1.2.0** : build Electron (~250 Mo) à extraire dans `~/Applications/openfortivpn-webview-1.2.0/` (ajouté au PATH par `.zshrc`). Utilisé par `bin/samlvpn`.
