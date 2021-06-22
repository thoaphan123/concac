module.exports.config = {
	name: "antiout",
	version: "1.0.0",
	credits: "DungUwU & Khánh Milo fix",
	hasPermssion: 1,
	description: "Bật tắt antiout",
	usages: "antiout on/off",
    commandCategory: "system",
	cooldowns: 0
};

module.exports.run = async({ api, event, client, Threads}) => {
	let settings = (await Threads.getData(event.threadID)).settings;
	if (typeof settings["antiout"] == "undefined" || settings["antiout"] == true) settings["antiout"] = false;
	else settings["antiout"] = true;
	await Threads.setData(event.threadID, options = { settings });
	client.threadSetting.set(event.threadID, settings);
	return api.sendMessage(`Đã ${(settings["antiout"] == true) ? "bật" : "tắt"} thành công antiout!`, event.threadID);
}