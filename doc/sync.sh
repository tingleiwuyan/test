cd `dirname $0`
rsync -vzrtu --progress --password-file=.pwd --exclude-from=yii.exclude ../ root@106.15.192.5:/var/www/advanced/