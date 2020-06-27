var links = document.querySelectorAll("a");
links.forEach(function (link) {
    link.addEventListener("click", function () {
        var audio = document.createElement("audio");
        audio.style.display = "none";
        audio.src = "assets/click.wav";
        audio.autoplay = true;
        audio.onended = function() {
            audio.remove();
        };
        document.body.appendChild(audio);
    });
});
