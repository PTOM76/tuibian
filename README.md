# ビルド方法
Makefileに則ってbuildします。(ISOの生成)

```bash
make all
```

## ファイルについて
- config/ - ディストリのビルドに関する情報、設定です。
- config/bootloader - ブートローダに関する設定です。
- package-lists - 導入したいパッケージです
- common - ビルド設定です

### 初回メモ
```bash
mkdir ~/Testbian-amd64
cd ~/Testbian-amd64

lb config --architecture amd64 --binary-images iso-hybrid

cat <<EOF > config/package-lists/live.list.chroot 
live-boot
live-config
live-config-systemd
systemd-sysv
ncurses-bin
ncurses-term
vim
git
network-manager
htop
EOF

sudo mkdir -p config/includes.chroot_after_packages/etc/profile.d/
# sudo vim config/includes.chroot_after_packages/etc/profile.d/tuibian.sh
echo "Welcome to Testbian!" > config/includes.chroot_after_packages/etc/profile.d/tuibian.sh

sudo lb build
```
