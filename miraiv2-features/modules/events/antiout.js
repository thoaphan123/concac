module.exports.config = {
	name: "antiout",
	eventType: ["log:unsubscribe"],
	version: "0.0.1",
	credits: "DungUwU & Khánh Milo fix",
	description: "Listen events"
};

module.exports.run = async({ event, api, Threads, Users }) => {
	let settings = (await Threads.getData(event.threadID)).settings || {};
	if (!settings["antiout"]) return;
	if (event.logMessageData.leftParticipantFbId == api.getCurrentUserID()) return;
	let name = (await Users.getData(event.logMessageData.leftParticipantFbId)).name || (await api.getUserInfo(event.logMessageData.leftParticipantFbId))[event.logMessageData.leftParticipantFbId].name
	let type = (event.author == event.logMessageData.leftParticipantFbId) ? "có vẻ chán nên đã rời" : "Vừa bị quản trị viên đuổi ra";
	if (type == "có vẻ chán nên đã rời") {
		api.addUserToGroup(event.logMessageData.leftParticipantFbId, event.threadID, (error, info) => {
			if (error) {
				api.sendMessage(`Không thể thêm lại thành viên ${name} vào nhóm :( `, event.threadID)
			} else api.sendMessage(`${name} đã cố gắng trốn khỏi nhóm nhưng không thể thoát được bàn tay của bot :) `, event.threadID);
		})
	}
}