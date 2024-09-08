json=$(curl -s https://go.dev/dl/?mode=json)
filename=$(echo $json | jq -r '.[0].files[] | select(.os == "linux" and .arch == "amd64") | .filename')
remote_version=$(echo $json | jq -r '.[0].version')
installed_version=$(go version | grep -o 'go1\.[0-9]*\.[0-9]*')
echo $filename
echo $installed_version

if [ "$remote_version" = "$installed_version" ]; then
	echo "Already up to date"
	exit 0
fi
sudo rm -rf /usr/local/go

curl -L https://go.dev/dl/${filename} | sudo tar -C /usr/local -xzf -
export PATH=$PATH:/usr/local/go/bin
export PATH=${PATH}:`go env GOPATH`/bin

# else
#
# 	echo ""
# fi
# echo "Removing go"
#
# echo "Downloading go ${filename}"
#
# echo 'Installing go'
# go version

