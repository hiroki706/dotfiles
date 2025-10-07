# 対話型シェルの時はnushellを起動
case $- in
    *i*) exec nu;;
      *) return;;
esac
eval "$(mise activate bash)"
