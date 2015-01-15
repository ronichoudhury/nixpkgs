source $stdenv/setup

PATH=$grunt/bin:$npm/bin:$PATH

mkdir tmp
cp -a $src/* tmp
ls -l -R
cd tmp
grunt clean:all || npm install
npm install
grunt package
