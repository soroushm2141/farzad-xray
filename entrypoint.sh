#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�>)�centrypoint.sh ��Mo1����6j��;P� >���Hp�@��㵲���M��������.�w���;���\+��'�EH��(��ʗ2!�a �����;��Q��;�@9oS��F�D�][��]x�(U�Ӻ���ۯ���g{�Y/ЋA� r;��2�������"�2i���R���?o�,s�=*텳��C*D�2s@-,����^�Jk���ļ�,�:T�]�-�|�)� 8PM����|�Z��(���P��Tf�g[��w��ůq�4��k�~����ey��uQ���� 2go��b��f;�g-��g#j���W#�Q���KiR=�~7'"��)�29ůO��Hˏ��w/�%�G.v�<3�꼅^0^FZ=#z7;��M:��ٌ��bWW��>L�U�c��
�=��շC����;�s����_��MZ  