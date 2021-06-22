module.exports.config = {
  name: "tagadmin",
  version: "1.0.0-beta-fixbyDungUwU",
  hasPermssion: 0,
  credits: "ZyrosGenZ-fixbyDungUwU",
  description: "Bot sẽ rep ng tag admin hoặc rep ng tagbot ",
  commandCategory: "Other",
  usages: "",
  cooldowns: 1
};
module.exports.event = function({ api, event }) {
  if (event.senderID !== "100040373675468") {
    var aid = ["100040373675468","100051303636300","100066117438131"];
    for (const id of aid) {
    if ( Object.keys(event.mentions) == id) {
      var msg = ["Mày tag gì admin đấy, lần nữa tao đấm cho đấy","Đã bảo đừng tag mà, thích ăn đấm hả😠"];
      return api.sendMessage({body: msg[Math.floor(Math.random()*msg.length)]}, event.threadID, event.messageID);
    }
    }}
};
module.exports.run = async function({}) {
  }