#!/bin/bash
# 一键重新部署：把最新报告覆盖为 index.html 并推送，分享链接不变
set -e
cd "$(dirname "$0")"

SRC="8品牌AVC定位布局报告_v3.html"
if [ ! -f "$SRC" ]; then
  echo "未找到 $SRC，请先运行 gen_v3.py 生成报告"; exit 1
fi

cp "$SRC" index.html
git add index.html "$SRC"
git commit -m "update report $(date '+%F %T')" || true
# 只推新仓库 pub（旧仓库 frozen 已冻结，不再接收自动更新）
git push pub main

URL="https://rebecc2-cc.github.io/tv-market-report-1028/"
echo "已部署 → $URL"
echo "（Pages 构建约需1分钟，之后刷新即见最新内容）"