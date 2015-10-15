export LIBGIT2=$PREFIX
if [ $(uname -m) = "i686" ]; then
  export CFLAGS=-m32
fi
$PYTHON setup.py install
