source $stdenv/setup

PATH=$grunt/bin:$npm/bin:$git/bin:$nodejs/bin:$PATH

# Create a temp directory where we have write permission, and copy the sources
# there.
mkdir tmp
cp -a $src/* tmp
chmod -R u+w tmp

cd tmp
grunt clean:all --force
#HOME=. npm install

mkdir $out
cp setup.cfg Gruntfile.js $out
