var marq = document.querySelector('marquee');
var timeStr, stockPriceDelta, stockPriceDirection;
var i = 0;
function updateTimestamp() {
    timeStr = new Date().toLocaleTimeString();
}
function updateStockPrice() {
    stockPriceDelta = Math.floor(Math.random() * 10000) / 100;
    stockPriceDirection = Math.random() < 0.5;
}
function renderMarquee() {
    updateTimestamp();
    if (i % 10 === 0) updateStockPrice();
    var stockPriceArrow = stockPriceDirection ? "&#9650;" : "&#9660;";
    var stockPriceColor = stockPriceDirection ? "green" : "red";
    marq.innerHTML = timeStr + " - FEM <span style=\"color:" + stockPriceColor + ";\">" + stockPriceArrow + " " + stockPriceDelta + "</span>";
    i++;
}
setInterval(renderMarquee, 1000);
renderMarquee();
