# Look for directory name as argument
DIR=$1

# Find out most recent version of CI and set download path
CI_VERSION="`curl http://versions.ellislab.com/codeigniter_version.txt`"
CI_DOWNLOAD="http://codeigniter.com/download_files/reactor/CodeIgniter_$CI_VERSION.zip"

# Download most recent CI, and HEAD of HTML5 boilerplate git repo
curl -O $CI_DOWNLOAD
curl -LO https://github.com/h5bp/html5-boilerplate/archive/master.zip

# Unpack downloads
unzip master.zip
unzip "CodeIgniter_$CI_VERSION.zip"

# Rename CI directory to supplied dir name
mv "CodeIgniter_$CI_VERSION" $DIR

# Copy files from boilerplate into CI directory
cp -r html5-boilerplate-master/* $DIR

# Cleanup, delete files we no longer need
rm "CodeIgniter_$CI_VERSION.zip"
rm master.zip
rm -r html5-boilerplate-master

# Move into new directory
cd $DIR

# Replace default CI view with the HTML5 boilerplate index page
mv index.html application/views/welcome_message.php