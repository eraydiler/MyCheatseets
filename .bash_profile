# My .bash_profile file to perform my tasks using alias
# Don't forget "source ~/.bash_profile" after changes

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; 
killall Finder /System/Library/CoreServices/Finder.app'

alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; 
killall Finder /System/Library/CoreServices/Finder.app'

alias open-devices-folder='open ~/Library/Developer/CoreSimulator/Devices/;'

# To open sqlite file for the PasswordLocker ios app.
# Known As command substitution
alias open-sql-file=' open -a "Navicat Premium" $(find /Users/<username>/Library/Developer/CoreSimulator/Devices/ -name "<application-name>.sqlite");'

# To connect to eraydiler host
alias connect-to-host='SSH username@server.com'

# To open .bash_profile
alias open-bash-profile='open -a "TextMate" ~/.bash_profile'

# To reset bash_profile
alias reload="source ~/.bash_profile"

# Notes:
# If you want to find a file with path use this : echo `pwd`/`ls <filename>`
# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

check-directory() {
	file=".git"
	if [ -d "$file" ]
	then
		echo "$file found."
	else
		echo "$file not found."
	fi
}

# Creating repo on local
git-init() {

	# return if git already set.
	file=".git"
	if [ -d "$file" ]
	then
		echo "git found, done."
		return 1
	fi

	git init
	git add .
	git commit -m "Initialized"

	# .gitignore to be added
	echo "Don't forget to add a .gitignore file to your repo"
	echo "Git repo created and initialized"
}

# Creating repo on github
github-create() {
 
 	# added this line because once an error occures invalid_credentials keeps its value as 1
 	# set invalid_credentials to 0 if it is 1	
 	if [ "invalid_credentials" == "1" ]; then
		invalid_credentials=0
 	fi

 	repo_name=$1

	dir_name=`basename $(pwd)`

	if [ "$repo_name" = "" ]; then
		echo "Repo name (hit enter to use '$dir_name')?"
		read repo_name
	fi

	if [ "$repo_name" = "" ]; then
		repo_name=$dir_name
	fi

	username=`git config github.user`
	if [ "$username" = "" ]; then
		echo "Could not find username, run 'git config --global github.user <username>'"
		invalid_credentials=1
	fi

	token=`git config github.token`
	if [ "$token" = "" ]; then
		echo "Could not find token, run 'git config --global github.token <token>'"
		invalid_credentials=1
	fi

	echo "$invalid_credentials"

	if [ "$invalid_credentials" == "1" ]; then
		echo "returned"
		return 1
	fi

	echo -n "Creating Github repository '$repo_name' ..."
	curl -u "$username:$token" https://api.github.com/user/repos -d '{"name":"'$repo_name'"}' > /dev/null 2>&1
	echo " done."

	echo -n "Pushing local code to remote ..."
	git remote add origin git@github.com:$username/$repo_name.git > /dev/null 2>&1
	git push -u origin master > /dev/null 2>&1
	echo " done."
}