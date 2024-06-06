# analog

===============启动analog脚本================

wget -O start.sh https://raw.githubusercontent.com/jiangyaqiii/analog/main/start.sh && chmod +x start.sh && ./start.sh

===========================================

===============获取会话密钥脚本================

wget -O get_key.sh https://raw.githubusercontent.com/jiangyaqiii/analog/main/get_key.sh && chmod +x get_key.sh && ./get_key.sh

===========================================

查看节点日志、确认同步高度
docker logs -f analog
docker logs -f --tail=100 analog


