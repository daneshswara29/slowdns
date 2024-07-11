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
BZh91AY&SYA3��  �_�D0}������~����PX�4R� jj��  hh     P�4hi�L	��2�4b40F@�T���j�=A�di��4z�������P�a �i��� �� �H�L	�oA4d�QS��i�ɤ3ҙ�i�5P�M����Ę�@��{B���*����u�K�IQNY���g���l��}���`q��ۅ�y �1�]�h�N&(IkP�\d�R#�81֯b��9C c(��3l�����j_���z~=O���v�c�S�gm*���N����^d��H}

z���T��*�QU��z�D��>�N5M_og��Lѝ<V:���+%��Ru�|�M%��=6��;7��qN�go�X�)����p1��[����*�������i��)��'����T]����>�?Գ�қ>��tŉ��%�g��~��+{}��|GA��N��oOs����~���ʬ��,]�䙦��|�Y���m��X���(mnAMH�$����,J��&UE��ǦI�(p�[�l/��I��rL�_�Um,�[����[��6Ɲ֌	������%�;0�[�������4TS�������V����K�>�9��̙>�=�y�ߎ
��G������Z��I�=�<nB���1�,̜��8��W�)`Α]/m���dԦ���lr-�z��{�WO�����n��DЌ�lE�t�*|I�������t�Y�&I����9��rr�����ӝ��8��z���gE^J&|s��^��s�t[/1Ն�S�9�1W�=SQ�G�(���\�Π�o��iE�q��*�QI�{��(X�;hu�L�#Bdջ?���~T�K��Ǡ��'s9�����_)N����-���|�a\��3&�'�a�Z�$��i�Qj���R�J�KE�[��:��Xi�F%�+F%ɻq[�Z4B���^`���Ʌ_�j)%J-tK�b6������݈��C&k�җ���U�=��.5nINC�8���cTbΨ���L��1L�D��|yN-z�pg�~%�rE8P�A3��