
<script>
window.clickgotohome = function(){
	window.location.replace(location.protocol+"//y.qq.com");
}
var timer = 6;
setInterval(function(){
	timer--;
	if (timer<0)
	{
		clickgotohome();
	}
	document.getElementById('timer').innerHTML = timer;
}, 1000);
</script>

