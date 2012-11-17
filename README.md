ci_builder
==========

Tinkering with a build script to set up new CodeIgniter / HTML5 Bolierplate apps

DIR=$1

curl -O http://codeigniter.com/download_files/reactor/CodeIgniter_2.1.3.zip
curl -LO https://github.com/h5bp/html5-boilerplate/archive/master.zip

unzip master.zip
unzip CodeIgniter_2.1.3.zip

mv CodeIgniter_2.1.3 $DIR
cp -r html5-boilerplate-master/* $DIR

rm CodeIgniter_2.1.3.zip
rm master.zip
rm -r html5-boilerplate-master

cd $DIR

mv index.html application/views/welcome_message.php