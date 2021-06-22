const fs = require("fs");
module.exports.config = {
name: "bot",
	version: "1.0.1",
	hasPermssion: 0,
	credits: "VanHung",
	description: "bot",
	commandCategory: "Không cần dấu lệnh",
	usages: "noprefix",
	cooldowns: 5,
};
module.exports.event = function({ api, event }) {
	var { threadID, messageID } = event;
	if (event.body.indexOf("bot")==0 ||  (event.body.indexOf("Bot")==0)) {
  var msg = {
    body: "Chó nào vừa nói xấu tao đấy, muốn chết hả😠", 
  }
			return api.sendMessage(msg, threadID, messageID);
		}
	}
	module.exports.run = function({ api, event, client, __GLOBAL }) {

	}