<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

<title>KMR Live Ultra</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@300;400;600;700;900&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Cairo',sans-serif;
}

body{
background:#050505;
color:white;
overflow-x:hidden;
min-height:100vh;
}

/* BACKGROUND */

.bg{
position:fixed;
inset:0;
z-index:-2;
background:
radial-gradient(circle at top left,#ff008055,transparent 30%),
radial-gradient(circle at bottom right,#6a00ff55,transparent 30%),
linear-gradient(135deg,#000,#0d0014,#140022);
animation:bgMove 10s infinite alternate;
}

@keyframes bgMove{
from{
filter:hue-rotate(0deg);
}
to{
filter:hue-rotate(20deg);
}
}

/* PARTICLES */

.particles{
position:fixed;
inset:0;
overflow:hidden;
z-index:-1;
}

.particles span{
position:absolute;
display:block;
width:10px;
height:10px;
background:#ffffff22;
border-radius:50%;
animation:float 10s linear infinite;
bottom:-100px;
}

@keyframes float{
0%{
transform:translateY(0) rotate(0);
opacity:0;
}
10%{
opacity:1;
}
100%{
transform:translateY(-1200px) rotate(720deg);
opacity:0;
}
}

/* LOADING */

.loader{
position:fixed;
inset:0;
background:black;
display:flex;
justify-content:center;
align-items:center;
flex-direction:column;
z-index:99999;
animation:hideLoader 4s forwards;
}

.loader-circle{
width:140px;
height:140px;
border-radius:50%;
background:linear-gradient(45deg,#ff0080,#6a00ff);
display:flex;
justify-content:center;
align-items:center;
font-size:70px;
font-weight:900;
box-shadow:0 0 60px #ff00aa;
animation:pulse 1.5s infinite;
}

.loader h1{
margin-top:25px;
font-size:50px;
}

@keyframes pulse{
50%{
transform:scale(1.08);
}
}

@keyframes hideLoader{
90%{
opacity:1;
}
100%{
opacity:0;
visibility:hidden;
}
}

/* NAV */

nav{
position:sticky;
top:0;
z-index:999;
padding:20px 40px;
display:flex;
justify-content:space-between;
align-items:center;
background:rgba(0,0,0,.45);
backdrop-filter:blur(20px);
border-bottom:1px solid rgba(255,255,255,.08);
}

.logo{
display:flex;
align-items:center;
gap:15px;
}

.logo-icon{
width:70px;
height:70px;
border-radius:22px;
background:linear-gradient(45deg,#ff0080,#6a00ff);
display:flex;
justify-content:center;
align-items:center;
font-size:35px;
font-weight:900;
box-shadow:0 0 40px #ff008088;
}

.logo h1{
font-size:36px;
background:linear-gradient(45deg,#ff4db8,#9f5cff);
-webkit-background-clip:text;
-webkit-text-fill-color:transparent;
}

.nav-right{
display:flex;
gap:15px;
align-items:center;
}

.nav-btn{
border:none;
padding:14px 24px;
border-radius:15px;
cursor:pointer;
font-weight:700;
font-size:16px;
color:white;
transition:.3s;
}

.start{
background:linear-gradient(45deg,#ff0080,#6a00ff);
box-shadow:0 0 30px #ff00aa55;
}

.start:hover{
transform:translateY(-4px) scale(1.03);
}

.profile-btn{
background:rgba(255,255,255,.08);
backdrop-filter:blur(10px);
}

/* MAIN */

.main{
padding:30px;
display:grid;
grid-template-columns:2fr 1fr;
gap:25px;
}

/* VIDEO */

.video-box{
background:rgba(255,255,255,.05);
border:1px solid rgba(255,255,255,.08);
border-radius:35px;
overflow:hidden;
backdrop-filter:blur(20px);
box-shadow:0 0 40px rgba(0,0,0,.5);
}

.video-area{
height:620px;
position:relative;
background:black;
display:flex;
justify-content:center;
align-items:center;
overflow:hidden;
}

video{
width:100%;
height:100%;
object-fit:cover;
display:none;
}

.placeholder{
text-align:center;
}

.big-k{
width:200px;
height:200px;
border-radius:50%;
background:linear-gradient(45deg,#ff0080,#6a00ff);
display:flex;
justify-content:center;
align-items:center;
font-size:110px;
font-weight:900;
margin:auto;
box-shadow:0 0 80px #ff00aa88;
animation:pulse 2s infinite;
}

.placeholder h2{
margin-top:25px;
font-size:55px;
}

.placeholder p{
margin-top:10px;
color:#bbb;
}

.live-tag{
position:absolute;
top:20px;
left:20px;
background:red;
padding:10px 20px;
border-radius:50px;
font-weight:700;
display:none;
animation:pulse 1s infinite;
}

.viewer-box{
position:absolute;
top:20px;
right:20px;
background:rgba(0,0,0,.6);
padding:12px 22px;
border-radius:50px;
border:1px solid rgba(255,255,255,.1);
font-weight:700;
}

.timer{
position:absolute;
bottom:20px;
left:20px;
background:rgba(0,0,0,.6);
padding:10px 18px;
border-radius:40px;
font-weight:700;
display:none;
}

.video-controls{
position:absolute;
bottom:20px;
right:20px;
display:flex;
gap:10px;
}

.control{
width:55px;
height:55px;
border-radius:50%;
border:none;
cursor:pointer;
font-size:22px;
background:rgba(255,255,255,.08);
color:white;
backdrop-filter:blur(10px);
transition:.3s;
}

.control:hover{
transform:scale(1.1);
background:linear-gradient(45deg,#ff0080,#6a00ff);
}

/* INFO */

.stream-info{
padding:25px;
display:flex;
justify-content:space-between;
align-items:center;
flex-wrap:wrap;
gap:20px;
}

.profile{
display:flex;
align-items:center;
gap:15px;
}

.avatar{
width:80px;
height:80px;
border-radius:50%;
background:linear-gradient(45deg,#ff0080,#6a00ff);
box-shadow:0 0 30px #ff00aa55;
}

.profile h2{
font-size:30px;
}

.actions{
display:flex;
gap:12px;
flex-wrap:wrap;
}

.actions button{
border:none;
padding:14px 24px;
border-radius:16px;
font-weight:700;
cursor:pointer;
color:white;
transition:.3s;
}

.follow{
background:#ff0080;
}

.like{
background:#6a00ff;
}

.share{
background:rgba(255,255,255,.08);
}

.actions button:hover{
transform:translateY(-4px);
}

/* CHAT */

.chat-box{
background:rgba(255,255,255,.05);
border:1px solid rgba(255,255,255,.08);
border-radius:35px;
padding:20px;
height:860px;
display:flex;
flex-direction:column;
backdrop-filter:blur(20px);
}

.chat-top{
display:flex;
justify-content:space-between;
align-items:center;
margin-bottom:20px;
}

.online{
padding:10px 18px;
border-radius:40px;
background:rgba(0,255,100,.1);
border:1px solid #00ff99;
color:#00ff99;
font-weight:700;
}

.messages{
flex:1;
overflow:auto;
display:flex;
flex-direction:column;
gap:15px;
padding-right:5px;
}

.messages::-webkit-scrollbar{
width:5px;
}

.messages::-webkit-scrollbar-thumb{
background:#ff0080;
border-radius:20px;
}

.msg{
background:rgba(255,255,255,.05);
padding:15px;
border-radius:18px;
border:1px solid rgba(255,255,255,.05);
animation:msg .3s ease;
}

@keyframes msg{
from{
opacity:0;
transform:translateY(15px);
}
to{
opacity:1;
transform:translateY(0);
}
}

.msg b{
color:#ff4db8;
}

.chat-input{
display:flex;
gap:10px;
margin-top:20px;
}

.chat-input input{
flex:1;
padding:16px;
border:none;
border-radius:15px;
background:rgba(255,255,255,.06);
color:white;
outline:none;
}

.chat-input button{
padding:16px 26px;
border:none;
border-radius:15px;
background:linear-gradient(45deg,#ff0080,#6a00ff);
color:white;
font-weight:700;
cursor:pointer;
}

/* CARDS */

.streams{
padding:30px;
}

.streams h1{
margin-bottom:20px;
}

.cards{
display:grid;
grid-template-columns:repeat(auto-fit,minmax(260px,1fr));
gap:20px;
}

.card{
background:rgba(255,255,255,.05);
border:1px solid rgba(255,255,255,.08);
border-radius:30px;
overflow:hidden;
transition:.3s;
cursor:pointer;
}

.card:hover{
transform:translateY(-10px) scale(1.02);
box-shadow:0 0 40px #ff00aa44;
}

.card-top{
height:220px;
display:flex;
justify-content:center;
align-items:center;
font-size:80px;
position:relative;
background:linear-gradient(45deg,#ff0080,#6a00ff,#000);
}

.small-live{
position:absolute;
top:15px;
left:15px;
background:red;
padding:6px 14px;
border-radius:20px;
font-size:14px;
font-weight:700;
}

.card-body{
padding:20px;
}

/* DONATION */

.donation{
position:fixed;
top:100px;
right:30px;
background:rgba(0,0,0,.7);
padding:15px 25px;
border-radius:20px;
border:1px solid rgba(255,255,255,.08);
display:none;
z-index:9999;
animation:don .4s ease;
}

@keyframes don{
from{
opacity:0;
transform:translateX(100px);
}
to{
opacity:1;
transform:translateX(0);
}
}

/* TOAST */

.toast{
position:fixed;
bottom:30px;
right:30px;
background:linear-gradient(45deg,#ff0080,#6a00ff);
padding:15px 25px;
border-radius:16px;
font-weight:700;
opacity:0;
transition:.4s;
z-index:99999;
}

/* FOOTER */

footer{
margin-top:40px;
padding:40px;
text-align:center;
color:#888;
border-top:1px solid rgba(255,255,255,.08);
}

/* MOBILE */

@media(max-width:1100px){

.main{
grid-template-columns:1fr;
}

.video-area{
height:400px;
}

.chat-box{
height:500px;
}

nav{
padding:20px;
}

.logo h1{
font-size:26px;
}

}

</style>
</head>

<body>

<div class="bg"></div>

<div class="particles" id="particles"></div>

<div class="loader">
<div class="loader-circle">K</div>
<h1>KMR LIVE</h1>
</div>

<div class="toast" id="toast"></div>

<div class="donation" id="donation"></div>

<nav>

<div class="logo">

<div class="logo-icon">
K
</div>

<div>
<h1>KMR Live</h1>
<p>Ultra Streaming Platform</p>
</div>

</div>

<div class="nav-right">

<button class="nav-btn profile-btn">
👑 VIP
</button>

<button class="nav-btn start" onclick="toggleLive()" id="liveBtn">
🔴 ابدأ البث
</button>

</div>

</nav>

<div class="main">

<div>

<div class="video-box">

<div class="video-area">

<div class="live-tag" id="liveTag">
● LIVE
</div>

<div class="viewer-box">
👁 <span id="viewers">1245</span>
</div>

<div class="timer" id="timerBox">
⏱ <span id="timer">00:00</span>
</div>

<div class="video-controls">

<button class="control" onclick="toggleMic()">
🎤
</button>

<button class="control" onclick="toggleCam()">
📷
</button>

<button class="control" onclick="fullscreenVideo()">
⛶
</button>

</div>

<div class="placeholder" id="placeholder">

<div class="big-k">
K
</div>

<h2>KMR STREAM</h2>

<p>
ابدأ البث وعيش تجربة ستريمنج احترافية 🔥
</p>

</div>

<video autoplay muted playsinline id="video"></video>

</div>

<div class="stream-info">

<div class="profile">

<div class="avatar"></div>

<div>
<h2>Rayan Gamer</h2>
<p>
<span id="followers">106,345</span>
متابع
</p>
</div>

</div>

<div class="actions">

<button class="follow" onclick="follow()">
🔥 متابعة
</button>

<button class="like" onclick="like()">
❤️ <span id="likes">45673</span>
</button>

<button class="share" onclick="shareStream()">
📤 مشاركة
</button>

</div>

</div>

</div>

<div class="streams">

<h1>
🔥 البثوث المقترحة
</h1>

<div class="cards">

<div class="card">

<div class="card-top">

<div class="small-live">
LIVE
</div>

🎮

</div>

<div class="card-body">
<h2>Gaming Pro</h2>
<p>👁 12K مشاهدة</p>
</div>

</div>

<div class="card">

<div class="card-top">

<div class="small-live">
LIVE
</div>

🎥

</div>

<div class="card-body">
<h2>Movie Live</h2>
<p>👁 8K مشاهدة</p>
</div>

</div>

<div class="card">

<div class="card-top">

<div class="small-live">
LIVE
</div>

🎯

</div>

<div class="card-body">
<h2>Sniper King</h2>
<p>👁 18K مشاهدة</p>
</div>

</div>

</div>

</div>

</div>

<div class="chat-box">

<div class="chat-top">

<h1>
💬 الشات المباشر
</h1>

<div class="online">
متصل الآن
</div>

</div>

<div class="messages" id="messages">

<div class="msg">
<b>KMR BOT:</b>
أهلاً بك في أقوى منصة بث مباشر 🔥
</div>

</div>

<div class="chat-input">

<input
type="text"
id="messageInput"
placeholder="اكتب رسالة..."
>

<button onclick="sendMessage()">
إرسال
</button>

</div>

</div>

</div>

<footer>

<h2>KMR LIVE ULTRA</h2>

<p> منصة بثوث احترافية تقدم لكم تجربة ممتعة
</p>

</footer>

<script>

let isLive = false;
let currentStream = null;
let seconds = 0;
let timerInterval;
let micEnabled = true;
let camEnabled = true;

/* PARTICLES */

const particles = document.getElementById('particles');

for(let i=0;i<40;i++){

const span = document.createElement('span');

span.style.left = Math.random()*100 + '%';
span.style.width = Math.random()*15 + 'px';
span.style.height = span.style.width;
span.style.animationDuration =
Math.random()*10+5+'s';

span.style.animationDelay =
Math.random()*5+'s';

particles.appendChild(span);

}

/* TOAST */

function toast(text){

const toast =
document.getElementById('toast');

toast.innerText = text;

toast.style.opacity = '1';

setTimeout(()=>{
toast.style.opacity = '0';
},2500);

}

/* TIMER */

function startTimer(){

timerInterval = setInterval(()=>{

seconds++;

let mins =
Math.floor(seconds/60);

let secs =
seconds % 60;

document.getElementById('timer')
.innerText =
`${String(mins).padStart(2,'0')}:${String(secs).padStart(2,'0')}`;

},1000);

}

function stopTimer(){

clearInterval(timerInterval);

seconds = 0;

document.getElementById('timer')
.innerText = '00:00';

}

/* LIVE */

async function toggleLive(){

const video =
document.getElementById('video');

const placeholder =
document.getElementById('placeholder');

const liveTag =
document.getElementById('liveTag');

const liveBtn =
document.getElementById('liveBtn');

const timerBox =
document.getElementById('timerBox');

if(!isLive){

try{

currentStream =
await navigator.mediaDevices.getUserMedia({

video:true,
audio:true

});

video.srcObject = currentStream;

video.style.display = 'block';

placeholder.style.display = 'none';

liveTag.style.display = 'block';

timerBox.style.display = 'block';

liveBtn.innerText = '⛔ إنهاء البث';

isLive = true;

startTimer();

toast('🔴 تم بدء البث');

}catch(err){

alert('لا يمكن تشغيل الكاميرا');

}

}else{

currentStream
.getTracks()
.forEach(track=>track.stop());

video.style.display = 'none';

placeholder.style.display = 'block';

liveTag.style.display = 'none';

timerBox.style.display = 'none';

liveBtn.innerText = '🔴 ابدأ البث';

isLive = false;

stopTimer();

toast('⛔ تم إنهاء البث');

}

}

/* CHAT */

function sendMessage(){

const input =
document.getElementById('messageInput');

const messages =
document.getElementById('messages');

if(input.value.trim()==='') return;

const div =
document.createElement('div');

div.className = 'msg';

div.innerHTML =
`<b>أنت:</b> ${input.value}`;

messages.appendChild(div);

messages.scrollTop =
messages.scrollHeight;

input.value = '';

}

/* LIKE */

function like(){

const likes =
document.getElementById('likes');

likes.innerText =
parseInt(likes.innerText)+1;

toast('❤️ تم الإعجاب');

}

/* FOLLOW */

function follow(){

const followers =
document.getElementById('followers');

followers.innerText =
parseInt(
followers.innerText
.replace(',','')
)+1;

toast('🔥 تمت المتابعة');

}

/* SHARE */

function shareStream(){

navigator.clipboard.writeText(
window.location.href
);

toast('📤 تم نسخ رابط البث');

}

/* FULLSCREEN */

function fullscreenVideo(){

const area =
document.querySelector('.video-area');

if(area.requestFullscreen){

area.requestFullscreen();

}

}

/* MIC */

function toggleMic(){

if(!currentStream) return;

micEnabled = !micEnabled;

currentStream
.getAudioTracks()
.forEach(track=>{
track.enabled = micEnabled;
});

toast(
micEnabled ?
'🎤 تم تشغيل المايك'
:
'🔇 تم كتم المايك'
);

}

/* CAMERA */

function toggleCam(){

if(!currentStream) return;

camEnabled = !camEnabled;

currentStream
.getVideoTracks()
.forEach(track=>{
track.enabled = camEnabled;
});

toast(
camEnabled ?
'📷 تم تشغيل الكاميرا'
:
'📵 تم إيقاف الكاميرا'
);

}

/* VIEWERS */

setInterval(()=>{

const viewers =
document.getElementById('viewers');

let number =
parseInt(viewers.innerText);

number +=
Math.floor(Math.random()*20)-10;

if(number < 100){

number = 100;

}

viewers.innerText = number;

},3000);

/* BOT */

const botMessages = [

'🔥 البث نار',
'👑 أفضل ستريمر',
'🚀 استمر',
'❤️ جامد',
'🎮 لعب فاجر',
'😱 واااو',
'🔥🔥🔥'

];

setInterval(()=>{

const messages =
document.getElementById('messages');

const div =
document.createElement('div');

div.className = 'msg';

div.innerHTML =
`<b>KMR BOT:</b>
${
botMessages[
Math.floor(
Math.random()*
botMessages.length
)
]
}`;

messages.appendChild(div);

messages.scrollTop =
messages.scrollHeight;

},9000);

/* DONATIONS */

const names = [

'Ahmed',
'Mohamed',
'KMR Fan',
'Player X',
'Rayan'

];

setInterval(()=>{

const donation =
document.getElementById('donation');

const randomName =
names[
Math.floor(
Math.random()*names.length
)
];

const amount =
Math.floor(
Math.random()*100
)+1;

donation.innerHTML =
`🔥 ${randomName}
أرسل ${amount}$`;

donation.style.display='block';

setTimeout(()=>{

donation.style.display='none';

},4000);

},12000);

</script>

</body>
</html>
