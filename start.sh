 # 检查 Docker 是否已安装
 if ! command -v docker &> /dev/null
 then
    # 如果 Docker 未安装，则进行安装
    echo "未检测到 Docker，正在安装..."
    sudo apt update
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-commoncurl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor > /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    sudo systemctl start docker
    sudo systemctl enable docker
    docker --version
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    docker-compose --version
else
    echo "Docker 已安装。"
fi

docker pull analoglabs/timechain

# read -p "请输入节点名字: " your_node_name
node_name="$your_node_name"
docker run -d -p 9944:9944 -p 30303:30303 --name analog analoglabs/timechain \
  --base-path /data \
  --rpc-external \
  --unsafe-rpc-external \
  --rpc-cors all \
  --name="$node_name" \
  --rpc-methods Unsafe
