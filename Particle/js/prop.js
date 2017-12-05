var canvas = document.getElementById("particleCanvas");
var context = canvas.getContext("2d");
var particles = [];
var maxParticle = 100;
var maxDistance = 70;

function Particle(x,y){
	this.x = Math.ceil(Math.random()*canvas.width);
	this.y = Math.ceil(Math.random()*canvas.height);
	this.vy = Math.random()*3;
	this.vx = Math.random()*3;
	this.rad = 3;
}
Particle.prototype.draw = function(){
	this.x += this.vx;
	this.y += this.vy;
	context.beginPath();
	context.fillStyle = "blue";
	context.arc(this.x, this.y, this.rad, 0,2*Math.PI);
	context.closePath();
	context.fill();
}
Particle.prototype.drawLine = function(){
	context.beginPath();
	context.fillStyle = "red";
	context.moveTo(this.x, this.y);
	context.lineTo(this.x, this.y);
	context.closePath();
	context.fill();	
}

function summon(){
	for(var i = 0  ;i < maxParticle-1 ; i++){
		particles.push(new Particle());
	}
}
function clear(){
	context.clearRect(0,0,canvas.width,canvas.height);
}
function euclideanDistance(distanceFrom, distanceTo){
	var x = distanceFrom.x - distanceTo.x;
	var y = distanceFrom.y - distanceTo.y;
	var dist = Math.sqrt(x*x + y*y);
	if(dist <= maxDistance){
		//drawLine
		context.beginPath();
		context.moveTo(distanceFrom.x,distanceFrom.y);
		context.lineTo(distanceTo.x, distanceTo.y);
		context.stroke();
		context.closePath;
	}
}
function update(){
	for(var i = 0 ;i < particles.length ; i++){
		if(particles[i].x > canvas.width || particles[i].x < 0){
			particles[i].vx*=-1;
		}
		if(particles[i].y > canvas.height || particles[i].y < 0){
			particles[i].vy*=-1;
		}
		for(var j = i+1 ;j < particles.length ; j++){
			euclideanDistance(particles[i],particles[j]);
		}
	}
}
function rePaint(){
	clear();
	for(var i = 0 ;  i < particles.length ; i++){
		particles[i].draw();
	}
	update();
}
function render(){
	rePaint();
	window.requestAnimationFrame(render);
}
summon();
render();