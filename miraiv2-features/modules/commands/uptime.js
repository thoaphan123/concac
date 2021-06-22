module.exports.config = {
	name: "uptime",
	version: "1.0.0",
	hasPermssion: 0,
	credits: "VanHung",
	description: "Kiểm tra thời gian bot đã online",
	commandCategory: "System",
	usages: "uptime",
	cooldowns: 5
};

module.exports.run = async ({ api, event, client }) => {
	const axios = require('axios');
let time = process.uptime();
	const request = require('request');
const fs = require("fs");
const timeStart = Date.now();
	let hours = Math.floor(time / (60 * 60));
	let minutes = Math.floor((time % (60 * 60)) / 60);
	let seconds = Math.floor(time % 60);
	axios.get('http://web-api-teammucode.ga/lebong.php').then(res => {
	let ext = res.data.data.substring(res.data.data.lastIndexOf(".") + 1);
	var callback = () =>
				api.sendMessage(
					{
						body: `Bot của Thoả Cute UwU 😍 đã hoạt động được ${hours} giờ ${minutes} phút ${seconds} giây.\n\nTổng người dùng: ${client.allUser.length}\nTổng Nhóm: ${client.allThread.length}\nPing: ${Date.now() - timeStart}ms`,
						attachment: fs.createReadStream(__dirname + `/cache/gái.jpg.${ext}`)
					},
					event.threadID,
					() => fs.unlinkSync(__dirname + `/cache/gái.jpg.${ext}`),
					event.messageID
				);
		 return request(res.data.data).pipe(fs.createWriteStream(__dirname + `/cache/gái.jpg.${ext}`)).on("close", callback);
});
}