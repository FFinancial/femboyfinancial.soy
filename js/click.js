function playAudio(e) {
    if (e.preventDefault) {
        e.preventDefault();
    }
    var audio = document.createElement("audio");
    audio.style.display = "none";
    audio.src = "assets/click.wav";
    audio.autoplay = true;
    audio.onended = function () {
        audio.remove();
        if (e.target) {
            window.location.href = e.target.href;
        }
    };
    document.body.appendChild(audio);
}

function on(el, event, cb) {
    if (el.addEventListener) {
        el.addEventListener(event, cb, true); 
    } else if (el.attachEvent)  {
        el.attachEvent("on" + event, cb);
    } else {
        el["on" + event] = cb;
    }
}

for (var i = 0; i < document.links.length; i++) {
    var link = document.links[i];
    on(link, "click", playAudio);
}
