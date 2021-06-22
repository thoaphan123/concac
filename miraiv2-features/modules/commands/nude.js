module.exports.config = {
    name: "nude",
    version: "1.0.0",
    hasPermssion: 0,
    credits: "VĐT&NTH với sự Sp của DũngUwU",
    description: "Random ảnh Nude gái có phí",
    commandCategory: "random-img",
    usages: "nude",
    cooldowns: 3
};

module.exports.run = async({api,event,args,client,Users,__GLOBAL,Currencies}) => {
const axios = require('axios');
const request = require('request');
const fs = require("fs");
var data = await Currencies.getData(event.senderID);
var money = data.money
if(money < 100) api.sendMessage("Bạn cần 100 đô ?",event.threadID,event.messageID)
        else{
Currencies.setData(event.senderID, options = {money: money - 100})
axios.get('https://web-api-teammucode.ga/nude.php').then(res => {
let ext = res.data.data.substring(res.data.data.lastIndexOf(".") + 1);
    let callback = function () {
                    api.sendMessage({
                        body: `Nude`,
                        attachment: fs.createReadStream(__dirname + `/cache/boy.${ext}`)
                    }, event.threadID, () => fs.unlinkSync(__dirname + `/cache/boy.${ext}`), event.messageID);
                };
                request(res.data.data).pipe(fs.createWriteStream(__dirname + `/cache/boy.${ext}`)).on("close", callback);
            })
}
}