// AWS.config.accessKeyId = "AKIAWHAILE56DC2DLME5";
// AWS.config.secretAccessKey = "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";
// AWS.config.region = "us-west-2";

// var polly = new AWS.Polly();

// var params = {
// 	OutputFormat: "mp3",
// 	Text: "Hello Philippe this is working",
// 	TextType: "text",
// 	VoiceId: "Joanna",
// };

// polly.synthesizeSpeech(params, function (err, data) {
// 	if (err) {
// 		// an error occurred
// 		console.log(err, err.stack);
// 	} else {
// 		var uInt8Array = new Uint8Array(data.AudioStream);
// 		var arrayBuffer = uInt8Array.buffer;
// 		var blob = new Blob([arrayBuffer]);

// 		var audio = $("audio");
// 		var url = URL.createObjectURL(blob);
// 		audio[0].src = url;
// 		audio[0].play();
// 	}
// });
