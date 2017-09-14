#!/bin/sh

echo 'Copying Emacs Configuration ...'
cp ~/.emacs.d/init.el ./emacs.d
cp -r ~/.emacs.d/lisp ./emacs.d

echo 'Start Git Operations'
echo 'Enter Git Comment Message:'
read cmtContent
git add -A
git commit -m "${cmtContent}"


read -r -p "Push to Remote Origin? [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])
		git push origin master
		;;
    [nN][oO]|[nN])
       		;;
    *)
	echo "Invalid input..."
	exit 1
	;;
esac

echo 'Done!'
