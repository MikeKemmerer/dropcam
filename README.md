# dropcam_capture
A Bash-based method of automatically capturing Nest Dropcam snapshots

### **Initial Release**
This was originally used on a Raspberry Pi running Raspbian, and installed in /var/www/nest/dropcam, and the hard-coded paths reflect that. The index.php file is where you can view the latest image captured, or a lovely splash screen telling you that the service isn't running.

#### **Installation**
0. Make a user called dropcam
1. Place files in /var/www/nest/dropcam or do a directory-wide sed replacement for that string with whereever you would like to put it
2. Move getcookie.sh from bin/ to /home/dropcam/
3. Add the following to the system's crontab. Feel free to change the time of day when these occur.
  15 *    * * *   root    /var/www/nest/dropcam/bin/photorotate2.sh >> /var/log/photorotate.log
  30 8    * * *   root    /home/dropcam/getcookie.sh   # OR SOMEWHERE ELSE SAFE
4. Move or link dropinit from /var/www/nest/dropcam/bin in /etc/init.d
5. Enter your Dropcam/Nest username and password in /home/dropcam/getcookie.sh
6. Enter the following information in a new file called /home/dropcam/vars.sh:
	A. UUID #camera uuid found in URL when accessing via the web
	B. user #dropcam/nest user name
	C. pass #dropcam/nest password
	D. processor #hostname or ip address of the host storing or processing the images (if storage is mounted as nfs share)
7. If desired: chkconfig --add dropinit && chkconfig dropinit on; 
8. Launch by starting the service called "dropinit"

#### **To do's**
- Make this work with multiple cameras.
- Create an "installer" where the install path is configurable and sourced file is generated using user input
- Redo naming convention alltogether?

V 0.2 Release notes:
- Added vars.sh file to be sourced in different scripts
- Implemented the last5.php, last10.php, and last15.php functionality to allow for animated gifs to be generated via clicks.
- Removed 2's from script filenames.
- Renamed other files and cleaned up directories.
