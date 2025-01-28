path="/etc/os-release"
log="/var/log/update.log"

exit_status () {
echo "System update Succesfully..."
exit 0

}

if grep -iq "Arch Linux" $path; then
        yay -Syu --noconfirm
        exit_status

elif grep -iq "Ubuntu" $path; then
	sudo apt update && sudo apt upgrade -y
	exit_status

elif grep -iq "Fedora" $path; then  
	sudo dnf update && sudo dnf upgrade -y
	exit_status

elif grep -iq "Centos" $path; then
	sudo yum check-update && sudo yum -y update
	exit_status
else
        echo "Error updating the system!!!"
	exit 1

fi
