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
BZh91AY&SY�@@�  �_�D0}������~����PX�4R� jj��  hh     P�4hi�L	��2�4b40F@�4��j51���4 c@&�C#��=�a �i��� �� �Hdi��##D�5�i6�OQ�i��&�e6S!4�L4�lM��I�� U�1EW"�u}��D���	)�ӕq����~�a��kf�!�����ѝd�@K���EYrĽĲ�`.2^����W��Ts�!�1�C��|D��d�/���=?>���ﳮ��vY�J�h�S�y��E���/Rb���}*��;eC�*�]�OZg����h©����>�Hʝ6<����%)<
�5&zów56��[��o�W��ӯo�����.��o���N}�5��;�m��}i����xʋ�2=g����Y��&�fL��4[�����_�?Ӎ�?�����:�x�����?/_���p_�Ƭ��	,]�I2M��/�v��mLufT1� 6����d2����"� �+1�cTXj�=RM	C~modͰ���$��5��1g0v�V�ʕ��?��߾鰶4qZ0'E4��i-�b����4�_E%v�}=���z	F���~1�L_o��B����T]h�tv���B�kU�4�3���_=\l�e��s�d���h*<OJ)i��E�W��q.MT�rϿcJ�樭���t�7���Ό���Z(�Ό�l��l9�3���r�~���{�g,S_56k[���1���Y�+4�r�SޮF�$���DˆZ+ջr����5f՟��)�0W�-SQ�G}*�/�N%�2���B��%���e8���V���NGŚ�Y�C��2�\�	��v^Y��c�
N"��(f�����M/7�+�S�������4W�W.�L����Xd���ic,Ӕ���<S���TjZ.���Ҵ��EJ1-�og��7q�գ<+�:K���\���P�mE$���E��Q#Vѳ)|p�x���1_r���hK�Z�*�q�t�x�S&Rr���)c6e�eThz�"<t��H�n�?�iŮ([�=��rE8P��@@�