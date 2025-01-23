#!/bin/bash

if [ "$(id -u)" != "0" ]; then
    echo "此腳本需要以 root 權限運行。請使用 sudo。"
    exit 1
fi

declare -A dns_domains
dns_domains["HK"]="

dazn-api.com
dazn.com
dazndn.com
indazn.com
d151l6v8er5bdm.cloudfront.net
d1sgwhnao7452x.cloudfront.net
dcalivedazn.akamaized.net
dcblivedazn.akamaized.net

hotstar.com
hotstarext.com

bilibili.com

#Bahamut Anime
bahamut.com.tw
gamer.com.tw
gamer-cds.cdn.hinet.net
gamer2-cds.cdn.hinet.net

nowe.com
nowestatic.com

mytvsuper.com
mytvsuperlimited.hb.omtrdc.net
mytvsuperlimited.sc.omtrdc.net
tvb.com

44wilhpljf.execute-api.ap-southeast-1.amazonaws.com
bcbolthboa-a.akamaihd.net
dai3fd1oh325y.cloudfront.net
hboasia1-i.akamaihd.net
hboasia2-i.akamaihd.net
hboasia3-i.akamaihd.net
hboasia4-i.akamaihd.net
hboasia5-i.akamaihd.net
hboasialive.akamaized.net
hbogoprod-vod.akamaized.net
hbolb.onwardsmg.com
hbounify-prod.evergent.com
hbogo.co.th
hbogoasia.com
hbogoasia.hk
hbogoasia.id
hbogoasia.ph
hbogoasia.sg
hbogoasia.tw

max.com
hbo.com
hbogo.com
hbomax.com
hbomaxcdn.com
hbonow.com
maxgo.com
discomax.com

viu.tv
viu.com
viu.now.com

hoy.tv
"

dns_domains["TW"]="

kfs.io
kktv-theater.kk.stream
kkbox.com
kkbox.com.tw
kktv.com.tw
kktv.me

litv.tv
itvfreepc.akamaized.net

cdn.plyr.io
myvideo.net.tw

4gtv.tv
4gtvfreepc-cds.cdn.hinet.net
4gtvfreepcvod-cds.cdn.hinet.net
4gtvpc-cds.cdn.hinet.net
4gtvpcvod-cds.cdn.hinet.net

d3c7rimkq79yfu.cloudfront.net
linetv.tw

cdn.hinet.net
hamivideo.hinet.net
scc.ott.hinet.net

catchplay.com
d2ivmxp5z2ww0n.cloudfront.net
ols-ww100-cp.akamaized.net
tra-www000-cp.akamaized.net

video.friday.tw
"

dns_domains["JP"]="

abema.io
abema.tv
abema-tv.com
ds-linear-abematv.akamaized.net
linear-abematv.akamaized.net
ds-vod-abematv.akamaized.net
vod-abematv.akamaized.net
ameba.jp
hayabusa.io
mobile-collector.newrelic.com
vod-abematv.akamaized.net
bucketeer.jp
abema.adx.promo
hayabusa.media

dmm-extension.com
dmm.co.jp
dmm.com
videomarket.jp
p-smith.com
vmdash-cenc.akamaized.net
img.vm-movie.jp

hulu.com
huluad.com
huluim.com
hulustream.com
happyon.jp
hulu.jp
hjholdings.jp
streaks.jp
yb.uncn.jp
hulu.hb.omtrdc.net
conviva.com
imrworldwide.com
tealiumiq.com
tiqcdn.com
microad.jp
adsrvr.org
adsmoloco.com
yimg.jp
webantenna.info
doubleclick.net
usergram.info
hjholdings.tv
"

dns_domains["Netflix"]="

netflix.com
netflix.net
nflximg.com
nflximg.net
nflxvideo.net
nflxext.com
nflxso.net

disney.connections.edge.bamgrid.com
disney.api.edge.bamgrid.com
disney-plus.net
disneyplus.com
dssott.com
disneynow.com
disneystreaming.com
cdn.registerdisney.go.com
"

dns_domains["Tiktok"]="

byteoversea.com
ibytedtos.com
ipstatp.com
muscdn.com
musical.ly
tiktok.com
tik-tokapi.com
tiktokcdn.com
tiktokv.com
"

dns_domains["OpenAI"]="

openai.com
chatgpt.com
sora.com
oaistatic.com
oaiusercontent.com
"

dns_domains["Claude"]="

anthropic.com
claude.ai
"

dns_domains["Google Gemini"]="

gemini.google.com
proactivebackend-pa.googleapis.com
"

dns_domains["Google AiStudio"]="

aistudio.google.com
alkalimakersuite-pa.clients6.google.com
generativelanguage.googleapis.com
"

dns_domains["Microsoft Copilot"]="

copilot.microsoft.com
"

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
On_Yellow="\033[43m" 
On_White="\033[47m"
IGreen="\033[0;92m"

# Bold High Intensity
BIBlack="\033[1;90m"
BIRed="\033[1;91m"
BIGreen="\033[1;92m"
BIYellow="\033[1;93m"
BIBlue="\033[1;94m"
BIPurple="\033[1;95m"
BICyan="\033[1;96m"
BIWhite="\033[1;97m"

On_ICyan="\033[0;106m"
On_IWhite="\033[0;107m"
On_IRed="\033[0;101m" 

NC='\033[0m' # No Color

show_info() {
    echo -e ""
    echo -e "  ${On_Yellow}Dnsmasq 一鍵安裝腳本v1.0.6 (23/01/2025更新) ${NC}"
    echo -e ""
    echo -e "${BICyan}系統 DNS：${NC}${BIWhite}$(grep 'nameserver' /etc/resolv.conf | awk '{ print $2 }' | tr '\n' ' ')${NC}"
    if [ -f /etc/dnsmasq.conf ]; then
        hk_dns=$(grep 'hotstar.com' /etc/dnsmasq.conf | cut -d '/' -f 4)
        tw_dns=$(grep 'kktv.me' /etc/dnsmasq.conf | cut -d '/' -f 4)
        jp_dns=$(grep 'dmm.co.jp' /etc/dnsmasq.conf | cut -d '/' -f 4)
        Netflix_dns=$(grep 'disneyplus.com' /etc/dnsmasq.conf | cut -d '/' -f 4)
        Tiktok_dns=$(grep 'tiktok.com' /etc/dnsmasq.conf | cut -d '/' -f 4)
        OpenAI_dns=$(grep 'openai.com' /etc/dnsmasq.conf | cut -d '/' -f 4)
        Claude_dns=$(grep 'claude.ai' /etc/dnsmasq.conf | cut -d '/' -f 4)
        GoogleGemini_dns=$(grep 'gemini.google.com' /etc/dnsmasq.conf | cut -d '/' -f 4)
        GoogleAiStudio_dns=$(grep 'aistudio.google.com' /etc/dnsmasq.conf | cut -d '/' -f 4)
	MicrosoftCopilot_dns=$(grep 'copilot.microsoft.com' /etc/dnsmasq.conf | cut -d '/' -f 4)
    else
        hk_dns=""
        tw_dns=""
        jp_dns=""
        Netflix_dns=""
        Tiktok_dns=""
        OpenAI_dns=""
        Claude_dns=""
        GoogleGemini_dns=""
        GoogleAiStudio_dns=""
	MicrosoftCopilot_dns=""
    fi

    echo -e "${BICyan}HK DNS：${NC}${BIWhite}${hk_dns}${NC}"
    echo -e "${BICyan}TW DNS：${NC}${BIWhite}${tw_dns}${NC}"
    echo -e "${BICyan}JP DNS：${NC}${BIWhite}${jp_dns}${NC}"
    echo -e "${BICyan}Netflix/Disney+ DNS：${NC}${BIWhite}${Netflix_dns}${NC}"
    echo -e "${BICyan}Tiktok DNS：${NC}${BIWhite}${Tiktok_dns}${NC}"
    echo -e "${BICyan}OpenAI DNS：${NC}${BIWhite}${OpenAI_dns}${NC}"
    echo -e "${BICyan}Claude DNS：${NC}${BIWhite}${Claude_dns}${NC}"
    echo -e "${BICyan}GoogleGemini DNS：${NC}${BIWhite}${GoogleGemini_dns}${NC}"
    echo -e "${BICyan}GoogleAiStudio DNS：${NC}${BIWhite}${GoogleAiStudio_dns}${NC}"
    echo -e "${BICyan}MicrosoftCopilot DNS：${NC}${BIWhite}${MicrosoftCopilot_dns}${NC}"
	
}

clear
show_info
echo -e ""
echo -e "${BIWhite}請選擇操作:${NC}"
echo -e "${BIYellow}1.${NC} ${IGreen}安裝 dnsmasq${NC}"
echo -e "${BIYellow}2.${NC} ${IGreen}配置 dnsmasq${NC}"
echo -e "${BIYellow}3.${NC} ${IGreen}啟動 dnsmasq${NC}"
echo -e "${BIRed}4.${NC} ${On_IRed}停止 dnsmasq${NC}"
echo -e "${BIYellow}5.${NC} ${IGreen}重啟 dnsmasq${NC}"
echo -e "${BIRed}6.${NC} ${On_IRed}卸載 dnsmasq${NC}"
read -p "輸入選擇（例如：1）: " action

case $action in
    1)
        # 安裝 dnsmasq
        echo "正在安裝 dnsmasq..."
        apt-get update && apt-get -y install dnsmasq
        echo -e "nameserver 8.8.8.8\nnameserver 1.1.1.1" > /etc/resolv.dnsmasq.conf

        sudo rm /etc/resolv.conf
        sudo touch /etc/resolv.conf
        
        sudo bash -c 'echo -e "nameserver 127.0.0.1\nnameserver 1.1.1.1" > /etc/resolv.conf'
        chattr +i /etc/resolv.conf

        systemctl unmask dnsmasq
        systemctl enable dnsmasq
        systemctl start dnsmasq
        ;;
    2)
        # 配置 dnsmasq
        echo -e ""
        echo -e "${BIWhite}請選擇 DNS 區域:${NC}"
        echo -e "${BIYellow}1. 香港 (HK)${NC}"
        echo -e "${BIBlue}2. 台湾 (TW)${NC}"
        echo -e "${BIYellow}3. 日本 (JP)${NC}"
        echo -e "${BIBlue}4. Netflix${NC}"
        echo -e "${BIYellow}5. Tiktok${NC}"
        echo -e "${BIBlue}6. OpenAI${NC}"
        echo -e "${BIYellow}7. Claude${NC}"
        echo -e "${BIBlue}8. Google Gemini${NC}"
        echo -e "${BIYellow}9. Google AiStudio${NC}"
	echo -e "${BIYellow}10. Microsoft Copilot${NC}"
        echo -e ""
        read -p "輸入選擇（例如：1）或按 Enter 取消: " region_choice

        if [ -z "$region_choice" ]; then
            echo -e "${BIRed}沒有輸入選擇，操作已取消。${NC}"
            exit 0
        fi

        echo "輸入 DNS IP 地址 (例如：8.8.8.8) 或按 Enter 刪除舊設置:"
        read dns_ip

        # 驗證區域選擇，並生成 DNS 配置
        case $region_choice in
            1) selected_region="HK";;
            2) selected_region="TW";;
            3) selected_region="JP";;
            4) selected_region="Netflix";;
            5) selected_region="Tiktok";;
            6) selected_region="OpenAI";;
            7) selected_region="Claude";;
            8) selected_region="Google Gemini";;
            9) selected_region="Google AiStudio";;
	   10) selected_region="Microsoft Copilot";;
            *) echo -e "${BIRed}選擇的區域無效，請重新運行腳本。${NC}"; exit 1;;
        esac

        if [ -f /etc/dnsmasq.conf ]; then
            echo -e "${BIRed}刪除與所選區域相關的舊 DNS 設置${NC}"
            for domain in ${dns_domains[$selected_region]}
            do
                sed -i "/server=\/$domain\/tcp\//d" /etc/dnsmasq.conf
            done
        else
            echo "配置文件 /etc/dnsmasq.conf 不存在，跳過刪除操作。"
        fi

        if [ -n "$dns_ip" ]; then
            config_content=""
            for domain in ${dns_domains[$selected_region]}
            do
                config_content+="server=/$domain/tcp/$dns_ip\n"
            done
            if ! grep -q "resolv-file=/etc/resolv.dnsmasq.conf" /etc/dnsmasq.conf; then
                config_content+="resolv-file=/etc/resolv.dnsmasq.conf\n"
            fi

            echo -e "$config_content" >> /etc/dnsmasq.conf

            echo "正在重啟 dnsmasq..."
            systemctl restart dnsmasq
        else
            echo "所有與所選區域相關的 DNS 設置已刪除，未添加新配置。"
        fi
        ;;
    3)
        # 啟動 dnsmasq
        echo "正在啟動 dnsmasq..."
        systemctl start dnsmasq
        ;;
    4)
        # 停止 dnsmasq
        echo "正在停止 dnsmasq..."
        systemctl stop dnsmasq
        ;;
    5)
        # 重啟 dnsmasq
        echo "正在重啟 dnsmasq..."
        systemctl restart dnsmasq
        ;;
    6)
        # 卸載 dnsmasq
        echo "正在卸載 dnsmasq..."
        chattr -i /etc/resolv.conf
        systemctl stop dnsmasq
        apt-get remove -y dnsmasq
        rm /etc/resolv.dnsmasq.conf
        rm /etc/dnsmasq.conf
        sudo rm /etc/resolv.conf
        sudo touch /etc/resolv.conf
        sudo bash -c 'echo -e "nameserver 8.8.8.8\nnameserver 1.1.1.1" > /etc/resolv.conf'
        ;;
    *)
        echo -e "${BIRed}沒有輸入選擇，操作已取消。${NC}"
        exit 1
        ;;
esac

