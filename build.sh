curl -sSL https://dot.net/v1/dotnet-install.sh > dotnet-install.sh
chmod +x dotnet-install.sh
./dotnet-install.sh --c 10.0 --install-dir ./dotnet
./dotnet/dotnet version
./dotnet/dotnet workload install wasm-tools

# install nodejs, restore npm packages and run tailwindcss build
curl -fsSL https://deb.nodesource.com/setup_24.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v
npm -v
npm ci
npm run tailwindcss:build

./dotnet/dotnet publish -c Release -o output
