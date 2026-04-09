document.addEventListener("DOMContentLoaded", function () {

    const voiceBtn = document.getElementById("voiceBtn");
    const searchBox = document.getElementById("searchBox");

    if ('webkitSpeechRecognition' in window) {

        const recognition = new webkitSpeechRecognition();
        recognition.continuous = false;
        recognition.lang = "en-US";

        voiceBtn.onclick = function () {
            console.log("Clicked");
            recognition.start();
        };

        recognition.onstart = function () {
            console.log("Voice started");
        };

        recognition.onresult = function (event) {
            const transcript = event.results[0][0].transcript;
            searchBox.value = transcript;
            searchBox.form.submit();
        };

        recognition.onerror = function (event) {
            console.log("ERROR:", event.error);
        };

    } else {
        voiceBtn.onclick = function () {
            alert("Voice search not supported");
        };
    }

});