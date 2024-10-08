#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SYK�/{ $_� P}��{���~���� � ��    ��4hb241	�LA��a dɣ@h����`MbF� 0�&MF���Ch�b4@�2h�4�dhbF���� 
�D�i�����ɃT�Q�����zm54��5?T٪ig���GS��3K�\���1j�a����%e�	W�N�H���;����T��O��'���	FB^�x����������7EIUQ��KhC�PfC(�.d��P��<�sA���TJ���%
�Xб�"�h��y��QS�6�A�S(��J��7��e�3�*4<���$�r�b�*^6˒l&�q�8Ir1���I���P���'3�iz�\l/cH�bn�7\��IkCګ��Y_�խ��j&�?2�����+��P�f#[�Us��,.d��NW��P�I��4�m�\�-&5C��I�KQ�I����I�od�0$��CI9��
�yWL��L��0fOs1Sqi��ʝ��Z^n�%��6���z��#�r*�$�F�ӕ��>+s�\��'�=����잢z0�"���=ӣ+��E(];X'j���{�N1b:I�͈�FAE_��=����ə�Q����>I��w��6*Kp��#[[Y	��G�h��rZ.��:F�֖�lbrO�~�-�q��Lm�j۔'"O��2���߽��RwM���8�����ę��VD�K�% �ǘ���jo&�8�q+Bp�X�6�*���c����O+<��M�p�s�ԱZ0�[����[��&���%����dP['���O��<)�V�}%��ū�j<-C�90;�/r��4�V12,#��*Z;���3	���[P�8�'��F1���$��Dғ[F�M�s��L�!/x��$�R��:IC:��^X��Q�=����uG���ܑN$���