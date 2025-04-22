export
docker login -u $ALIYUN_REGISTRY_USER -p $ALIYUN_REGISTRY_PASSWORD ${{ env.TARGET_REGISTRY }}
# 数据预处理,判断镜像是否重名
declare -A duplicate_images
declare -A temp_map
while IFS= read -r line || [ -n "$line" ]; do
    # 忽略空行与注释
    [[ -z "$line" ]] && continue
    if echo "$line" | grep -q '^\s*#'; then
        continue
    fi
    
    echo "镜像名称: $line"
    
done < images.txt
